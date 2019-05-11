package controllers;

import beans.Availability;
import beans.User;
import beans.DateMatch;
import jdbc.DBManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import javax.servlet.annotation.WebServlet;
import java.text.SimpleDateFormat;
import java.util.TimeZone;
import java.util.Locale;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/restaurant")
public class Restaurant extends HttpServlet {
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        try
        {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            if(user == null)
            {
              response.sendRedirect("/");
            }
            else if (user.isLoggedIn())
            {
              Boolean inserted = false;
              Boolean updated = false;
              Availability availability = new Availability();
              Locale locale = new Locale("es", "ES");
              SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locale);
              TimeZone timeZone = TimeZone.getTimeZone("Etc/GMT+1");
              List<DateMatch> confirmedDates = new ArrayList<DateMatch>();
              int pendingDates = 0;

              dateFormat.setTimeZone(timeZone);

              Date nowDate = new Date();

              try (DBManager db = new DBManager())
              {
                  confirmedDates = db.getConfirmedDateList(nowDate);
                  request.setAttribute("confirmedDates", confirmedDates);
              }
              catch (SQLException ex)
              {
                  ex.printStackTrace();
              }

              if (request.getParameter("dateInsert") != null)
              {
                Date date = dateFormat.parse(request.getParameter("dateInsert"));
                int tables = Integer.parseInt(request.getParameter("tablesInsert"));

                try (DBManager db = new DBManager())
                {
                    availability = db.searchAvailability(date);
                }
                catch (SQLException ex)
                {
                    ex.printStackTrace();
                }

                if (availability == null)
                {
                  Availability availability2 = new Availability();
                  availability2.setDate(date);
                  availability2.setOfferedTables(tables);
                  availability2.setAvailableTables(tables);

                  try (DBManager db = new DBManager())
                  {
                      inserted = db.insertAvailability(availability2);
                      System.out.println("Availability inserted: " + inserted);
                  }
                  catch (SQLException ex)
                  {
                      ex.printStackTrace();
                  }

                  if (inserted)
                  {
                    request.setAttribute("successInsertion", "¡Mesas registradas para el dia "+request.getParameter("dateInsert")+" con éxito!");
                  }
                  else
                  {
                    request.setAttribute("errorInsertion", "¡No se han podido insertar las mesas para el día "+request.getParameter("dateInsert")+"!");
                  }
                }
                else
                {
                  request.setAttribute("errorInsertion", "¡Ya hay mesas registradas para el día "+request.getParameter("dateInsert")+"!"+"<br>Si quiere puede editar las mesas de este día.");
                }
              }
              else if (request.getParameter("dateSearch") != null)
              {
                Date date = dateFormat.parse(request.getParameter("dateSearch"));

                try (DBManager db = new DBManager())
                {
                    availability = db.searchAvailability(date);
                    pendingDates = db.getCountPendingDates(date);
                }
                catch (SQLException ex)
                {
                    ex.printStackTrace();
                }

                if (availability != null)
                {
                  request.setAttribute("successSearch", "Estas son las mesas registradas para el día "+request.getParameter("dateSearch")+":<br>Mesas ofrecidas: "+availability.getOfferedTables()+"<br>Mesas disponibles: "+availability.getAvailableTables()+"<br>Citas pendientes de confirmación: "+pendingDates);
                }
                else
                {
                  request.setAttribute("errorSearch", "¡No hay ninguna mesa registrada para el día "+request.getParameter("dateSearch")+"!");
                }
              }
              else if (request.getParameter("dateUpdate") != null)
              {
                Date date = dateFormat.parse(request.getParameter("dateUpdate"));
                int tables = Integer.parseInt(request.getParameter("tablesUpdate"));
                Availability availability3 = new Availability();
                Boolean confirmedFound = false;

                availability.setDate(date);
                availability.setOfferedTables(tables);
                availability.setAvailableTables(tables);

                try (DBManager db = new DBManager())
                {
                    availability3 = db.searchAvailability(date);

                    if(availability3 != null)
                    {
                      if (availability3.getOfferedTables() == availability3.getAvailableTables())
                      {
                        try (DBManager database = new DBManager())
                        {
                            updated = database.updateAvailability(availability);
                            System.out.println("Availability updated: " + updated);
                        }
                        catch (SQLException ex)
                        {
                            ex.printStackTrace();
                        }
                      }
                      else
                      {
                        confirmedFound = true;
                        request.setAttribute("errorUpdate", "¡No se han podido editar las mesas porque ya hay mesas reservadas para el día "+request.getParameter("dateUpdate")+"!");
                      }
                    }

                }
                catch (SQLException ex)
                {
                    ex.printStackTrace();
                }

                if (updated)
                {
                  request.setAttribute("successUpdate", "¡Mesas editadas para el día "+request.getParameter("dateUpdate")+" con éxito!");
                }
                else if(!updated && !confirmedFound)
                {
                  request.setAttribute("errorUpdate", "¡No se han podido editar las mesas porque no hay ninguna mesa registrada para el día "+request.getParameter("dateUpdate")+"!");
                }
              }

              RequestDispatcher rd = request.getRequestDispatcher("/restaurant.jsp");
              rd.forward(request, response);
            }
            else
            {
              response.sendRedirect("/");
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            request.setAttribute("errorRestaurant", "¡Ha ocurrido un error en el servidor!");
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
            rd.forward(request, response);
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        processRequest(request, response);
    }
}

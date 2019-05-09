package controllers;

import beans.User;
import jdbc.DBManager;
import security.BCrypt;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.TimeZone;
import java.util.Locale;

public class ServletRegister extends HttpServlet {
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
            User user = new User();
            String password = request.getParameter("password");
            String password2 = request.getParameter("password2");

            Locale locale = new Locale("es", "ES");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locale);
            TimeZone timeZone = TimeZone.getTimeZone("Etc/GMT+1");

            dateFormat.setTimeZone(timeZone);

            if (password2.equals(password))
            {
                String generatedSecuredPasswordHash = BCrypt.hashpw(password, BCrypt.gensalt(12));

                try (DBManager db = new DBManager())
                {
                  user = db.searchUser(request.getParameter("username"));
                }
                catch(SQLException e)
                {
                    e.printStackTrace();
                }

                if (user.getUsername() == null)
                {
                    user.setUsername(request.getParameter("username"));
                    user.setName(request.getParameter("name"));
                    user.setPassword(generatedSecuredPasswordHash);
                    user.setGender(request.getParameter("gender"));
                    user.setBirthdate(dateFormat.parse(request.getParameter("birthdate")));

                    try (DBManager db = new DBManager())
                    {
                        Boolean registered = db.registerUser(user);
                        System.out.println("Registered user: "+registered);
                    }
                    catch(SQLException e)
                    {
                        e.printStackTrace();
                    }
                }
                else
                {
                  request.setAttribute("errorRegister", "Nombre de usuario no disponible");
                  RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
                  rd.forward(request, response);
                }

                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            }
            else
            {
                request.setAttribute("errorRegister", "Contraseña repetida mal introducida");
                RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
                rd.forward(request, response);
            }

        }
        catch(Exception ex)
        {
            request.setAttribute("errorRegister", "Ha ocurrido un error en el registro");
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
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

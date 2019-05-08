package controllers;

import beans.Availability;
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
            Availability availability = new Availability();
            Locale locale = new Locale("es", "ES");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locale);
            TimeZone timeZone = TimeZone.getTimeZone("Etc/GMT+1");

            dateFormat.setTimeZone(timeZone);

            Date date = dateFormat.parse(request.getParameter("date"));
            int tables = Integer.parseInt(request.getParameter("tables"));

            System.out.println(tables);
            //
            // try (DBManager db = new DBManager())
            // {
            //     user = db.searchUser(entryUsername);
            // }
            // catch (SQLException ex)
            // {
            //     // Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
            //     ex.printStackTrace();
            // }
            // RequestDispatcher rd = request.getRequestDispatcher("/restaurant.jsp");
            // rd.forward(request, response);

        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            request.setAttribute("errorRestaurant", "Ha ocurrido un error en el restaurante");
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
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

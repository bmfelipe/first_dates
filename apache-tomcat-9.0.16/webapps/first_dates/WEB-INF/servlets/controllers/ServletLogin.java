package controllers;

import jdbc.DBManager;
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

public class ServletLogin extends HttpServlet {
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
            String dbPassword = null;
            String entryUsername = request.getParameter("username");
            String entryPassword = request.getParameter("password");

            PrintWriter out = response.getWriter();

            try (DBManager db = new DBManager())
            {
                dbPassword = db.searchUserPassword(entryUsername);
                out.println(dbPassword);
            }
            catch (SQLException ex)
            {
                //Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
                ex.printStackTrace();
            }

            if (entryPassword.equals(dbPassword))
            {
                HttpSession session = request.getSession();
                session.setAttribute("username", entryUsername);
                session.setMaxInactiveInterval(Integer.MAX_VALUE);
                RequestDispatcher rd = request.getRequestDispatcher("/iniPage.jsp");
                rd.forward(request, response);
            }
            else
            {
                request.setAttribute("errorLogin", "Email o contraseña incorrectos");
                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            }
        }
        catch(Exception ex)
        {
            request.setAttribute("errorLogin", "Ha ocurrido un error en el login");
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
        processRequest(request, response);
    }
}

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
import javax.servlet.http.Cookie;
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
            User user = new User();
            String entryUsername = request.getParameter("username");
            String entryPassword = request.getParameter("password");

            try (DBManager db = new DBManager())
            {
                user = db.searchUser(entryUsername);
            }
            catch (SQLException ex)
            {
                // Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
                ex.printStackTrace();
            }

            if(user.getPassword() != null){
                if (BCrypt.checkpw(entryPassword, user.getPassword()))
                {
                    if (request.getParameter("remember") != null) {
                      String remember = request.getParameter("remember");
                      System.out.println("remember : " + remember);
                      Cookie cUsername = new Cookie("cookuser", entryUsername);
                      Cookie cPassword = new Cookie("cookpass", entryPassword);
                      Cookie cRemember = new Cookie("cookrem", remember);
                      cUsername.setMaxAge(60 * 60 * 24 * 15);//15 days
                      cPassword.setMaxAge(60 * 60 * 24 * 15);
                      cRemember.setMaxAge(60 * 60 * 24 * 15);
                      response.addCookie(cUsername);
                      response.addCookie(cPassword);
                      response.addCookie(cRemember);
                    }
                    HttpSession session = request.getSession();
                    user.setLoggedIn(true);
                    session.setAttribute("user", user);
                    session.setMaxInactiveInterval(Integer.MAX_VALUE);
                    response.sendRedirect("/first_dates/home");
                }
                else
                {
                    request.setAttribute("errorLogin", "Email o contraseña incorrectos");
                    RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                    rd.forward(request, response);
                }
            }
            else{
                request.setAttribute("errorLogin", "Email o contraseña incorrectos");
                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
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

package controllers;

import beans.User;
import beans.DateMatch;
import jdbc.DBManager;
import java.sql.SQLException;
import java.util.List;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
import javax.naming.NamingException;

@WebServlet("/login")
public class Login extends HttpServlet {

    /**
     * Método del servlet que responde a una petición GET.
     *
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
      try
      {
        request.setCharacterEncoding("utf-8");
        RequestDispatcher rd = request.getRequestDispatcher ("/WEB-INF/jsp/index.jsp");
        rd.forward(request, response);
      }
      catch(Exception e)
      {
        e.printStackTrace();
        response.sendRedirect("/errorPage.jsp");
      }
    }
}

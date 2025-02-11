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

@WebServlet("/root")
public class Root extends HttpServlet {

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

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if(user == null)
        {
          response.sendRedirect("/login");
        }
        else if (user.isLoggedIn() && user.getRole().equals("Admin"))
        {
          response.sendRedirect("/restaurant");
        }
        else
        {
          response.sendRedirect("/home");
        }
      }
      catch(Exception e)
      {
        e.printStackTrace();
        response.sendRedirect("/errorPage.jsp");
      }
    }
}

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

@WebServlet("/profile-redirect")
public class ProfileRedirect extends HttpServlet {

    /**
     * Método del servlet que responde a una petición GET.
     *
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
      request.setCharacterEncoding("utf-8");

      HttpSession session = request.getSession();
      User user = (User) session.getAttribute("user");

      if(user == null)
      {
        response.sendRedirect("/login");
      }
      else if (user.isLoggedIn())
      {
        if(user.getRole().equals("Admin"))
        {
          response.sendRedirect("/restaurant");
        }
        else
        {
          RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/config.jsp");
          rd.forward(request, response);
        }
      }
      else
      {
        response.sendRedirect("/login");
      }
    }
  }

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

@WebServlet("/date")
public class Date extends HttpServlet {

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
        if(user == null){
          response.sendRedirect("/");
        }else if(user.isLoggedIn()){
          System.out.println("Test");
          int dateId = Integer.parseInt(request.getParameter("id").trim());
          try(DBManager db = new DBManager()){
              System.out.println("Test "+dateId);
              User date = db.getUserInfo(dateId);
              DateMatch dateInfo = db.getDateInfo(user.getId(),dateId);
              request.setAttribute("date",date);
              request.setAttribute("dateInfo",dateInfo);

          }catch (SQLException|NamingException e){
              e.printStackTrace();//Send re
              // response.sendRedirect("/internalError");
          }
          RequestDispatcher rd = request.getRequestDispatcher ("/WEB-INF/jsp/date.jsp");
          rd.forward(request, response);
        }else{
          response.sendRedirect("/");
        }



    }
}

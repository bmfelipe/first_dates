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
import java.util.Date;

@WebServlet("/date")
public class Dates extends HttpServlet {

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
        }else if(user.isLoggedIn() && user.getStatus().equals("Usuario")){
          int dateId = Integer.parseInt(request.getParameter("id").trim());
          try(DBManager db = new DBManager()){
              User date = db.getUserInfo(dateId);
              DateMatch dateInfo = db.getDateInfo(user.getId(),dateId);
              List<Date> availableDates = db.getAvailableDates();
              request.setAttribute("availableDates",availableDates);
              request.setAttribute("date",date);
              request.setAttribute("dateInfo",dateInfo);

          }catch (SQLException|NamingException e){
              e.printStackTrace();//Send re
              response.sendRedirect("/errorPage.jsp");
              // response.sendRedirect("/internalError");
          }
          RequestDispatcher rd = request.getRequestDispatcher ("/WEB-INF/jsp/date.jsp");
          rd.forward(request, response);
        }else{
          response.sendRedirect("/");
        }



    }
}

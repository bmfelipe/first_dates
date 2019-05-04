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

@WebServlet("/home")
public class Home extends HttpServlet {

    /**
     * Método del servlet que responde a una petición GET.
     *
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
          response.sendRedirect("/first_dates/ServletLogin");
        }else if(user.isLoggedIn()){
          try(DBManager db = new DBManager()){
              List<User> recommendations = db.getRecommendations(user.getId());
              request.setAttribute("recommendations",recommendations);
              List<DateMatch> dates = db.getDateList(user.getId());
              request.setAttribute("dates",dates);

              RequestDispatcher rd = request.getRequestDispatcher ("/WEB-INF/jsp/home.jsp");
              rd.forward(request, response);

          }catch (SQLException e){
              e.printStackTrace();
          }

        }else{
          response.sendRedirect("/first_dates/ServletLogin");
        }



    }
}

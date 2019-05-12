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

@WebServlet("/home")
public class Home extends HttpServlet {

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
        }else if(user.isLoggedIn() && user.getRole().equals("Usuario")){
          try(DBManager db = new DBManager()){
              List<User> recommendations = db.getRecommendations(user.getId());
              request.setAttribute("recommendations",recommendations);
              List<DateMatch> dates = db.getDateList(user.getId());
              request.setAttribute("dates",dates);
              DateMatch dateMatch = new DateMatch();
              dateMatch = db.getDaysUntilDate(user.getId());
              User date = new User();
              if(dateMatch.getDaysUntilDate() != -1){
                if(user.getId() == dateMatch.getDateOneId()){
                  date = db.getUserInfo(dateMatch.getDateTwoId());
                }else{
                  date = db.getUserInfo(dateMatch.getDateOneId());
                }

                request.setAttribute("userDateInfo", date);
              }
              request.setAttribute("dateInfo", dateMatch);




          }catch (SQLException|NamingException e){
              e.printStackTrace();//Send re
              response.sendRedirect("/errorPage.jsp");
          }

          RequestDispatcher rd = request.getRequestDispatcher ("/WEB-INF/jsp/home.jsp");
          rd.forward(request, response);

        }else{
          response.sendRedirect("/");
        }
    }
}

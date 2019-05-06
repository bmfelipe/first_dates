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

@WebServlet("/add-like")
public class AddLike extends HttpServlet {

    /**
     * Método del servlet que responde a una petición GET.
     *
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        if(user == null){
          response.sendRedirect("/");
        }else if(user.isLoggedIn()){
          try(DBManager db = new DBManager()){
              int recomendationId = Integer.parseInt(request.getParameter("recommendationId"));
              Boolean control = db.addLike(user.getId(), recomendationId);
              if(control == false){
                response.sendError(500);
              }else{
                response.setStatus(200);
              }

          }catch (SQLException e){
              e.printStackTrace();
          }

        }else{
          response.sendRedirect("/");
        }



    }
}

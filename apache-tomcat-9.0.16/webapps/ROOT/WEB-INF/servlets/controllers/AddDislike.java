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

@WebServlet("/add-dislike")
public class AddDislike extends HttpServlet {

    /**
     * Método del servlet que responde a una petición GET.
     *
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
      try{
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        if(user == null){
          response.sendRedirect("/");
        }else if(user.isLoggedIn() && user.getRole().equals("Usuario")){
          try(DBManager db = new DBManager()){
              int recomendationId = Integer.parseInt(request.getParameter("recommendationId").trim());
              Boolean control = db.addDislike(user.getId(), recomendationId);
              if(control == false){
                response.sendError(500);
              }else{
                response.setStatus(200);
              }

          }catch (SQLException|NamingException e){
              e.printStackTrace();

              response.sendRedirect("/errorPage.jsp");
          }

        }else{
          response.sendRedirect("/");
        }

      }catch(Exception e){
        e.printStackTrace();
        response.sendRedirect("/errorPage.jsp");
      }

    }
}

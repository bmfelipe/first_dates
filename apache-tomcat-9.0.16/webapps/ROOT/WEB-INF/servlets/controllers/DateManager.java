package controllers;

import beans.User;
import beans.DateMatch;
import jdbc.DBManager;
import java.text.SimpleDateFormat;
import java.sql.SQLException;
import java.util.List;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
import javax.naming.NamingException;
import java.util.Date;

@WebServlet("/date-manager")
public class DateManager extends HttpServlet {

    /**
     * Método del servlet que responde a una petición GET.
     *
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
      try{
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if(user == null){
          response.sendRedirect("/");
        }else if(user.isLoggedIn() && user.getRole().equals("Usuario")){
          String confirm =  request.getParameter("result");
          int dateId = Integer.parseInt(request.getParameter("id").trim());

          try(DBManager db = new DBManager()){

              Boolean result = db.acceptRefuseDate(dateId, confirm, user.getId());


          }catch (SQLException|NamingException e){
              //Send re
              e.printStackTrace();
              response.sendRedirect("/errorPage.jsp");
          }

          response.sendRedirect("/home");

          // response.sendRedirect ("/date?id="+dateUserId);

        }else{
          response.sendRedirect("/");
        }
      }catch(Exception e){
        e.printStackTrace();
        response.sendRedirect("/errorPage.jsp");
      }
    }
}

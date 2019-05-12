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

@WebServlet("/add-dates")
public class AddDate extends HttpServlet {

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
            String confirm =  request.getParameter("confirm");
            if(confirm.equals("true")){
              try(DBManager db = new DBManager()){
                  int dateId = Integer.parseInt(request.getParameter("id").trim());
                  String dateStr = request.getParameter("dates");

                  List<Date> dates = new ArrayList<Date>();
                    try{
                      Date date  =new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);

                      dates.add(date);
                    }catch(Exception e){
                      e.printStackTrace();
                    }
                  Boolean result = db.addDateDate(dateId, dates, user.getId());


              }catch (SQLException|NamingException e){
                  //Send re
                  e.printStackTrace();
                  response.sendRedirect("/errorPage.jsp");
              }
            }else{
              try(DBManager db = new DBManager()){
                  int dateId = Integer.parseInt(request.getParameter("id").trim());
                  String datesStr = request.getParameter("dates");
                  String[] datesLst = datesStr.split(",");

                  List<Date> dates = new ArrayList<Date>();
                  for(String dateStr : datesLst){
                    try{
                      System.out.println(dateStr);
                      Date date  =new SimpleDateFormat("dd-MM-yyyy").parse(dateStr);
                      dates.add(date);
                    }catch(Exception e){}


                  }

                  boolean result = db.addDateDate(dateId, dates, user.getId());


              }catch (SQLException|NamingException e){
                  e.printStackTrace();//Send re
                  response.sendRedirect("/errorPage.jsp");
              }
            }


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

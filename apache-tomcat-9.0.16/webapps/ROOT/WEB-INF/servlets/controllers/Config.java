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

@WebServlet("/config")
public class Config extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{

		try{
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			//Parameters
			//String name = request.getParameter("name");
			int minAge = request.getParameter("minAge");
			int maxAge = request.getParameter("maxAge");
			String sexPref= request.getParameter("gender");

			boolean updated=false;

			try(DBManager db = new DBManager()){
				updated=db.updatePreferences(user.getId(),minAge,maxAge,sexPref);
				if(updated==false){
					request.setAttribute("errorConfiguracion", "No se han podido guardar los cambios");
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp");
					rd.forward(request, response);
				}else{
					request.setAttribute("successConfiguracion", "Se han guardado tus preferencias");
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp");
					rd.forward(request, response);
				}

			}catch (SQLException|NamingException e){
              e.printStackTrace();//Send re
              request.setAttribute("errorRegister", "Ha ocurrido un error en el registro");
              RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp");
              rd.forward(request, response);
          }


      }catch (SQLException|NamingException e){
              e.printStackTrace();//Send re
              response.sendRedirect("/internalError");
          }



  }//Post
}//class

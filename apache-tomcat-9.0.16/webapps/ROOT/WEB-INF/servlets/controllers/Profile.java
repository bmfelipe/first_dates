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

@WebServlet("/profile")
public class Profile extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int profileId = Integer.parseInt(request.getParameter("id"));
		System.out.println("Debug : "+ profileId);

		try(DBManager db = new DBManager()){
			List<DateMatch> mutual_dates = db.getProfileDateList(user.getId(),profileId);
			request.setAttribute("mutual_dates",mutual_dates);
			User target_profile = db.searchUserById(profileId);
			//System.out.println("Debuug: "+target_profile.getId());
			request.setAttribute("target_profile",target_profile);
			RequestDispatcher rd = request.getRequestDispatcher ("/profile.jsp");
			rd.forward(request, response);

		}catch (SQLException|NamingException e){
              e.printStackTrace();//Send re
              response.sendRedirect("/internalError");
          }



      }
}

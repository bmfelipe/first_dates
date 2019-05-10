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
		String auxId=request.getParameter("id");
		int profileId;
		if(auxId!=null){
			profileId = Integer.parseInt(request.getParameter("id").trim());
		}
		
		String own_profile;
		
		try(DBManager db = new DBManager()){
			if(auxId==null){
				own_profile="true";
				request.setAttribute("own_profile",own_profile);
				request.setAttribute("target_profile",user);
				List<DateMatch> mutual_dates = db.getDateList(user.getId());
				request.setAttribute("mutual_dates",mutual_dates);
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp");
				rd.forward(request, response);
			}else{
				own_profile="false";
				request.setAttribute("own_profile",own_profile);
				List<DateMatch> mutual_dates = db.getProfileDateList(user.getId(),profileId);
				request.setAttribute("mutual_dates",mutual_dates);
				User target_profile = db.getUserInfo(profileId);
				request.setAttribute("target_profile",target_profile);
				RequestDispatcher rd = request.getRequestDispatcher ("/WEB-INF/jsp/profile.jsp");
				rd.forward(request, response);
			}

		}catch (SQLException|NamingException e){
              e.printStackTrace();//Send re
              response.sendRedirect("/internalError");
          }

      }
  }

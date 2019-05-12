package controllers;

import beans.User;
import jdbc.DBManager;
import java.sql.SQLException;
import java.util.List;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
import java.io.InputStream;
import javax.naming.NamingException;

@WebServlet("/upload-image")
public class UploadImage extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		boolean updated=false;
		File image = new File(request.getParameter("photo"));
		FileInputStream photoStream = new FileInputStream(image);

		if(user.isLoggedIn()){
			try(DBManager db = new DBManager()){
				int id = user.getId().trim();
				updated = db.postImage(id,photoStream,image);
				if(updated==false){
					request.setAttribute("errorUploadPhoto", "No se han podido guardar los cambios");
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp");
					rd.forward(request, response);
				}else{
					request.setAttribute("successUploadImage", "Se ha guardado la imagen");
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp");
					rd.forward(request, response);
				}

			}catch (SQLException|NamingException e){
				e.printStackTrace();
			}

		}else{
			response.sendRedirect("index");
		}



	}


}

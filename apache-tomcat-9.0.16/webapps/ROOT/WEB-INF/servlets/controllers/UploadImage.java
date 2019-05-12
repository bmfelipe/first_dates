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

@MultipartConfig
@WebServlet("/upload-image")
public class UploadImage extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		boolean updated=false;
		//System.out.println("[1]Debug: Hola UploadImage " +request.getAttribute("pic"));
		//File image = new File(request.getAttribute("pic"));
		//FileInputStream photoStream = new FileInputStream(request.getAttribute("pic"));
		InputStream photoStream = null;
		Part filePart = request.getPart("pic");
		if (filePart != null) {
            //obtains input stream of the upload file
            //the InputStream will point to a stream that contains
            //the contents of the file
            photoStream = filePart.getInputStream();
        }

		if(user.isLoggedIn()){
			try(DBManager db = new DBManager()){
				int id = user.getId();
				updated = db.postImage(id,photoStream);
				if(updated==false){
					request.setAttribute("errorUploadPhoto", "No se han podido guardar los cambios");
					RequestDispatcher rd = request.getRequestDispatcher("/errorPage.jsp");
					rd.forward(request, response);
				}else{
					request.setAttribute("successUploadImage", "Se ha guardado la imagen");
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp");
					rd.forward(request, response);
				}

			}catch (SQLException|NamingException e){
				e.printStackTrace();
				response.sendRedirect("/errorPage.jsp");
			}

		}else{
			response.sendRedirect("index");
		}



	}


}

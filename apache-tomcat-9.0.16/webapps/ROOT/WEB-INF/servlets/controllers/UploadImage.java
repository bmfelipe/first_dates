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
import javax.servlet.annotation.MultipartConfig;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
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
      BufferedImage imBuff = ImageIO.read(photoStream);
      int width = imBuff.getWidth();
      int height = imBuff.getHeight();
      int x = 0;
      int y = 0;
      if(width >height){
        x = (width-height)/2;
        imBuff = cropImage(imBuff, x,y, height, height);
      }else{
        y = (height-width)/2;
        imBuff = cropImage(imBuff, x,y, width, width);
      }
      ByteArrayOutputStream os = new ByteArrayOutputStream();
      ImageIO.write(imBuff, "png", os);
      InputStream is = new ByteArrayInputStream(os.toByteArray());

		if(user.isLoggedIn() && user.getRole().equals("Usuario")){
			try(DBManager db = new DBManager()){
				int id = user.getId();
				updated = db.postImage(id,is);
				if(updated==false){
					request.setAttribute("errorUploadPhoto", "No se han podido guardar los cambios");
					//RequestDispatcher rd = request.getRequestDispatcher("/errorPage.jsp");
					//rd.forward(request, response);
					response.sendRedirect("/errorPage.jsp");
				}else{
					request.setAttribute("successUploadImage", "Se ha guardado la imagen");
					//RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp");
					//rd.forward(request, response);
					response.sendRedirect("/profile");
				}

			}catch (SQLException|NamingException e){
				e.printStackTrace();
				response.sendRedirect("/errorPage.jsp");
			}

		}else{
			response.sendRedirect("/");
		}



	}

  public static BufferedImage cropImage(BufferedImage bufferedImage, int x, int y, int width, int height){
    BufferedImage croppedImage = bufferedImage.getSubimage(x, y, width, height);
    return croppedImage;
}


}

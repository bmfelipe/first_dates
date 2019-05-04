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

@WebServlet("/user-image")
public class UserImage extends HttpServlet {

    /**
     * Método del servlet que responde a una petición GET.
     *
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        byte[] buffer = new byte[10240];

        if(user.isLoggedIn()){
          try(DBManager db = new DBManager()){
            int id = Integer.parseInt(request.getParameter("id"));
            InputStream in = db.getImage(id);
            if(in != null){
              OutputStream output = response.getOutputStream();
              response.setContentType("image/jpg");
              for (int length = 0; (length = in.read(buffer)) > 0;) {
                output.write(buffer, 0, length);
              }
            }
             // response.sendError(HttpServletResponse.SC_NOT_FOUND);
          }catch (SQLException e){
              e.printStackTrace();
          }

        }else{
          response.sendRedirect("index");
        }



    }
}

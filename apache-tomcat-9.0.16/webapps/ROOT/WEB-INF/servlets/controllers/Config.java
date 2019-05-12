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
	public void processRequest(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException
	{
		try
		{
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");

			if (user == null)
			{
				response.sendRedirect("/");
			}
			else if (user.isLoggedIn() && user.getRole().equals("Usuario"))
			{
				int minAge = Integer.parseInt(request.getParameter("minAge"));
				int maxAge = Integer.parseInt(request.getParameter("maxAge"));
				System.out.println("Debuug: "+ minAge);
				String sexPref= request.getParameter("gender");
				String description = request.getParameter("descripcion");

				boolean updated=false;
				boolean describe_updated=false;

				try(DBManager db = new DBManager())
				{
					updated=db.updatePreferences(user.getId(),minAge,maxAge,sexPref);
					describe_updated=db.updateDescription(user.getId(),description);
					if(updated==false)
					{
						request.setAttribute("errorConfiguracion", "No se han podido guardar los cambios");
						RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/config.jsp");
						rd.forward(request, response);
					}
					else
					{
						response.sendRedirect("/profile");
					}
				}
				catch (SQLException|NamingException e)
				{
					request.setAttribute("successConfiguracion", "Se han guardado tus preferencias");
					session.setAttribute("description",description)
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/config.jsp");
					rd.forward(request, response);
				}

			}
			else
			{
				response.sendRedirect("/");
			}
    }
		catch (Exception ex)
		{
      ex.printStackTrace();
      response.sendRedirect("/errorPage.jsp");
    }
  }//Post



  protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        processRequest(request, response);
  }

  /**
   * Handles the HTTP
   * <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      processRequest(request, response);
  }

}//class

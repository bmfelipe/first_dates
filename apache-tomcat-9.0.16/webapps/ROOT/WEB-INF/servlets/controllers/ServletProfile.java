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

@WebServlet("/home")
public class ServletProfile extends HttpServlet {
	 /**
     * Método del servlet que responde a una petición GET.
     *
     */
	 public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
	 	HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");


	 }
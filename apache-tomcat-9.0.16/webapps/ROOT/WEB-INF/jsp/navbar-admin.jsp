<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@ page import='beans.User' %>

<div>
  <nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <a class="navbar-brand" href="/restaurant">First Dates</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="/restaurant.jsp">Restaurante<span class="sr-only">(current)</span></a>
        </li>
      </ul>
      <% HttpSession sessionNavbarAdmin = request.getSession();
         User user = (User) sessionNavbarAdmin.getAttribute("user"); %>
      <%=user.getName()%>
      <a class="btn btn-secondary" href="/logout" role="button">Salir <i class="fa fa-sign-out" aria-hidden="true"></i></a>
    </div>
  </nav>
</div>

<style>
  .navbar{
    padding-top: 10px;
    padding-bottom: 10px;
  }

  .btn {
    margin-left: 10px;
  }
</style>

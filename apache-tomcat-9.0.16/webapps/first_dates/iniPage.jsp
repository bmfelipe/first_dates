<%@ page language = "java" contentType = "text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <title>Initial Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  </head>

  <style>
    body {
      background-color: black;
      color: white;
    }
    .container-fluid {
      font-family: "Open Sans";
      padding-top: 300px;
    }
  </style>

  <body>
    <div class="container-fluid text-center">
      <p class="display-1">Página de Inicio de <%
          HttpSession session = request.getSession(false);
          String user = (String) session.getAttribute("username");
          %> <%= "@"+user %>
      </p>
    </div>
  </body>

</html>

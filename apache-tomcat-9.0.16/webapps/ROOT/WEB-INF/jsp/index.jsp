<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <title>First Dates</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  </head>

  <style>
    body {
      background-color: #333;
      color: white;
    }
    .container-fluid {
      font-family: "Open Sans";
      padding-top: 70px;
      padding-bottom: 70px;
    }
    .form-group {
      padding-top: 10px;
      padding-bottom: 10px;
    }
    .btn {
      margin-top: 10px;
      margin-bottom: 15px;
    }
    .errorLogin {
      padding-bottom: 20px;
      color: red;
    }
    .custom-control {
      padding-bottom: 15px;
    }
  </style>

  <body>

    <%
    Cookie[] cookies=request.getCookies();
    String username = "", password = "", rememberVal = "";
    if (cookies != null) {
         for (Cookie cookie : cookies) {
           if(cookie.getName().equals("cookuser")) {
             username = cookie.getValue();
           }
           if(cookie.getName().equals("cookpass")){
             password = cookie.getValue();
           }
           if(cookie.getName().equals("cookrem")){
             rememberVal = cookie.getValue();
           }
        }
    }
    %>

    <div class="container-fluid text-center">
      <h1 class="display-1">First Dates</h1>
    </div>

    <form action="/process-login" method="post" class="text-center">
      <div class="form-group">
        <label for="email">Nombre de usuario:<input placeholder="Nombre de usuario" type="text" class="form-control" name="username" value="<%=username%>" required></label>
      </div>

      <div class="form-group">
        <label for="pwd">Contraseña:<input placeholder="Contraseña" type="password" class="form-control" name="password" value="<%=password%>" required></label>
      </div>

      <div class="errorLogin">${errorLogin}</div>

      <div class="custom-control custom-switch">
        <input type="checkbox" class="custom-control-input" id="switch1" name="remember" value="1" checked>
        <label class="custom-control-label" for="switch1">Recuérdame</label>
      </div>

      <button type="submit" class="btn btn-primary">Entrar</button>

      <p class="form-group">¿Todavía no tienes cuenta? <a href="/register">Registrarse</a></p>
    </form>
  </body>

</html>

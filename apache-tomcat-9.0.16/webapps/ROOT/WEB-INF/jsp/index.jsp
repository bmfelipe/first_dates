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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  </head>

  <style>
    body {
      background-color: #333;
      background-size: cover;
      background-image: url("resources/background/photo1.jpg");
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
    .opacity {
      background-color: rgba(20, 20, 20, 0.7);
      height: 100vh;
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

    <div class="opacity">

      <div class="container-fluid text-center">
        <h1 class="display-1">First Dates</h1>
      </div>

      <form action="/process-login" method="post" class="text-center">
        <div class="d-flex justify-content-center">
          <div class="form-group col-sm-3">
            <h5>Email</h5>
            <div class="start_date input-group mb-4">
              <input class="form-control" type="email" name="username" placeholder="Introduzca su email" value="<%=username%>" required>
              <div class="input-group-append">
                <span class="fa fa-at input-group-text start_date_calendar" aria-hidden="true"></span>
              </div>
            </div>
          </div>
        </div>

        <div class="d-flex justify-content-center">
          <div class="form-group col-sm-3">
            <h5>Contraseña</h5>
            <div class="start_date input-group mb-4">
              <input class="form-control" type="password" name="password" placeholder="Introduzca su contraseña" value="<%=password%>" required>
              <div class="input-group-append">
                <span class="fa fa-key input-group-text start_date_calendar" aria-hidden="true"></span>
              </div>
            </div>
          </div>
        </div>

        <div class="errorLogin">${errorLogin}</div>

        <div class="custom-control custom-switch">
          <input type="checkbox" class="custom-control-input" id="switch1" name="remember" value="1" checked>
          <label class="custom-control-label" for="switch1">Recuérdame</label>
        </div>

        <button type="submit" class="btn btn-primary">Entrar</button>

        <p class="form-group">¿Todavía no tienes cuenta? <a href="/register">Registrarse</a></p>

      </form>

    </div>

  </body>


  <script>
  // $(function () {
  //     var body = $('body');
  //     var backgrounds = [
  //       'url(resources/background/photo2.jpg)',
  //       'url(resources/background/photo3.jpg)',
  //       'url(resources/background/photo4.jpg)'];
  //     var current = 0;
  //
  //     function nextBackground() {
  //         body.css(
  //             'background',
  //         backgrounds[current = ++current % backgrounds.length]);
  //
  //         setTimeout(nextBackground, 5000);
  //     }
  //     setTimeout(nextBackground, 5000);
  //     body.css('background', backgrounds[0]);
  // });
  </script>
</html>

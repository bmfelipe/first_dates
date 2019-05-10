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
      padding-top: 10px;
      padding-bottom: 10px;
    }
    .form-group {
      padding-top: 3px;
      padding-bottom: 3px;
    }
    .btn {
      margin-top: 10px;
      margin-bottom: 10px;
    }
    .errorRegister {
      padding-bottom: 20px;
      color: red;
    }
  </style>

  <body>
    <div class="container-fluid text-center">
      <h1 class="display-1">¡Crea tu cuenta!</h1>
    </div>

    <form action="/process-register" method="post" class="text-center">
      <div class="form-group">
        <label for="email">Email:
          <input placeholder="Email" type="email" class="form-control" name="username" required>
        </label>
      </div>

      <div class="form-group">
        <label for="email">Nombre completo:
          <input placeholder="Nombre completo" type="text" class="form-control" name="name" required>
        </label>
      </div>

      <div class="form-group">
        <label for="pwd">Contraseña:
          <input placeholder="Contraseña" title="Debe contener al menos un número, una letra mayúscula, una letra minúscula, y 8 o más carateres" type="password" class="form-control" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
        </label>
      </div>

      <div class="form-group">
        <label for="pwd">Repetir contraseña:
          <input placeholder="Repetir contraseña" title="Debe contener al menos un número, una letra mayúscula, una letra minúscula, y 8 o más carateres" type="password" class="form-control" name="password2" required>
        </label>
      </div>

      <div class="form-group">
        <label for="text">Sexo:
          <select class="form-control" name="gender" required>
            <option value="Mujer">Mujer</option>
            <option value="Hombre">Hombre</option>
          </select>
        </label>
      </div>

      <div class="form-group">
        <label for="text">Fecha de nacimiento:<br>
          <input type="date" name="birthdate" max="3000-12-31" min="1900-01-01" required>
        </label>
      </div>

      <div class="errorRegister">${errorRegister}</div>

      <button type="submit" class="btn btn-primary">Registrar</button>
    </form>
  </body>

</html>

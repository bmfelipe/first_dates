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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  </head>

  <style>
    body {
      background-size: cover;
      background-image: url("resources/background/photo4.jpg");
      color: white;
      height: 100vh;
    }
    .container-fluid {
      font-family: "Open Sans";
      padding-top: 30px;
      padding-bottom: 10px;
    }
    .form-group {
      padding: auto;
    }
    .btn {
      margin-top: 1vh;
    }
    .errorRegister {
      padding-top: 50px;
      color: red;
    }
    .opacity {
      background-color: rgba(20, 20, 20, 0.7);
      height: 100vh;
    }
    h1{
      margin-bottom: 19vh;
    }
  </style>

  <body>
    <div class="opacity">
      <div class="container-fluid text-center">
        <h1 class="display-1">¡Crea tu cuenta!</h1>
        <form action="/process-register" method="post" class="text-center">
        <div class="row">
          <div class="col">

            <div class="d-flex justify-content-center">

              <div class="form-group col-sm-8">
                <h5>Email</h5>
                <div class="start_date input-group mb-4">
                  <input class="form-control" type="email" name="username" placeholder="Introduzca su email" required>
                  <div class="input-group-append">
                    <span class="fa fa-at input-group-text start_date_calendar" aria-hidden="true"></span>
                  </div>
                </div>
              </div>

            </div>

            <div class="d-flex justify-content-center">
            <div class="form-group col-sm-8">
              <h5>Nombre Completo</h5>
              <div class="start_date input-group mb-4">
                <input class="form-control" type="text" name="name" placeholder="Introduzca su nombre completo" required>
                <div class="input-group-append">
                  <span class="fa fa-signature input-group-text start_date_calendar" aria-hidden="true"></span>
                </div>
              </div>
            </div>
            </div>

            <div class="d-flex justify-content-center">
            <div class="form-group col-sm-8">
              <h5>Contraseña</h5>
              <div class="start_date input-group mb-4">
                <input class="form-control" type="password" name="password" placeholder="Introduzca su contraseña" title="Debe contener al menos un número, una letra mayúscula, una letra minúscula, y 8 o más carateres" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                <div class="input-group-append">
                  <span class="fa fa-key input-group-text start_date_calendar" aria-hidden="true"></span>
                </div>
              </div>
            </div>
            </div>

          </div>

          <div class="col">

            <div class="d-flex justify-content-center">
            <div class="form-group col-sm-8">
              <h5>Repetir Contraseña</h5>
              <div class="start_date input-group mb-4">
                <input class="form-control" type="password" name="password2" placeholder="Introduzca la contraseña repetida" required>
                <div class="input-group-append">
                  <span class="fa fa-key input-group-text start_date_calendar" aria-hidden="true"></span>
                </div>
              </div>
            </div>
            </div>

            <div class="d-flex justify-content-center">
            <div class="form-group col-sm-8">
              <h5>Sexo</h5>
              <div class="start_date input-group mb-4">
                <select class="form-control" name="gender" required>
                  <option value="Mujer">Mujer</option>
                  <option value="Hombre">Hombre</option>
                </select>
                <div class="input-group-append">
                  <span class="fa fa-venus-mars input-group-text start_date_calendar" aria-hidden="true"></span>
                </div>
              </div>
            </div>
            </div>

            <div class="d-flex justify-content-center">
            <div class="form-group col-sm-8">
              <h5>Fecha de Nacimiento</h5>
              <div class="start_date input-group mb-4">
                <input class="form-control start_date" type="text" name="birthdate" placeholder="Seleccione o introduzca su fecha de nacimiento" id="startdate_datepicker" autocomplete="off" required>
                <div class="input-group-append">
                  <span class="fa fa-baby input-group-text start_date_calendar" aria-hidden="true"></span>
                </div>
              </div>
            </div>
            </div>

          </div>
        </div>

          <div class="errorRegister">${errorRegister}</div>

          <button type="submit" class="btn btn-primary">Registrar</button>
        </form>

      </div>

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
  $(document).ready(function() {
      $('#startdate_datepicker').datepicker({
          startDate: '1900-01-01',
          multidate: false,
          format: "yyyy-mm-dd",
          daysOfWeekHighlighted: "6,0",
          datesDisabled: ['31-08-2017'],
          orientation: 'bottom',
          weekStart: 1
      }).on('changeDate', function(e) {
          // `e` here contains the extra attributes
          $(this).find('.input-group-addon .count').text(' ' + e.dates.length);
      });
  });
  </script>

</html>

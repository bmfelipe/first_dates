<%@ page language = "java" contentType = "text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <title>Cita</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
    <%-- <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script> --%>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css" />
  </head>

  <style>
    body {
      background-color: #333;
      color: white;
    }
    .container-fluid {
      font-family: "Open Sans";

    }


   #heart {
     color: #aaa  ;
   }
   .card {
     height: 78vh;
     background: #555;

   }

   .date-select {
     /* background: white;
     border-radius: 4px; */
     padding-right: 20%;
     padding-left:20%;
     padding-top: 10px;
     /* overflow: hidden; */
   }

   .profile-photo{
     max-width: 250px;
   }
   .user-info {
     padding-top: 20px;
   }


  </style>

  <body>
    <%@ include file='navbar.jsp' %>
    <div class="container-fluid text-center">
      <div class="row">
        <div class="col-lg-4 ">
          <div class="card mb-4" id="you-card">
            <h2>Yo</h2>
            <div id="carousel-elem" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active" id="1">
                  <img class="profile-photo" src="modelo.png" alt="First slide">
                </div>
              </div>
            </div>
            <div class="user-info">
              <h5>Nombre: Maria</h5>
              <h5>Edad: 28</h5>
            </div>
            <hr/>
            <div class="req-info">
              <h4>Información a rellenar:</h4>
                <div class="date-select">
                <h5>Selecciona Fecha para tu cita</h5>
                  <div class="dates">
                    <div class="start_date input-group mb-4">
                      <input class="form-control start_date" type="text" placeholder="Date" id="startdate_datepicker">
                      <div class="input-group-append">
                        <span class="fa fa-calendar input-group-text start_date_calendar" aria-hidden="true "></span>
                      </div>
                  </div>
                </div>
              </div>
              
            </div>
          </div>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <%-- <div class="card mb-4"> --%>

            <div id="date-container">
              <div id="heart" style="font-size: 7rem;">
                <i class="fa fa-heart fa-5x"></i>
              </div>
            </div>
            <h2>Detalles</h2>
            <div id="info">
              <h5>Estado de Cita: Pendiente hora</h5>
              <h5>Dia: 28-5-2019</h5>
              <h5>Hora: 20:00</h5>
            </div>
          <%-- </div> --%>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <div class="card mb-4">
            <h2>Tu cita</h2>
            <div id="carousel-elem" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active" id="1">
                  <img class="profile-photo" src="modelo.png" alt="First slide">
                </div>

              </div>

            </div>
            <div class="user-info">
              <h5>Nombre: Maria</h5>
              <h5>Edad: 28</h5>
            </div>
            <hr/>
            <div id="date-info">

            </div>
          </div>
        </div>
  </body>
  <script>
  $(document).ready(function() {
      $('#startdate_datepicker').datepicker({
          startDate: new Date(),
          multidate: true,
          format: "dd-mm-yyyy",
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

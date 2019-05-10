<%@ page language = "java" contentType = "text/html" pageEncoding="UTF-8" session="false"%>
<%@ page import='beans.User'%>
<%@ page import='beans.DateMatch'%>
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
      padding-top: 25px;
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
     width: 250px;

   }
   .user-info {
     padding-top: 20px;
   }


  </style>

  <body>
    <%
    User date = (User) request.getAttribute("date");
    DateMatch dateInfo = (DateMatch) request.getAttribute("dateInfo");
    int firstId = -1;
    // HttpSession sessionDate = request.getSession();
    // User user = (User) session.getAttribute("user");
    %>
    <%@ include file='navbar.jsp' %>
    <div class="container-fluid text-center">
      <div class="row">
        <div class="col-lg-4 ">
          <div class="card mb-4" id="you-card">
            <h2>Yo</h2>
            <div id="carousel-elem" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active" id="1">
                  <img class="profile-photo" src="/user-image?id=<%=user.getId()%>" onerror="this.src='anonymous.png'">
                </div>
              </div>
            </div>
            <div class="user-info">
              <h5>Nombre: <%=user.getName()%></h5>
              <h5>Edad: <%=user.getAge()%></h5>
            </div>
            <hr/>
            <div class="req-info">
              <h4>Información a rellenar:</h4>
              <% if(dateInfo.getStatus().equals("Aceptado")){%>
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
                  <p><a class="btn btn-secondary" id="add-date-req" role="button">Fijar Fecha</a></p>
                </div>
              <%}else if((dateInfo.getStatus().equals("Fecha pendiente") && user.getId()!= dateInfo.getDateSetBy())){%>
                <div class="date-confirm">
                <h5>Confirma Fecha para tu cita</h5>
                  <div class="dates">
                      <h6>Fecha: <%=dateInfo.getDateRequest()%></h6>
                </div>
                <p><a class="btn btn-secondary" id="add-date-res" role="button">Fijar Fecha</a></p>
                </div>

              <%}else{%>

                  <h5>Ya esta fijada la fecha</h5>
                <%}%>
            </div>
          </div>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <%-- <div class="card mb-4"> --%>

            <div id="date-container">
              <div id="heart" style="font-size: 4rem;">
                <i class="fa fa-heart fa-5x"></i>
              </div>
            </div>
            <h2>Detalles</h2>
            <div id="info">
              <h5>Estado de Cita: <%=dateInfo.getStatus()%></h5>
              <%if(dateInfo.getDateResponse() == null){%>
                <h5>Dia: No fijado</h5>
              <%}else{%>
                <h5>Dia: <%=dateInfo.getDateResponse()%></h5>
              <%}%>

            </div>
          <%-- </div> --%>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <div class="card mb-4">
            <h2>Tu cita</h2>
            <div id="carousel-elem" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active" id="1">
                  <img class="profile-photo" src="/user-image?id=<%=date.getId()%>" alt="/anonymous.png">
                </div>
              </div>
            </div>
            <div class="user-info">
              <h5>Nombre: <%=date.getName()%></h5>
              <h5>Edad: <%=date.getAge()%></h5>
            </div>
            <hr/>
            <div id="date-info">
            <h6>
              <%=date.getDescription()%>
            </h6>
            </div>
          </div>
        </div>
  </body>
  <script>
  $(document).ready(function() {
      $('#startdate_datepicker').datepicker({
          startDate: new Date(),
          multidate: true,
          format: "dd/mm/yyyy",
          daysOfWeekHighlighted: "6,7",
          datesDisabled: ['31/08/2017'],
          language: 'en',
          orientation: 'bottom',
      }).on('changeDate', function(e) {
          // `e` here contains the extra attributes
          $(this).find('.input-group-addon .count').text(' ' + e.dates.length);
      });
  });

  $('#add-date-req').on('click', function(event) {
    event.preventDefault();

    var dates = ($('#startdate_datepicker').datepicker({ dateFormat: 'dd-mm-yy' }).val());
    var dateId = <%=dateInfo.getId()%>;

      $.post('http://localhost:9189/add-dates',{
        'dates' : dates,
        'id': dateId
      })
      .done(function(data){
        $(".date-select").remove();
        $(".req-info").append("<h5>Fecha Fijada. Esperando respuesta de <%=date.getName()%></h5>");

      });
  });

  $('#add-date-res').on('click', function(event) {
    event.preventDefault();
    var dates = '<%=dateInfo.getDateRequest()%>';
    var dateId = <%=dateInfo.getId()%>;
      $.post('http://localhost:9189/add-dates',{
        'dates':dates,
        'confirm' : 'true',
        'id': dateId
      })
      .done(function(data){
        $(".date-confirm").remove();
        $(".req-info").append("<h5>Fecha Fijada. Esperamos que disfruteis de la cita");

      });
  });

  </script>
</html>

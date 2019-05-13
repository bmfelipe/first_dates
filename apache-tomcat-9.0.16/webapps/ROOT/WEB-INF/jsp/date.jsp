<%@ page language = "java" contentType = "text/html" pageEncoding="UTF-8" session="false"%>
<%@ page import='beans.User'%>
<%@ page import='beans.DateMatch'%>
<%@ page import='java.util.Date'%>
<%@ page import='java.util.List'%>
<%@ page import='java.text.SimpleDateFormat'%>
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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  </head>

  <style>
    body {
      height: 100vh;
      background-size: cover;
      background-image: url("resources/background/photo1.jpg");
      color: white;
    }

    .container-fluid {
      padding-top: 1vh;
      font-family: "Open Sans";
    }

   #heart {
     color: rgba(20, 20, 20, 0.8);
   }

   .card {
     height: 74vh;
     background-color: rgba(20, 20, 20, 0.8);
     padding: 20px;
   }

   .fa-angle-down{
     padding-bottom: 15px;
   }

   .card::-webkit-scrollbar {
     width: 0 !important
   }

   .date-select {
     /* background: white;
     border-radius: 4px; */
     padding-right: 20%;
     padding-left:20%;
     padding-top: 1vh;
     /* overflow: hidden; */
   }

   .profile-photo{
     width: 25vh;
     margin-bottom: 2vh;
   }
   .user-info {
     padding-top: 1vh;
   }

   .opacity {
     background-color: rgba(20, 20, 20, 0.7);
     min-height: 100vh;
   }

   img {
     border-radius:50%;
   }

   hr {
     margin: 2px;
   }
  </style>

  <body>
    <%
    User date = (User) request.getAttribute("date");
    DateMatch dateInfo = (DateMatch) request.getAttribute("dateInfo");
    int firstId = -1;
    List<Date> availableDates =  (List<Date>)request.getAttribute("availableDates");
    // HttpSession sessionDate = request.getSession();
    // User user = (User) session.getAttribute("user");
    %>
    <div class="opacity">
    <%@ include file='navbar.jsp' %>

    <div class="container-fluid text-center">
      <div class="row">
        <div class="col-lg-4 ">
          <div class="header">
            <h2>Yo</h2>
          </div>
          <i class="fas fa-angle-down"></i>
          <div class="card mb-4 overflow" id="you-card">
            <div id="carousel-elem" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active" id="1">
                  <img class="profile-photo" src="/user-image?id=<%=user.getId()%>" onerror="this.src='resources/default.png'">
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
              <% if(dateInfo.getStatus().equals("Aceptado")){
                  if(availableDates.size() != 0){
                %>

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
                <%}else{%>
                  <h5>No hay fechas disponibles aun, vuelve mas tarde</h5>
              <%}}else if((dateInfo.getStatus().equals("Fecha pendiente") && user.getId()!= dateInfo.getDateSetBy())){%>
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
          <div class="header">
            <h2>Tu Cita</h2>
            <i class="fas fa-angle-down"></i>
          </div>
          <div class="card mb-4">
            <div id="carousel-elem" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active" id="1">
                  <img class="profile-photo" src="/user-image?id=<%=date.getId()%>"  onerror="this.src='resources/default.png'">
                </div>
              </div>
            </div>
            <div class="user-info">
              <h5>Nombre: <%=date.getName()%></h5>
              <h5>Edad: <%=date.getAge()%></h5>
            </div>
            <hr/>
            <div id="date-info">
              <%if(date.getDescription() == null){%>
              <h6>
                No hay descripción disponible
              </h6>
              <%}else{%>
            <h6>
              <%=date.getDescription()%>
            </h6>
            <%}%>
            </div>
          </div>
        </div>
      </div>
  </body>
  <script>

  var availableDates = [

    <%

    int size = availableDates.size();
    SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
    int index = 1;
    String availableDateStr;

    for(Date availableDate : availableDates){

        availableDateStr = sdf.format(availableDate);
        // availableDateStr = String.format("%td-%tm-%tY",availableDate, availableDate,availableDate);
        if(size != index){%>
          '<%=availableDateStr%>',
        <%}else{%>
          '<%=availableDateStr%>'
        <%}
        index++;

    }
    %>

  ];

  $(document).ready(function() {





    // function available(date) {
    // dmy = date.getDate() + "-" + (date.getMonth()+1) + "-" + date.getFullYear();
    // // console.log(availableDates);
    // // console.log(dmy);
    //   if ($.inArray(dmy, availableDates) != -1) {
    //     console.log("test");
    //
    //     return [ true, "","Available"];
    //   } else {
    //
    //     return [ false,"","unAvailable"];
    //   }
    // }


      $('#startdate_datepicker').datepicker({
          multidate: false,
          format: "dd-mm-yyyy",
          autoclose: true,
          daysOfWeekHighlighted: "6,0",
          weekStart: 1,
          language: 'en',
          orientation: 'top',
          beforeShowDay:function(date) {
            var currentDate =
              date.getDate() + '-' +
              (date.getMonth() + 1) +
              '-' + date.getFullYear();
            return (availableDates.indexOf(currentDate) != -1)
          }
      }).on('changeDate', function(e) {
          // `e` here contains the extra attributes
          $(this).find('.input-group-addon .count').text(' ' + e.dates.length);
      });
  });

  $('#add-date-req').on('click', function(event) {
    event.preventDefault();

    var dates = ($('#startdate_datepicker').datepicker({ dateFormat: 'dd-mm-yyyy' }).val());
    // console.log(dates);
    var dateId = <%=dateInfo.getId()%>;

      $.post('http://localhost:9189/add-dates',{
        'dates' : dates,
        'id': dateId,
        'confirm': 'false'
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

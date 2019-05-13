<%@ page language ="java" contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@ page import='java.util.Date' %>
<%@ page import='java.text.SimpleDateFormat' %>
<%@ page import='java.text.DateFormat' %>
<%@ page import='beans.DateMatch' %>
<%@ page import='java.util.List' %>
<%@ page import='java.util.Calendar' %>
<%@ page import='java.time.DayOfWeek' %>
<%@ page import='java.time.LocalDate' %>
<%@ page import='java.time.Month' %>
<%@ page import='java.util.ArrayList' %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Restaurant Management</title>
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css" />
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  </head>

  <style>
    body{
      height: 100vh;
      background-size: cover;
      background-image: url("resources/background/photo5.jpg");
      color: white;
    }

    .container-fluid {
      padding-top: 15px;
      font-family: "Open Sans";
    }

    .row {
      max-height: 15vh;
      padding: 10px 0;
      padding-left: 10px;
      padding-right: 10px;
    }

    .card {
      height: 71vh;
      background-color: rgba(20, 20, 20, 0.8);
      padding-top: 20px;
      padding-bottom: 20px;
    }

    .card::-webkit-scrollbar {
      width: 0 !important
    }

    .error{
      padding-top: 15px;
      color: red;
    }

    .success{
      padding-top: 15px;
      color: white;
    }

    .form-group {
      padding-top: 15px;
    }

    hr{
      background-color: #333;
      width: 100%;
      margin-top: 15px;
    }

    .col-9{
      margin-top: 22px;
    }

    .fa-grip-lines{
      color: #333;
    }

    .fa-angle-down{
      padding-bottom: 15px;
    }

  </style>

  <body>
    <%@include file ='/WEB-INF/jsp/navbar-admin.jsp'%>

    <div class="container-fluid text-center">
      <div class="row">
        <div class="col-lg-6">
          <h2>Gestión</h2>
          <i class="fas fa-angle-down"></i>
          <div class="card mb-4 overflow-auto">
            <h3>Registrar Mesas</h3>
            <i class="fas fa-grip-lines"></i>
            <form action="/restaurant" method="post" class="text_center">
              <div class="d-flex justify-content-center">
                <div class="form-group col-sm-4">
                  <h5>Fecha</h5>
                  <div class="start_date input-group mb-4">
                    <input class="form-control start_date" type="text" name="dateInsert" placeholder="Fecha a registrar" id="startdate_datepicker" autocomplete="off">
                    <div class="input-group-append">
                      <span class="fa fa-calendar input-group-text start_date_calendar" aria-hidden="true"></span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="d-flex justify-content-center">
                <div class="form-group col-sm-4">
                  <h5>Mesas a ofrecer</h5>
                  <div class="start_date input-group mb-4">
                    <input class="form-control start_date" type="text" name="tablesInsert" placeholder="Número de mesas" autocomplete="off">
                    <div class="input-group-append">
                      <span class="fas fa-chair input-group-text start_date_calendar" aria-hidden="true"></span>
                    </div>
                  </div>
                </div>
              </div>
              <button type="submit" class="btn btn-secondary">Registrar</button>
              <div class="success">${successInsertion}</div>
            </form>
            <hr>
            <h3>Buscar Mesas</h3>
            <i class="fas fa-grip-lines"></i>
            <form action="/restaurant" method="post" class="text_center">
              <div class="d-flex justify-content-center">
                <div class="form-group col-sm-4">
                  <h5>Fecha</h5>
                  <div class="start_date input-group mb-4">
                    <input class="form-control start_date" type="text" name="dateSearch" placeholder="Fecha a buscar" id="startdate_datepicker2" autocomplete="off">
                    <div class="input-group-append">
                      <span class="fa fa-calendar input-group-text start_date_calendar" aria-hidden="true"></span>
                    </div>
                  </div>
                </div>
              </div>
              <button type="submit" class="btn btn-secondary">Buscar</button>
              <div class="success">${successSearch}</div>
            </form>
            <hr>
            <h3>Editar Mesas</h3>
            <i class="fas fa-grip-lines"></i>
            <form action="/restaurant" method="post" class="text_center">
              <div class="d-flex justify-content-center">
                <div class="form-group col-sm-4">
                  <h5>Fecha</h5>
                  <div class="start_date input-group mb-4">
                    <input class="form-control start_date" type="text" name="dateUpdate" placeholder="Fecha a editar" id="startdate_datepicker3" autocomplete="off">
                    <div class="input-group-append">
                      <span class="fa fa-calendar input-group-text start_date_calendar" aria-hidden="true"></span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="d-flex justify-content-center">
                <div class="form-group col-sm-4">
                  <h5>Mesas a editar</h5>
                  <div class="start_date input-group mb-4">
                    <input class="form-control start_date" type="text" name="tablesUpdate" placeholder="Número de mesas" autocomplete="off">
                    <div class="input-group-append">
                      <span class="fa fa-chair input-group-text start_date_calendar" aria-hidden="true"></span>
                    </div>
                  </div>
                </div>
              </div>
              <button type="submit" class="btn btn-secondary">Editar</button>
              <div class="success">${successUpdate}</div>
            </form>
          </div>
        </div>
        <div class="col-lg-6">
          <h2>Agenda</h2>
          <i class="fas fa-angle-down"></i>
          <div class="card mb-4 overflow-auto">
            <%
              List<DateMatch> confirmedDates = (List<DateMatch>) request.getAttribute("confirmedDates");
              List<Date> confirmedDatesEdit = new ArrayList<Date>();
              for (DateMatch confirmedDate : confirmedDates) {
                confirmedDatesEdit.add(new java.sql.Date(confirmedDate.getDateRequest().getTime()));
                LocalDate currentDate = new java.sql.Date(confirmedDate.getDateRequest().getTime()).toLocalDate();
                int dayOfMonth = currentDate.getDayOfMonth();
                DayOfWeek dayOfWeek = currentDate.getDayOfWeek();
                Month month = currentDate.getMonth();
                String name1 = confirmedDate.getDateName(confirmedDate.getDateOneId());
                String name2 = confirmedDate.getDateName(confirmedDate.getDateTwoId());
            %>
                <div class="row">
                  <div class="col-3 text_center">
                    <h1 class="display-4"><span class="badge badge-secondary"><%=dayOfMonth%></span></h1>
                    <h2><%=month%></h2>
                  </div>
                  <div class="col-9">
                    <h3><strong><%=name1%> <i class="fa fa-heart" aria-hidden="true"></i> <%=name2%></strong></h3>
                    <ul class="list-inline">
                      <li class="list-inline-item"><i class="fa fa-calendar-o" aria-hidden="true"></i> <%=dayOfWeek%></li>
                      <li class="list-inline-item"><i class="fa fa-clock-o" aria-hidden="true"></i> 8:00 PM - 10:00 PM</li>
                    </ul>
                  </div>
                </div>
                <hr>
          <%}%>
          </div><!-- /.col-lg-4 -->
        </div>
      </div>
    </div>

  </body>

  <script>


  var availableDates = [

    <%
    List<Date> availableDates =  (List<Date>)request.getAttribute("availableDates");
    int size = availableDates.size();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
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

  var confirmed = [

    <%
    int size2 = confirmedDatesEdit.size();
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
    int index2 = 1;
    String confirmedDateStr;

    for(Date confirmDate : confirmedDatesEdit){

        confirmedDateStr = sdf2.format(confirmDate);
        // availableDateStr = String.format("%td-%tm-%tY",availableDate, availableDate,availableDate);
        if(size2 != index2){%>
          '<%=confirmedDateStr%>',
        <%}else{%>
          '<%=confirmedDateStr%>'
        <%}
        index++;

    }
    %>

  ];

  $(document).ready(function() {
      $('#startdate_datepicker').datepicker({
          startDate: new Date(),
          multidate: false,
          autoclose:true,
          format: "yyyy-mm-dd",
          daysOfWeekHighlighted: "6,0",
          datesDisabled: availableDates,
          orientation: 'bottom',
          weekStart: 1
      }).on('changeDate', function(e) {
          // `e` here contains the extra attributes
          $(this).find('.input-group-addon .count').text(' ' + e.dates.length);
      });
  });
  $(document).ready(function() {
      $('#startdate_datepicker2').datepicker({
          startDate: new Date(),
          multidate: false,
          autoclose:true,
          format: "yyyy-mm-dd",
          daysOfWeekHighlighted: "6,0",
          orientation: 'bottom',
          weekStart: 1,
          // beforeShowDay:function(date) {
          //   var currentDate1 =
          //     date.getDate() + '-' +
          //     (date.getMonth() + 1) +
          //     '-' + date.getFullYear();
          //   return (availableDates.indexOf(currentDate1) != -1)
          // }
      }).on('changeDate', function(e) {
          // `e` here contains the extra attributes
          $(this).find('.input-group-addon .count').text(' ' + e.dates.length);
      });
  });
  $(document).ready(function() {
      $('#startdate_datepicker3').datepicker({
          startDate: new Date(),
          multidate: false,
          autoclose:true,
          format: "yyyy-mm-dd",
          daysOfWeekHighlighted: "6,0",
          orientation: 'bottom',
          weekStart: 1,
          datesDisabled: confirmed,
          // beforeShowDay:function(date) {
          //   var currentDate2 =
          //     date.getDate() + '-' +
          //     (date.getMonth() + 1) +
          //     '-' + date.getFullYear();
          //   return (availableDates.indexOf(currentDate2) != -1)
          // }
      }).on('changeDate', function(e) {
          // `e` here contains the extra attributes
          $(this).find('.input-group-addon .count').text(' ' + e.dates.length);
      });
  });
  </script>

</html>

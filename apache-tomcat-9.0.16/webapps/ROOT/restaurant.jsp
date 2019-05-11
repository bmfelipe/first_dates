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
  </head>

  <style>
    body{
      background-color: #333;
      color: white;
      height: 100vh;
    }

    .container-fluid {
      padding-top: 25px;
      font-family: "Open Sans";
    }

    .row {
      max-height: 78vh;
      padding: 10px 0;
      padding-left: 10px;
      padding-right: 10px;
    }

    .card {
      height: 78vh;
      background: #555;
    }

    .titles {
      background: #777;
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

    .scroll {
      max-height: 78vh;
      overflow-y: auto;
    }

    h2{
      padding-bottom: 25px;
      text-decoration: underline;
    }

    hr{
      background-color: #333;
      width: 100%;
    }

    .col-9{
      margin-top: 35px;
    }

  </style>

  <%
      Date date = new Date();
      DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      String strDate = dateFormat.format(date);
  %>

  <body>
    <%@include file ='/WEB-INF/jsp/navbar-admin.jsp'%>

    <div class="container-fluid text-center">
      <div class="row">
        <div class="col-lg-6">
          <h2>Gestionar Restaurante</h2>
          <div class="card mb-4 scroll">
            <h3>Registrar Mesas</h3>
            <form action="/restaurant" method="post" class="text_center">
              <div class="form-group col-sm">
                <%-- <label for="text">Fecha:<br>
                  <input type="date" name="dateInsert" max="3000-12-31" min="<%=strDate%>" required>
                </label> --%>
                <h5>Fecha</h5>
                <div class="start_date input-group mb-4">
                  <input class="form-control start_date" type="text" placeholder="Date" id="startdate_datepicker">
                  <div class="input-group-append">
                    <span class="fa fa-calendar input-group-text start_date_calendar" aria-hidden="true "></span>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="text">Número de mesas a ofrecer:<br>
                  <input type="text" name="tablesInsert" required>
                </label>
              </div>
              <button type="submit" class="btn btn-secondary">Registrar</button>
              <div class="success">${successInsertion}</div>
              <div class="error">${errorInsertion}</div>
            </form>
            <hr>
            <h3>Buscar Mesas</h3>
            <form action="/restaurant" method="post" class="text_center">
              <div class="form-group">
                <label for="text">Fecha:<br>
                  <input type="date" name="dateSearch" max="3000-12-31" min="<%=strDate%>" required>
                </label>
              </div>
              <button type="submit" class="btn btn-secondary">Buscar</button>
              <div class="success">${successSearch}</div>
              <div class="error">${errorSearch}</div>
            </form>
            <hr>
            <h3>Editar Mesas</h3>
            <form action="/restaurant" method="post" class="text_center">
              <div class="form-group">
                <label for="text">Fecha:<br>
                  <input type="date" name="dateUpdate" max="3000-12-31" min="<%=strDate%>" required>
                </label>
              </div>
              <div class="form-group">
                <label for="text">Número de mesas a ofrecer:<br>
                  <input type="text" name="tablesUpdate" required>
                </label>
              </div>
              <button type="submit" class="btn btn-secondary">Editar</button>
              <div class="success">${successUpdate}</div>
              <div class="error">${errorUpdate}</div>
            </form>
          </div>
        </div>
        <div class="col-lg-6">
          <h2>Agenda</h2>
          <div class="card mb-4 scroll">
            <%
              List<DateMatch> confirmedDates = (List<DateMatch>) request.getAttribute("confirmedDates");
              for (DateMatch confirmedDate : confirmedDates) {
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
  $(document).ready(function() {
      $('#startdate_datepicker').datepicker({
          startDate: new Date(),
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

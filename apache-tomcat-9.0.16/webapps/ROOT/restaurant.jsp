<%@ page language ="java" contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@ page import='java.util.Date' %>
<%@ page import='java.text.SimpleDateFormat' %>
<%@ page import='java.text.DateFormat' %>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
      height:78vh;
      max-height: 78vh;
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
      color: forestgreen;
    }

    .form-group {
      padding-top: 15px;
    }
  </style>

  <%  Date date = new Date();
      DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      String strDate = dateFormat.format(date); %>

  <body>
    <%@include file ='/WEB-INF/jsp/navbar-admin.jsp'%>

    <div class="container-fluid text-center">
      <div class="row">
        <div class="col-lg-4 ">
          <div class="card mb-4">
            <div class="titles">
              <h2>Registrar Mesas</h2>
            </div>
            <form action="/restaurant" method="post" class="text_center">
              <div class="form-group">
                <label for="text">Fecha:<br>
                  <input type="date" name="dateInsert" max="3000-12-31" min="<%=strDate%>" required>
                </label>
              </div>
              <div class="form-group">
                <label for="text">Número de mesas a ofrecer:<br>
                  <input type="text" name="tablesInsert" required>
                </label>
              </div>
              <button type="submit" class="btn btn-primary">Registrar</button>
              <div class="success">${successInsertion}</div>
              <div class="error">${errorInsertion}</div>
            </form>
          </div>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <div class="card mb-4">
            <div class="titles">
              <h2>Buscar Mesas</h2>
            </div>
            <form action="/restaurant" method="post" class="text_center">
              <div class="form-group">
                <label for="text">Fecha:<br>
                  <input type="date" name="dateSearch" max="3000-12-31" min="<%=strDate%>" required>
                </label>
              </div>
              <button type="submit" class="btn btn-primary">Buscar</button>
              <button type="button" class="btn btn-light">Agenda</button>
              <div class="success">${successSearch}</div>
              <div class="error">${errorSearch}</div>
            </form>
          </div>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <div class="card mb-4">
            <div class="titles">
              <h2>Editar Mesas</h2>
            </div>
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
              <button type="submit" class="btn btn-primary">Editar</button>
              <div class="success">${successUpdate}</div>
              <div class="error">${errorUpdate}</div>
            </form>
          </div><!-- /.col-lg-4 -->
        </div>
      </div>
    </div>

  </body>

</html>

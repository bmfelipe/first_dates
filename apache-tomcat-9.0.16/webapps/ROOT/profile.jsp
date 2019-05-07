<%@ page language ="java" contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>

  <title>User Profile Page</title>
  <!-- Required meta tags -->
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

</head>
<body>
  <%@include file ='/fixing/navbar.jsp'%>
  <div class="col-md-8 text container-fluid text-center">
    <div class="titles">
      <h2>Perfil</h2>
    </div>
    <br></br>
    <img src="modelo.png">
    <br></br>
    <div class="card mx-auto mb-auto">
      <h1>Susana Oria</h1>
      <!--<cite title="San Francisco, USA">San Francisco, USA<i class="fas fa-map-marker-alt" style="font-size: 30px"></i></cite>-->
      <!--<p class="mb-4"> Descripcion</p>-->
      <p>Descripcion</p>contenta pero no mucho
      <h5>Sexo</h5>Mujer
      <h5>Fecha de nacimiento</h5>23/3/1987
      <div class="card mx-auto mb-auto">
        <h5>Citas con Susana Oria</h5>
        <button>Proponer cita</button>
        <div id="like-dislike-buttons">
          <p>
            <button class="btn btn-secondary mr-1" id="like-btn" role="button"><i class="fa fa-heart"></i> </button>
            <button class="btn btn-secondary ml-1" id="dislike-btn" role="button"><i class="fa fa-ban"></i></button>
          </p>
        </div>
      </div>


    </div>
  </div> 
</body>
<style>
  body {
    background-color: #333;
    color: white;
    height: 100vh;

  }
  .container-fluid {
    padding-top: 25px;
    font-family: "Open Sans";


  }
  .dropdown-toggle::after {
    display:none;
  }
  .btn:focus,.btn:active {
   outline: none !important;
   box-shadow: none;
 }

 .row {
   height:78vh;
   max-height: 78vh;
 }

 .card {
   height: 78vh;
   width: 700px;
   margin-bottom: 200px;
   background: #555;


 }
 .titles {
   background: #777;
 }
 #like-dislike-buttons {
   margin-top: 10px;
 }
 #date-container {
   overflow-y:auto;
   overflow-x:hidden;
 }
 #no-rec {
   margin: auto;
   font-size: 15px;
 }

</style>
</html>

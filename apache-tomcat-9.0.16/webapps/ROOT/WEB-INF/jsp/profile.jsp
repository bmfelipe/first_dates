<%@ page language ="java" contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@ page import='java.util.List'%>
<%@ page import='beans.User'%>
<%@ page import='beans.DateMatch'%>
<!DOCTYPE html>
<html lang="en">
<head>

  <title>Perfil</title>
  <!-- Required meta tags -->
  <!-- Upload image bar -->

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

</head>
<body>
  <%@include file ='/WEB-INF/jsp/navbar.jsp'%>
  <div class="col-md-8 text container-fluid text-center">
    <h2>Perfil</h2>
    <i class="fas fa-angle-down"></i>
    <%
    //HttpSession session = request.getSession();
    User profile = (User) request.getAttribute("target_profile");
    String own_profile = (String)request.getAttribute("own_profile");
    %>
    <div class="card mx-auto mb-4 overflow-auto">
      <h1><%=profile.getName()%></h1>
      <div class="imgUser">
        <%
        if(own_profile.equals("true")){
        %>
        <img id="upload-image" src="/user-image?id=<%=profile.getId()%>" onerror="this.src='resources/default.png'">
        <%
      }else{%>
      <img id="upload-image" src="/user-image?id=<%=profile.getId()%>" onerror="this.src='resources/default.png'">
      <%}%>
    </div>

    <!-- Upload image bar -->
    <%
    if(own_profile.equals("true")){
    %>
    <form action="/upload-image" method="post" enctype="multipart/form-data">
      <div class="custom-file-upload" style= padding-top:20px;>
        <label for="file-upload" class="custom-file-upload1">
          <i class="fas fa-cloud-upload-alt"></i> Seleccionar foto de perfil
        </label>
        <input id="file-upload" name="pic" type="file" accept="image/*"/>
        <input name="submit-photo" type="submit" value="Subir" />
      </div>
    </form>
    <%}%>
    <%
    if(profile.getDescription()!=null){
    %>
    <q cite="https://www.imdb.com/title/tt0062622/quotes/qt0396921"><%=profile.getDescription()%></q>
    <%}else{%>
    <q cite="https://www.imdb.com/title/tt0062622/quotes/qt0396921">No hay descripción aún</q>
    <%}%>
    <!-- <p>Descripcion</p><%=profile.getDescription()%> -->
    <%=profile.getGender()%><br>
    <%=profile.getBirthdate()%>
    <%

    if (own_profile.equals("true")) {
    %><div id="like-dislike-buttons">
      <a class="btn btn-secondary btn-edit mr-1" href="/profile-redirect" id="editProfile-btn" role="button"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></i> </a>
    </div>
    <%
  }

  %>
  <hr>
  <%
  User current_user = (User) session.getAttribute("user");
  List<DateMatch> mutual_dates = (List<DateMatch>)request.getAttribute("mutual_dates");
  int pendiente=0;
  if(!mutual_dates.isEmpty()){%>
  <h3>Citas</h3>
  <i class="fas fa-grip-lines"></i>
  <%
  for(DateMatch dates:mutual_dates){
  if(!dates.getStatus().equals("Rechazado") && !dates.getStatus().equals("Pendiente")){
  pendiente=0;%>
  <hr>
  <h5><%=dates.getDateName(profile.getId())%> <i class="fas fa-arrow-circle-right"></i> <%=dates.getStatus()%></h5>
  <%
}if (dates.getStatus().equals("Pendiente")){
pendiente=1;
}
}

}
if(pendiente==0 && own_profile=="false"){%>
<button class="btn btn-aux btn-secondary mr-1 text-center" role="button" id="date-btn">Proponer cita</button>
<%}%>

  <!-- <div id="like-dislike-buttons">
    <p>
      <button class="btn btn-secondary mr-1" id="like-btn" role="button"><i class="fa fa-heart"></i> </button>
      <button class="btn btn-secondary ml-1" id="dislike-btn" role="button"><i class="fa fa-ban"></i></button>
    </p>
  </div> -->

</div>
</div>
</body>
<style>
  body {
   background-size: cover;
   background-image: url("resources/background/photo3.jpg");
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
.btn-aux{
  margin: 4px 2px;
  margin-left: 250px;
  padding: 15px 15px;
  width: 200px;
}

.row {
 height:78vh;
 max-height: 78vh;
}

.card {
 height: 78vh;
 background-color: rgba(20, 20, 20, 0.8);
 padding-top: 2vh;
 padding-bottom: 2vh;
 width: 60%;
 margin-bottom: 1vh;
 margin-top: 1vh;
}

img {
  margin-left: auto;
  margin-right: auto;
}
.imgUser{
  max-width: auto;
}


hr{
  background-color: #333;
  width: 100%;
}

.fa-grip-lines{
  color: #333;
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

.card::-webkit-scrollbar {
  width: 0 !important
}

.custom-file-upload input[type="file"] {
  display: none;
}
.custom-file-upload .custom-file-upload1 {
  border: 1px solid #ccc;
  display: inline-block;
  padding: 6px 12px;
  cursor: pointer;
}

.btn-edit{
  margin-bottom: 1vh;
}

</style>
<script>

</script>

</html>

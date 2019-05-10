<%@ page language ="java" contentType="text/html" pageEncoding="UTF-8" session="false"%> 
<%@ page import='java.util.List'%>
<%@ page import='beans.User'%>
<%@ page import='beans.DateMatch'%>
<!DOCTYPE html>
<html lang="en">
<head>

  <title>User Profile Page</title>
  <!-- Required meta tags -->
  <!-- Upload image bar -->

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
      <% 
      HttpSession session = request.getSession();
      User profile = (User) request.getAttribute("target_profile");
      //userID=profile.getId();
      %>
    </div>
    <br></br>
    <img src="/modelo.png">
    <!-- Upload image bar -->
    <div class="custom-file-upload" style=padding-top:20px;>
      <label for="file-upload" class="custom-file-upload1">
        <i class="fa fa-cloud-upload"></i> Seleccionar foto de perfil
      </label>
      <input id="file-upload" type="file"/>
    </div>
    <!-- Upload image bar -->
    <br></br>
    <div class="card mx-auto mb-auto">
      <h1><%=profile.getName()%></h1>
      <q cite="https://www.imdb.com/title/tt0062622/quotes/qt0396921"><%=profile.getDescription()%></q></p>
      <!-- <p>Descripcion</p><%=profile.getDescription()%> -->
      <h5>Sexo</h5><%=profile.getGender()%>
      <h5>Fecha de nacimiento</h5><%=profile.getBirthdate()%><br></br>
      <%
      User current_user = (User) session.getAttribute("user");
      List<DateMatch> mutual_dates = (List<DateMatch>)request.getAttribute("mutual_dates");
      int flag=0;
      if(!mutual_dates.isEmpty()){%>
      <h5>Citas con <%=profile.getName()%></h5>
      <% 
      for(DateMatch dates:mutual_dates){
      if(dates.getStatus().equals("Finalizado")){%>
      <%System.out.println("[1]Debuug id: "+dates.getDateName(profile.getId()));%>
      <h7><%dates.getDateName(profile.getId());%></h7>
      <br></br><%
    }else{
    flag=1;
  }
}

}
if(flag==0){%>
<button class="btn btn-aux btn-secondary mr-1 text-center" role="button" id="date-btn">Proponer cita</button>
<%}%>
<div id="like-dislike-buttons">
  <p>
    <button class="btn btn-secondary mr-1" id="like-btn" role="button"><i class="fa fa-heart"></i> </button>
    <button class="btn btn-secondary ml-1" id="dislike-btn" role="button"><i class="fa fa-ban"></i></button>
  </p>
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


body{ padding:20px;}

.custom-file-upload input[type="file"] {
  display: none;
}
.custom-file-upload .custom-file-upload1 {
  border: 1px solid #ccc;
  display: inline-block;
  padding: 6px 12px;
  cursor: pointer;
}





</style>
<script>

</script>

</html>

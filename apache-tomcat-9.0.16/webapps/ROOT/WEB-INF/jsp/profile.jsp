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
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

</head>
<body>
  <%@include file ='/WEB-INF/jsp/navbar.jsp'%>
  <div class="col-md-8 text container-fluid text-center">
    <div class="titles">
      <h2>Perfil</h2>
      <%
      //HttpSession session = request.getSession();
      User profile = (User) request.getAttribute("target_profile");
      String own_profile = (String)request.getAttribute("own_profile");
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
      int pendiente=0;
      if(!mutual_dates.isEmpty()){%>
      <h5>Citas <%=profile.getName()%></h5>
      <% 
      for(DateMatch dates:mutual_dates){
      if(!dates.getStatus().equals("Rechazado") && !dates.getStatus().equals("Pendiente")){
      pendiente=0;%>
      <h5><%=dates.getDateName(profile.getId())%> --> Status <%=dates.getStatus()%></h5>
      <%
    }if (dates.getStatus().equals("Pendiente")){
    pendiente=1;
  }
}

}
if(pendiente==0 && own_profile=="false"){%>
<button class="btn btn-aux btn-secondary mr-1 text-center" role="button" id="date-btn">Proponer cita</button>
<%}%>
<%

if (own_profile.equals("true")) {
%><div id="like-dislike-buttons">
  <button onclick="appearForm()" class="btn btn-secondary mr-1" id="editProfile-btn" role="button"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></i> </button>
</div>
<%
}

%>


<!-- ----------------------------------------------------------------------------------------------------------------------------- -->

<div id="div-form">
  <div class="container">
    <div class="row">
      <div class="col-md-10 ">
        <form class="form-horizontal">
          <fieldset>
            <!-- Form Name -->
            <legend>Configuracion de usuario</legend>
            <!-- Text input-->
            <div class="form-group">
              <label class="col-md-4 control-label" for="Name (Full name)">Nombre completo</label>  
              <div class="col-md-4">
               <div class="input-group">
                 <div class="input-group-addon">
                  <i class="fa fa-user">
                  </i>
                </div>
                <input id="Name (Full name)" name="Name (Full name)" type="text" placeholder="Name (Full name)" class="form-control input-md">
              </div>


            </div>


          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-md-4 control-label" for="Date Of Birth">Edad mínima</label>  
            <div class="col-md-4">

              <div class="input-group">
               <div class="input-group-addon">
                 <i class="fa fa-birthday-cake"></i>

               </div>
               <input id="Date Of Birth" name="Date Of Birth" type="text" placeholder="Edad mínima" class="form-control input-md">
             </div>


           </div>
         </div>
         <!-- Text input-->
         <div class="form-group">
          <label class="col-md-4 control-label" for="Date Of Birth">Edad máxima</label>  
          <div class="col-md-4">

            <div class="input-group">
             <div class="input-group-addon">
               <i class="fa fa-birthday-cake"></i>     
             </div>
             <input id="Date Of Birth" name="Date Of Birth" type="text" placeholder="Edad máxima" class="form-control input-md">
           </div>


         </div>
       </div>


       <!-- Multiple Radios (inline) -->
       <div class="form-group">
        <label class="col-md-4 control-label" for="Gender">Busco</label>
        <div class="col-md-4"> 
          <label class="radio-inline" for="Gender-0">
            <input type="radio" name="Gender" id="Gender-0" value="1" checked="checked">
            Chicos
          </label> 
          <label class="radio-inline" for="Gender-1">
            <input type="radio" name="Gender" id="Gender-1" value="2">
            Chicas
          </label> 
          <label class="radio-inline" for="Gender-2">
            <input type="radio" name="Gender" id="Gender-2" value="3">
            Ambos
          </label>
        </div>
      </div>


      <!-- Textarea -->
      <div class="form-group">
        <label class="col-md-4 control-label" for="Overview (max 200 words)">Descripción</label>
        <div class="col-md-4">                     
          <textarea class="form-control" rows="10"  id="Overview (max 200 words)" name="Overview (max 200 words)">Descripción</textarea>
        </div>
      </div>


      <div class="form-group">
        <label class="col-md-4 control-label" ></label>  
        <div class="col-md-4">
          <a href="#" class="btn btn-success"><span class="glyphicon glyphicon-thumbs-up"></span> Submit</a>
          <a href="#" class="btn btn-danger" value=""><span class="glyphicon glyphicon-remove-sign"></span> Clear</a>

        </div>
      </div>

    </fieldset>
  </form>
</div>
<div class="col-md-2 hidden-xs">
  <img src="http://websamplenow.com/30/userprofile/images/avatar.jpg" class="img-responsive img-thumbnail ">
</div>


</div>
</div>
<!-- jQuery Version 1.11.1 -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>


</div>


<!-- ----------------------------------------------------------------------------------------------------------------------------- -->

<script>
  function appearForm() {
    var x = document.getElementById("div-form");
    if (x.style.display === "none") {
      x.style.display = "block";
    } else {
      x.style.display = "none";
    }
  }
</script>


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

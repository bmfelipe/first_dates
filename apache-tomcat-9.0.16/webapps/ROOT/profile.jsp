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
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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
    <img src="/WEB-INF/modelo.png">
    <!-- Upload image bar -->
    <div class="container">
      <div class="col-md-6">
        <div class="form-group">
          <label>Upload Image</label>
          <div class="input-group">
            <span class="input-group-btn">
              <span class="btn btn-default btn-file">
                Browse <input type="file" id="imgInp">
              </span>
            </span>
            <input type="text" class="form-control" readonly>
          </div>
          <img id='img-upload'/>
        </div>
      </div>
    </div>
    <!-- Upload image bar -->
    <br></br>
    <div class="card mx-auto mb-auto">
      <h1><%=profile.getName()%></h1>
      <p>Descripcion</p><%=profile.getDescription()%>
      <h5>Sexo</h5><%=profile.getGender()%>
      <h5>Fecha de nacimiento</h5><%=profile.getBirthdate()%><br></br>
      <%
      User current_user = (User) session.getAttribute("user");
      List<DateMatch> mutual_dates = (List<DateMatch>)request.getAttribute("mutual_dates");
      int flag=0;
      if(!mutual_dates.isEmpty()){%>
      <h5>Citas con <%=profile.getId()%></h5>
      <%
      for(DateMatch date:mutual_dates){
      if(date.getStatus()=="Finalizado"){
      date.getDateName(profile.getId());%><br></br><%
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
.btn-file {
  position: relative;
  overflow: hidden;
}
.btn-file input[type=file] {
  position: absolute;
  top: 0;
  right: 0;
  min-width: 100%;
  min-height: 100%;
  font-size: 100px;
  text-align: right;
  filter: alpha(opacity=0);
  opacity: 0;
  outline: none;
  background: white;
  cursor: inherit;
  display: block;
}

#img-upload{
  width: 100%;
}
</style>
<script>
  $(document).ready( function() {
    $(document).on('change', '.btn-file :file', function() {
      var input = $(this),
      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
      input.trigger('fileselect', [label]);
    });

    $('.btn-file :file').on('fileselect', function(event, label) {

      var input = $(this).parents('.input-group').find(':text'),
      log = label;

      if( input.length ) {
        input.val(log);
      } else {
        if( log ) alert(log);
      }
      
    });
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
          $('#img-upload').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
      }
    }

    $("#imgInp").change(function(){
      readURL(this);
    });   
  });
</script>

</html>

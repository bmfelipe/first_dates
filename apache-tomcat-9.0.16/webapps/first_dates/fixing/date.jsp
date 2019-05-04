<%@ page language = "java" contentType = "text/html" pageEncoding="UTF-8" session="false"%>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>

  <style>
    body {
      background-color: #333;
      color: white;
    }
    .container-fluid {
      font-family: "Open Sans";

    }
    .dropdown-toggle::after {
        display:none;
    }
    .btn:focus,.btn:active {
     outline: none !important;
     box-shadow: none;
   }

   #like-dislike-buttons {
     margin-top: 10px;
   }

   #heart {
     color: #aaa  ;
   }


  </style>

  <body>
    <%@ include file='navbar.jsp' %>
    <div class="container-fluid text-center">
      <div class="row">
        <div class="col-lg-4 ">
          <h2>Yo</h2>
          <div id="carousel-elem" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active" id="1">
                <img class=" w-50" src="modelo.png" alt="First slide">
              </div>

            </div>

          </div>

        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">

          <div id="date-container">
          <div id="heart" style="font-size: 3rem;">
            <i class="fa fa-heart fa-5x"></i>
          </div>
        </div>
        <h2>Detalles</h2>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <h2>Tu cita</h2>
          <div id="carousel-elem" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active" id="1">
                <img class=" w-50" src="modelo.png" alt="First slide">
              </div>

            </div>

          </div>
        </div><!-- /.col-lg-4 -->
      </div>
      <%-- <p class="display-1">Página de Inicio de <%
          HttpSession session = request.getSession(false);
          String user = (String) session.getAttribute("username");
          %> <%= "@"+user %>
      </p> --%>
    </div>
  </body>
  <script>

  $('#like-btn').on('click', function(event) {
    event.preventDefault();
    console.log($(this).attr("user-id"));
      // $.ajax({
      //     'url' : 'http://localhost:9189/first_dates/add-like',
      //     'method' : 'POST',
      //     'data' : {
      //         'userId' : user,
      //         'recommendationId' : recommendationId
      //     },
      //     success(function(data){
      //         console.log("Sent data");
      //     })
      // });
  });
  // $('#dislike-btn').on('click', function(event) {
  //   event.preventDefault();
  //   $.ajax({
  //       'url' : 'http://localhost:9189/first_dates/delete-recommendation',
  //       'method' : 'POST',
  //       'data' : {
  //           'userId' : userId,
  //           'recommendationId' : recommendationId
  //       },
  //       success:function(data){
  //           console.log("Sent data");
  //       }
  //   });
  // });

  $('#carousel-elem').on('slid.bs.carousel', function (ev) {
    var id = ev.relatedTarget.id;
    document.getElementById('like-btn').setAttribute("user-id", id);
    document.getElementById('dislike-btn').setAttribute("user-id", id);

  });
  </script>
</html>

<%@ page language = "java" contentType = "text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <title>Home</title>
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
   #date-container {
     background: #666;
   }

  </style>

  <body>
    <%@ include file='navbar.jsp' %>
    <div class="container-fluid text-center">
      <div class="row">
        <div class="col-lg-4 ">
          <h2>Recommendations</h2>
          <div id="carousel-elem" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active" id="1">
                <img class=" w-50" src="modelo.png" alt="First slide">
              </div>
              <div class="carousel-item" id="2">
                <img class=" w-50" src="modelo.png" alt="Second slide">
              </div>
              <div class="carousel-item" id="3">
                <img class=" w-50" src="modelo.png" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carousel-elem" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel-elem" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
          <div id="like-dislike-buttons">

            <p>
              <a class="btn btn-secondary mr-1" href="#" id="like-btn" user-id="1" role="button"><i class="fa fa-heart"></i> </a>
              <a class="btn btn-secondary ml-1" href="#" id="dislike-btn" user-id="1" role="button"><i class="fa fa-ban"></i></a></p>
          </div>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <h2>Dates</h2>
          <div id="date-container">
          <table class="table table-striped table-dark">

            <tbody>
              <tr>
                <td>Angel</td>
                <td>
                  <p><a class="btn btn-secondary" href="#" role="button">Profile</a></p>
                </td>
                <td>Date set</td>
                <td>
                  <p><a class="btn btn-secondary" href="#" role="button">Edit</a></p>
                </td>
              </tr>
              <tr>
                <td>Britney</td>
                <td>
                  <p><a class="btn btn-secondary" href="#" role="button">Profile</a></p>
                </td>
                <td>Match</td>
                <td>
                  <p><a class="btn btn-secondary" href="#" role="button">Edit</a></p>
                </td>
              </tr>
              <tr>
                <td>Alice</td>
                <td>
                  <p><a class="btn btn-secondary" href="#" role="button">Profile</a></p>
                </td>
                <td>Date set</td>
                <td>
                  <p><a class="btn btn-secondary" href="#" role="button">Edit</a></p>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
          <h2>Heading</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
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

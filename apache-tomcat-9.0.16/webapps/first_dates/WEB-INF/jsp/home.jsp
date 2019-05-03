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
    <%@ include file='navbar.jsp'%>
    <div class="container-fluid text-center">
      <div class="row">
        <div class="col-lg-4 ">
          <h2>Recommendations</h2>
          <form action>
          <div id="carousel-elem" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <%
              List<User> recommendations = (List<User>) session.getAttribute("recommendations");
              if(recommendations == null){


              %>
              <div class="carousel-item active">
                <img class=" w-50" src="" alt="No recommendations">
              </div>
              <%}else{
                int index = 0;
                for(User user: recommendations){
                  if(index == 0){
                    String firstId = user.getId();
                  %>
                    <div class="carousel-item active">
                      <img class=" w-50" src="<%=user.getPhoto()%>" id="<%=user.getId()%>">
                    </div>
                  <%
                  }else{
              %>
                    <div class="carousel-item active">
                      <img class=" w-50" src="<%=user.getPhoto()%>" id="<%=user.getId()%>">
                    </div>
              <%

                  }
                  index++;
                }
              %>
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
              <button class="btn btn-secondary mr-1" id="like-btn" recommendation-id="<%=firstId%>" role="button"><i class="fa fa-heart"></i> </button>
              <button class="btn btn-secondary ml-1" id="dislike-btn" recommendation-id="<%=firstId%>" role="button"><i class="fa fa-ban"></i></button>
            </p>
          </div>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <h2>Dates</h2>
          <div id="date-container">
          <table class="table table-striped table-dark">

            <tbody>
              <%
                List<DateMatch> dates = (List<DateMatch>) session.getAttribute("dates");
                if(dates != null){
                  for(DateMatch date: dates){
                    %>
                    <tr>
                      <td><%=date.getDateName()%></td>
                      <td>
                        <p><a class="btn btn-secondary" href="profile?id=<%=date.getDateId()%>" role="button">Profile</a></p>
                      </td>
                      <td><%=date.getStatus()%></td>
                      <td>
                        <p><a class="btn btn-secondary" href="date?id=<%=date.getId()%>" role="button">Edit</a></p>
                      </td>
                    </tr>

                    <%
                  }
              %>

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
    </div>
  </body>

<script>

$('#like-btn').on('click', function(event) {
  event.preventDefault();
  var recommendationId = $(this).attr("recommendation-id");
    $.ajax({
        'url' : 'http://localhost:9189/first_dates/add-like',
        'method' : 'POST',
        'data' : {
            'userId' : '<%=user.getId()%>',
            'recommendationId' : recommendationId
        },
        success:function(data){
            console.log("Sent data");
        }
    });
});

$('#dislike-btn').on('click', function(event) {
  event.preventDefault();
  var recommendationId = $(this).attr("recommendation-id");
  $.ajax({
      'url' : 'http://localhost:9189/first_dates/delete-recommendation',
      'method' : 'POST',
      'data' : {
          'userId' : '<%=user.getId()%>',
          'recommendationId' : recommendationId
      },
      success:function(data){
          console.log("Sent data");
      }
  });
});

$('#carousel-elem').on('slid.bs.carousel', function (ev) {
  var id = ev.relatedTarget.id;
  document.getElementById('like-btn').setAttribute("recommendation-id", id);
  document.getElementById('dislike-btn').setAttribute("recommendation-id", id);

});
</script>
</html>

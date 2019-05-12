<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@ page import='java.util.List'%>
<%@ page import='beans.User'%>
<%@ page import='beans.DateMatch'%>
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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  </head>

  <style>
    body {
      height: 100vh;
      background-size: cover;
      background-image: url("resources/background/photo1.jpg");
      color: white;
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
   .card {
     height: 71vh;
     background-color: rgba(20, 20, 20, 0.8);
     padding-top: 20px;
     padding-bottom: 20px;
   }
   .card::-webkit-scrollbar {
     width: 0 !important;
   }

   #like-dislike-buttons {
     margin-top: 10px;
   }
   #date-container {
     padding-left: 10px;
     padding-right: 10px;

     overflow-y:auto;
     overflow-x:hidden;
   }
   #no-rec {
     margin: auto;
     font-size: 15px;
   }
   #carousel-elem {
     padding-top: 20px;
   }

   #left-container {
     margin: auto;
   }
  #days {
    margin:auto;
    font-size:30vh;
  }

  #days-left-container {
    overflow-y: hidden;
  }

  .opacity {
    background-color: rgba(20, 20, 20, 0.6);
    min-height: 100vh;
  }

  .fa-angle-down{
    padding-bottom: 15px;
  }
  .col-3{
    padding: 0;
    margin:0
  }

  </style>

  <body>
    <div class="opacity">
    <%@ include file='navbar.jsp'%>

    <div class="container-fluid text-center">
      <div class="row">
        <div class="col-lg-4 ">
          <h2>Recomendaciones</h2>
          <i class="fas fa-angle-down"></i>
          <div class="card mb-4 overflow-auto">
            <div id="left-container">
              <%
              List<User> recommendations = (List<User>) request.getAttribute("recommendations");
              int firstId = -1;
              // HttpSession sessionHome = request.getSession();
              // User user = (User) session.getAttribute("user");
              if(recommendations.isEmpty()){
                %>

                <div id="no-rec">No hay recomendaciones disponibles</div>
                <%
              }else{
                int index = 0;
                for(User recommendation: recommendations){
                  if(index == 0){
                     firstId = recommendation.getId();
                  %>
                    <div id=carousel-container len="<%=recommendations.size()%>">
                    <div id="carousel-elem" class="carousel slide" data-ride="carousel">

                      <div class="carousel-inner">

                        <div class="carousel-item active" id="<%=recommendation.getId()%>">
                          <img class=" w-50" src="/user-image?id=<%=recommendation.getId()%>" id="car-<%=recommendation.getId()%>" onerror="this.src='resources/default.png'">
                          <h2 class="pt-2"><%=recommendation.getName()%></h2>
                        </div>
                      <%
                      }else{
                  %>

                        <div class="carousel-item" id="<%=recommendation.getId()%>">
                          <img class=" w-50" src="/user-image?id=<%=recommendation.getId()%>" id="car-<%=recommendation.getId()%>" onerror="this.src='resources/default.png'">

                          <h2 class="pt-2"><%=recommendation.getName()%></h2>
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
              <%}%>
              <%
              if(firstId != -1){

              %>
                <div id="like-dislike-buttons">

                  <p>
                    <button class="btn btn-secondary mr-1" id="like-btn" recommendation-id="<%out.println( firstId );%>" role="button"><i class="fa fa-heart"></i> </button>
                    <button class="btn btn-secondary ml-1" id="dislike-btn" recommendation-id="<%out.println( firstId );%>" role="button"><i class="fa fa-ban"></i></button>
                  </p>
                </div>
              </div>

              <%
            }
              %>
            </div>
          </div>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <h2>Citas</h2>
          <i class="fas fa-angle-down"></i>
          <div class="card mb-4 overflow-auto">
            <%
              List<DateMatch> dates = (List<DateMatch>) request.getAttribute("dates");
              int count = 0;
              if(!dates.isEmpty()){
                %>
            <div id="date-container">

                  <%-- <table class="table table-striped table-hover table-dark table-fixed">

                    <tbody>

                      <%
                      for(DateMatch date: dates){
                        %>
                        <tr>
                          <td><%=date.getDateName(user.getId())%></td>
                          <td>
                            <p><a class="btn btn-secondary" href="/profile?id=<%=date.getDateId(user.getId())%>" role="button">Perfil</a></p>
                          </td>
                          <td><%=date.getStatus()%></td>
                          <td>
                            <p><a class="btn btn-secondary" href="/date?id=<%=date.getDateId(user.getId())%>" role="button">Editar</a></p>
                          </td>
                        </tr>

                        <%
                        count++;
                      }
                    %> --%>
                    <%
                    for(DateMatch date: dates){
                      %>
                      <div class="row">
                        <div class="col-3 text_center">
                          <h6><%=date.getDateName(user.getId())%></h6>
                        </div>
                        <div class="col-3 text_center">
                        <p><a class="btn btn-secondary" href="/profile?id=<%=date.getDateId(user.getId())%>" role="button">Perfil</a></p>
                        </div>
                        <div class="col-3 text_center">
                          <h6><%=date.getStatus()%></h6>
                        </div>
                        <div class="col-3 text_center">
                          <%
                          if(date.getStatus().equals("Cita solicitada")){%>
                          <p><a class="btn btn-secondary btn-success" id="accept-date" href="/date-manager?result=yes&id=<%=date.getId()%>" role="button">Aceptar</a></p>
                          <p><a class="btn btn-secondary btn-danger" id="reject-date"href="/date-manager?result=no&id=<%=date.getId()%>" role="button">Rechazar</a></p>
                          <%}else{%>
                          <p><a class="btn btn-secondary" href="/date?id=<%=date.getDateId(user.getId())%>" role="button">Editar</a></p>
                          <%}%>
                        </div>
                      </div>
                      <hr>

                      <%
                      count++;
                    }
                  %>


                <%-- </tbody>
              </table> --%>


            </div>
            <%}else{
              %>
              <div id="no-rec">No tienes citas aun</div>
              <%
            }
          %>
          </div>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <h2>Días hasta siguiente cita</h2>
          <i class="fas fa-angle-down"></i>
          <div class="card mb-4 overflow-auto">
            <%
            User userDateInfo = (User) request.getAttribute("userDateInfo");
            DateMatch dateInfo = (DateMatch) request.getAttribute("dateInfo");

            if(dateInfo.getDaysUntilDate() != -1){%>
              <div id="days-left-container">
                <%if(dateInfo.getDaysUntilDate() == 1){%>
                  <h1>Queda</h1>
                <%}else{%>
                  <h1>Quedan</h1>
                <%}%>
                <h1 id="days"><%=dateInfo.getDaysUntilDate()%></h1>
                <%if(dateInfo.getDaysUntilDate() == 1){%>
                  <h1>día para tu cita con <%=userDateInfo.getName()%>, la fecha es: <%=dateInfo.getDateResponse()%>.</h1>
                <%}else{%>
                  <h1>días para tu cita con <%=userDateInfo.getName()%>, la fecha es: <%=dateInfo.getDateResponse()%>.</h1>
                <%}%>

              </div>
            <%}else{%>
            <div id="no-rec">Cuando tengas una cita fijada, la información saldrá  aqui</div>
            <%}%>
          </div>
        </div><!-- /.col-lg-4 -->
      </div>
    </div>
    </div>
  </body>

<script>

var liked = "";
$('#like-btn').on('click', function(event) {
  event.preventDefault();
  var recommendationId = $(this).attr("recommendation-id");
  var len = $('#carousel-container').attr("len");
    $.post('http://localhost:9189/add-like',{'recommendationId' : recommendationId})
    .done(function(data){
      $('.carousel').carousel('next');

      liked = recommendationId;
      len--;

      if(len == 0){
          $('#carousel-container').remove()
          $('#left-container').append("<div id='no-rec'>No quedan mas recomendaciones</div>").css("margin", "auto", "font-size", "15px");
      }else{
        document.getElementById('carousel-container').setAttribute("len", len);
      }



    });
});

$('#carousel-elem').on('slide.bs.carousel', function (ev) {

  $('#like-btn').prop('disabled', true);
  $('#dislike-btn').prop('disabled', true);


});
$('#dislike-btn').on('click', function(event) {
  event.preventDefault();
  var recommendationId = $(this).attr("recommendation-id");
  var len = $('#carousel-container').attr("len");
    $.post('http://localhost:9189/add-dislike',{'recommendationId' : recommendationId})
    .done(function(data){
      $('.carousel').carousel('next');

      liked = recommendationId;
      len--;

      if(len == 0){
          $('#carousel-container').remove()
          $('#left-container').append("<div id='no-rec'>No quedan mas recomendaciones</div>").css("margin", "auto", "font-size", "15px");
      }else{
        document.getElementById('carousel-container').setAttribute("len", len);
      }



    });
});

$('#carousel-elem').on('slid.bs.carousel', function (ev) {
  var id = ev.relatedTarget.id;
  if(liked != ""){
    $("#"+liked ) . remove () ;
    liked = "";
  }
  document.getElementById('like-btn').setAttribute("recommendation-id", id);
  document.getElementById('dislike-btn').setAttribute("recommendation-id", id);
  $('#like-btn').prop('disabled', false);
  $('#dislike-btn').prop('disabled', false);

});
</script>
</html>

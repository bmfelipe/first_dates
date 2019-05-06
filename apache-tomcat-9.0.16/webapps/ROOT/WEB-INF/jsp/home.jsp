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
  </head>

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

  <body>
    <%@ include file='navbar.jsp'%>
    <div class="container-fluid text-center">
      <div class="row">
        <div class="col-lg-4 ">
          <div class="card mb-4">
            <div class="titles">
              <h2>Recomendaciones</h2>
            </div>
            <%
            List<User> recommendations = (List<User>) request.getAttribute("recommendations");
            int firstId = -1;
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
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
                  <div id="carousel-elem" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img class=" w-50" src="/user-image?id=<%=recommendation.getId()%>" id="<%=recommendation.getId()%>">
                      </div>
                    <%
                    }else{
                %>
                      <div class="carousel-item active">
                        <img class=" w-50" src="/user-image?id=<%=recommendation.getId()%>" id="<%=recommendation.getId()%>">
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
            <%
          }
            %>
          </div>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <div class="card mb-4">
            <div class="titles">
              <h2>Citas</h2>
            </div>
            <%
              List<DateMatch> dates = (List<DateMatch>) request.getAttribute("dates");
              int count = 0;
              if(!dates.isEmpty()){
                %>
            <div id="date-container">

                  <table class="table table-striped table-hover table-dark table-fixed">

                    <tbody>

                      <%
                      for(DateMatch date: dates){
                        %>
                        <tr>
                          <td><%=date.getDateName(user.getId())%></td>
                          <td>
                            <p><a class="btn btn-secondary" href="profile?id=<%=date.getDateId(user.getId())%>" role="button">Perfil</a></p>
                          </td>
                          <td><%=date.getStatus()%></td>
                          <td>
                            <p><a class="btn btn-secondary" href="date?id=<%=date.getId()%>" role="button">Editar</a></p>
                          </td>
                        </tr>

                        <%
                        count++;
                      }
                    %>



                </tbody>
              </table>

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
          <div class="card mb-4">
            <div class="titles">
              <h2>Info siguiente cita</h2>
            </div>

            <div id="no-rec">Cuando tengas una cita fijada, la información saldrá  aqui</div>
            <%-- <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p> --%>
          </div>
        </div><!-- /.col-lg-4 -->
      </div>
    </div>
  </body>

<script>

$('#like-btn').on('click', function(event) {
  event.preventDefault();
  var recommendationId = $(this).attr("recommendation-id");
  <% %>
    $.ajax({
        'url' : 'http://localhost:9189/add-like',
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
      'url' : 'http://localhost:9189/first_dates/add-dislike',
      'method' : 'POST',
      'data' : {
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

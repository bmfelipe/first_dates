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
    <script src="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"></script>
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

   /* -----------------------------------------
   Timeline
----------------------------------------- */
.timeline {
  list-style: none;
  padding-left: 0;
  position: relative;
}
.timeline:after {
  content: "";
  height: auto;
  width: 1px;
  background: #e3e3e3;
  position: absolute;
  top: 5px;
  left: 30px;
  bottom: 25px;
}
.timeline.timeline-sm:after {
  left: 12px;
}
.timeline li {
  position: relative;
  padding-left: 70px;
  margin-bottom: 20px;
}
.timeline li:after {
  content: "";
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background: #e3e3e3;
  position: absolute;
  left: 24px;
  top: 5px;
}
.timeline li .timeline-date {
  display: inline-block;
  width: 100%;
  color: #a6a6a6;
  font-style: italic;
  font-size: 13px;
}
.timeline.timeline-icons li {
  padding-top: 7px;
}
.timeline.timeline-icons li:after {
  width: 32px;
  height: 32px;
  background: #fff;
  border: 1px solid #e3e3e3;
  left: 14px;
  top: 0;
  z-index: 11;
}
.timeline.timeline-icons li .timeline-icon {
  position: absolute;
  left: 23.5px;
  top: 7px;
  z-index: 12;
}
.timeline.timeline-icons li .timeline-icon [class*=glyphicon] {
  top: -1px !important;
}
.timeline.timeline-icons.timeline-sm li {
  padding-left: 40px;
  margin-bottom: 10px;
}
.timeline.timeline-icons.timeline-sm li:after {
  left: -5px;
}
.timeline.timeline-icons.timeline-sm li .timeline-icon {
  left: 4.5px;
}
.timeline.timeline-advanced li {
  padding-top: 0;
}
.timeline.timeline-advanced li:after {
  background: #fff;
  border: 1px solid #29b6d8;
}
.timeline.timeline-advanced li:before {
  content: "";
  width: 52px;
  height: 52px;
  border: 10px solid #fff;
  position: absolute;
  left: 4px;
  top: -10px;
  border-radius: 50%;
  z-index: 12;
}
.timeline.timeline-advanced li .timeline-icon {
  color: #29b6d8;
}
.timeline.timeline-advanced li .timeline-date {
  width: 75px;
  position: absolute;
  right: 5px;
  top: 3px;
  text-align: right;
}
.timeline.timeline-advanced li .timeline-title {
  font-size: 17px;
  margin-bottom: 0;
  padding-top: 5px;
  font-weight: bold;
}
.timeline.timeline-advanced li .timeline-subtitle {
  display: inline-block;
  width: 100%;
  color: #a6a6a6;
}
.timeline.timeline-advanced li .timeline-content {
  margin-top: 10px;
  margin-bottom: 10px;
  padding-right: 70px;
}
.timeline.timeline-advanced li .timeline-content p {
  margin-bottom: 3px;
}
.timeline.timeline-advanced li .timeline-content .divider-dashed {
  padding-top: 0px;
  margin-bottom: 7px;
  width: 200px;
}
.timeline.timeline-advanced li .timeline-user {
  display: inline-block;
  width: 100%;
  margin-bottom: 10px;
}
.timeline.timeline-advanced li .timeline-user:before,
.timeline.timeline-advanced li .timeline-user:after {
  content: " ";
  display: table;
}
.timeline.timeline-advanced li .timeline-user:after {
  clear: both;
}
.timeline.timeline-advanced li .timeline-user .timeline-avatar {
  border-radius: 50%;
  width: 32px;
  height: 32px;
  float: left;
  margin-right: 10px;
}
.timeline.timeline-advanced li .timeline-user .timeline-user-name {
  font-weight: bold;
  margin-bottom: 0;
}
.timeline.timeline-advanced li .timeline-user .timeline-user-subtitle {
  color: #a6a6a6;
  margin-top: -4px;
  margin-bottom: 0;
}
.timeline.timeline-advanced li .timeline-link {
  margin-left: 5px;
  display: inline-block;
}
.timeline-load-more-btn {
  margin-left: 70px;
}
.timeline-load-more-btn i {
  margin-right: 5px;
}


/* -----------------------------------------
   Dropdown
----------------------------------------- */
.dropdown-menu{
    padding:0 0 0 0;
}
a.dropdown-menu-header {
    background: #f7f9fe;
    font-weight: bold;
    border-bottom: 1px solid #e3e3e3;
}
.dropdown-menu > li a {
    padding: 10px 20px;
}

/* -----------------------------------------
   Badge
----------------------------------------- */

.badge{
    padding: 3px 5px 2px;
    position: absolute;
    top: 8px;
    right: 5px;
    display: inline-block;
    min-width: 10px;
    font-size: 12px;
    font-weight: bold;
    color: #ffffff;
    line-height: 1;
    vertical-align: baseline;
    white-space: nowrap;
    text-align: center;
    border-radius: 10px;
}
.badge-danger {
    background-color: #db5565;
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
          <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img class=" w-50" src="modelo.png" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class=" w-50" src="modelo.png" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class=" w-50" src="modelo.png" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
          <div id="like-dislike-buttons">

            <p>
              <a class="btn btn-secondary mr-1" href="#" role="button">Like </a>
              <a class="btn btn-secondary ml-1" href="#" role="button">Dislike </a></p>
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

</html>

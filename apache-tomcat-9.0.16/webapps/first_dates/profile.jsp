<%@ page language ="java" contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>User Profile Page</title>
  <!-- Required meta tags -->

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!--<link rel="icon" href="img/favicon.png" type="image/png">-->

  <!-- Bootstrap CSS 
  <link rel="stylesheet" href="/WEB-INF/jsp/stylesheets/bootstrap.css" type="text/css">
  <link rel="stylesheet" href="/WEB-INF/jsp/stylesheets/iconstyle.css" type="text/css">
  <link rel="stylesheet" href="/WEB-INF/jsp/stylesheets/font-awesome.min.css" type="text/css">-->

  <!-- main css
  <link rel="stylesheet" href="/WEB-INF/jsp/stylesheets/style.css" type="text/css">
  <link rel="stylesheet" href="/WEB-INF/jsp/stylesheets/responsive.css" type="text/css"> -->
</head>
<body>

  <!--================Header Menu Area =================-->

  <%@ include file ='/WEB-INF/jsp/navbar.jsp'%>
  <!--================Header Menu Area =================-->

  <!--================Home Banner Area =================-->
  <section class="home_banner_area">
    <div class="container box_1620">
      <div class="banner_inner d-flex align-items-center">
        <div class="banner_content">
          <div class="media">
            <div class="d-flex">
              <img src="modelo.png" alt="">
            </div>
            <div class="media-body">
              <div class="personal_text">
                <h6>Saludos me llamo</h6>
                <h3>Susana Oria</h3>
                <p>Contenta, pero no mucho</p>
                <ul class="list basic_info">
                  <li><a href="#"><i class="lnr lnr-calendar-full"></i> 14 Mayo 1990</a></li>
                  <li><a href="#"><i class="lnr lnr-phone-handset"></i> 695783157</a></li>
                  <li><a href="#"><i class="lnr lnr-envelope"></i> @SusanaOria</a></li>
                  <li><a href="#"><i class="lnr lnr-home"></i> Madrid</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================End Home Banner Area =================-->    
  <!--================Footer Area =================-->
    <!--================End Footer Area =================-->
  </body>
  <style>
    .home_banner_area {
  position: relative;
  z-index: 1;
  background-image: -moz-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
  background-image: -webkit-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
  background-image: -ms-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
  margin-bottom: 200px; }
  .home_banner_area .banner_inner {
    min-height: 650px;
  }
  .banner_content .media{
    display: block;
  }
  .home_banner_area .banner_inner .banner_content .media .d-flex img {
    width: 100%;
    height: 100%;
  }
  .media-body {
    -ms-flex: 1;
    flex: 1
}
.personal_text h6 {
  font-size: 14px;
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  letter-spacing: 2.1px;
  font-weight: normal;
  margin-bottom: 12px;
  color: #222222; }
.personal_text h4 {
  font-size: 16px;
  font-weight: 500;
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  margin-bottom: 20px;
  color: #222222; }
.personal_text h3 {
  font-size: 48px;
  text-transform: uppercase;
  margin-bottom: 15px;
  color: #222222; }
.personal_text p {
  font-family: "Roboto", sans-serif;
  max-width: 540px;
  color: #777777;
  margin-bottom: 40px; }
  </style>
  </html>
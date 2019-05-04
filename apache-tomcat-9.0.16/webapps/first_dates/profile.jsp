<%@ page language ="java" contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>User Profile Page</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>

  <!--================Header Menu Area =================-->

  <%@include file ='/fixing/navbar.jsp'%>
  <!--================Header Menu Area =================-->

  <!--================Home Banner Area =================-->
  <section class="home_banner_area">
    <div class="container box_1620">
      <div class="banner_inner d-flex align-items-center" align="center">
        <div class="banner_content">
          <div class="media">
            <div class="d-flex">
              <img src="modelo.png" alt="">
            </div>
            <div class="media-body">
              <div class="personal_text">
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
     width: 200px;
     height: 200px;
     max-width: 200px;
     max-height: 200px;
     -webkit-border-radius: 100%;
     -moz-border-radius: 100%;
     border-radius: 50%;
     border: 5px solid rgba(255,255,255,0.5);
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
    color: #222222; 
  }
  .personal_text h4 {
    font-size: 16px;
    font-weight: 500;
    font-family: "Roboto", sans-serif;
    text-transform: uppercase;
    margin-bottom: 20px;
    color: #222222; 
  }
  .personal_text h3 {
    font-size: 48px;
    text-transform: uppercase;
    margin-bottom: 15px;
    color: #222222; 
  }
  .personal_text p {
    font-family: "Roboto", sans-serif;
    max-width: 540px;
    color: #777777;
    margin-bottom: 40px; 
  }
  .lnr {
    font-family: 'Linearicons-Free';
    speak: none;
    font-style: normal;
    font-weight: normal;
    font-variant: normal;
    text-transform: none;
    line-height: 1;

    /* Better Font Rendering =========== */
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }
  .lnr-calendar-full:before {
    content: "\e836";
  }
  .lnr-phone-handset:before {
    content: "\e830";
  }

</style>
</html>
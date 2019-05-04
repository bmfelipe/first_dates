<%@ page language ="java" contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>User Profile Page</title>
  <!-- Required meta tags -->

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!--<link rel="icon" href="img/favicon.png" type="image/png">-->

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href=".../stylesheets/bootstrap.css" type="text/css">
  <link rel="stylesheet" href=".../stylesheets/iconstyle.css" type="text/css">
  <link rel="stylesheet" href=".../stylesheets/font-awesome.min.css" type="text/css">

  <!-- main css -->
  <link rel="stylesheet" href=".../stylesheets/style.css" type="text/css">
  <link rel="stylesheet" href=".../stylesheets/responsive.css" type="text/css">
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
  <footer class="footer_area p_120">
    <div class="container">
      <div class="row footer_inner">
        <div class="col-lg-5 col-sm-6">
          <aside class="f_widget ab_widget">
            <div class="f_title">
              <h3>About Me</h3>
            </div>
            <p>Do you want to be even more successful? Learn to love learning and growth. The more effort you put into improving your skills,</p>
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
            </aside>
          </div>
          <div class="col-lg-5 col-sm-6">
            <aside class="f_widget news_widget">
              <div class="f_title">
                <h3>Newsletter</h3>
              </div>
              <p>Stay updated with our latest trends</p>
              <div id="mc_embed_signup">
                <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe_form relative">
                  <div class="input-group d-flex flex-row">
                    <input name="EMAIL" placeholder="Enter email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address '" required="" type="email">
                    <button class="btn sub-btn"><span class="lnr lnr-arrow-right"></span></button>    
                  </div>        
                  <div class="mt-10 info"></div>
                </form>
              </div>
            </aside>
          </div>
          <div class="col-lg-2">
            <aside class="f_widget social_widget">
              <div class="f_title">
                <h3>Follow Me</h3>
              </div>
              <p>Let us be social</p>
              <ul class="list">
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                <li><a href="#"><i class="fa fa-behance"></i></a></li>
              </ul>
            </aside>
          </div>
        </div>
      </div>
    </footer>
    <!--================End Footer Area =================-->
  </body>
  </html>
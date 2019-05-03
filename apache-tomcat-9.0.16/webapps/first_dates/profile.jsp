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
  <link rel="stylesheet" href="/WEB-INF/jsp/stylesheets/bootstrap.css">
  <link rel="stylesheet" href="/WEB-INF/jsp/stylesheets/iconstyle.css">
  <link rel="stylesheet" href="/WEB-INF/jsp/stylesheets/font-awesome.min.css">

  <!-- main css -->
  <link rel="stylesheet" href="/WEB-INF/jsp/stylesheets/style.css">
  <link rel="stylesheet" href="/WEB-INF/jsp/stylesheets/responsive.css">
</head>
<body>

  <!--================Header Menu Area =================-->

<div>
      <nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <a class="navbar-brand" href="#">First Dates</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Profile</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Dates</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">People</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Restaurants</a>
        </li>
      </ul>
      <%-- <form class="form-inline mt-2 mt-md-0">
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form> --%>
      <div class="dropdown">

        <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
          <span class="caret"></span>
          <i class="fa fa-bell-o" style="font-size: 30px; float: left; color: gray"></i>
        </button>
        <ul class="dropdown-menu dropdown-menu-left float-right"
           role="menu" aria-labelledby="dropdownMenu1">
               <li role="presentation" class="dropdown-item"> <a href="#" class="dropdown-menu-header">Notifications</a>
               </li>
               <ul class="timeline timeline-icons timeline-sm" style="margin:10px;width:210px">
                   <li>
                       <p>Your &#x201C;Volume Trendline&#x201D; PDF is ready <a href="">here</a>
                           <span
                           class="timeline-icon"><i class="fa fa-file-pdf-o" style="color:red"></i>
                               </span> <span class="timeline-date">Dec 10, 22:00</span>
                       </p>
                   </li>
                   <li>
                       <p>Your &#x201C;Marketplace Report&#x201D; PDF is ready <a href="">here</a>
                           <span
                           class="timeline-icon"><i class="fa fa-file-pdf-o" style="color:red"></i>
                               </span> <span class="timeline-date">Dec 6, 10:17</span>
                       </p>
                   </li>
                   <li>
                       <p>Your &#x201C;Top Words&#x201D; spreadsheet is ready <a href="">here</a>
                           <span
                           class="timeline-icon"><i class="fa fa-file-excel-o" style="color:green"></i>
                               </span> <span class="timeline-date">Dec 5, 04:36</span>
                       </p>
                   </li>
               </ul>
               <li role="presentation" class="dropdown-item"> <a href="#" class="dropdown-menu-header"></a>
               </li>
           </ul>
      </div>
      <div class="dropdown">
        <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
          <span class="caret"></span>
          <img class="bd-placeholder-img rounded-circle bg-white" dropdown-toggle width="50" height="50" src="anonymous.png">
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
         <button class="dropdown-item" type="button">Profile</button>
         <button class="dropdown-item" type="button">Settings</button>
         <div class="dropdown-divider"></div>
         <button class="dropdown-item" type="button">Exit</button>
        </div>
      </div>

    </div>

  </nav>
</div>

<style>
.dropdown-menu {
  right: 0;
  left:auto;

}

.navbar{
  padding-top: 0;
  padding-bottom: 0;
  margin-bottom: 25px;
}
</style>

  <!--<%@ include file ='/WEB-INF/jsp/navbar.jsp'%>-->
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
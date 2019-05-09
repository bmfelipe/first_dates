<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" session="false"%>

<div>
      <nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <a class="navbar-brand" href="#">First Dates</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="/home">Home<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/profile">Perfil</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Citas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Personas</a>
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
        <ul id="drop-menu" class="dropdown-menu dropdown-menu-left float-right"
           role="menu" aria-labelledby="dropdownMenu1">
               <li role="presentation" class="dropdown-item"> <a href="#" class="dropdown-menu-header">Notificaciones</a>
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
         <button class="dropdown-item" type="button">Perfil</button>
         <button class="dropdown-item" type="button">Configuración</button>
         <div class="dropdown-divider"></div>
         <a class="dropdown-item" href="/ServletLogout">Salir</a>
        </div>
      </div>

    </div>

  </nav>
</div>

<style>
#drop-menu {
  right: 0;
  left:auto;

}

.navbar{
  padding-top: 0;
  padding-bottom: 0;

}
</style>

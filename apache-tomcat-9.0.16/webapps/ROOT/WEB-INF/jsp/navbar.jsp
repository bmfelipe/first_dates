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
      </ul>
      <a class="btn btn-secondary" href="/logout" role="button">Salir <i class="fa fa-sign-out" aria-hidden="true"></i></a>
    </div>
  </nav>
</div>

<style>
  .navbar{
    padding-top: 10px;
    padding-bottom: 10px;
  }
</style>

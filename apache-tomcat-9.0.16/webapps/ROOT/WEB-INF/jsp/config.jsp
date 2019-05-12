<%@ page language ="java" contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@ page import='java.util.List'%>
<%@ page import='beans.User'%>
<%@ page import='beans.DateMatch'%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Configuracion</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
</head>
<%-- <body>
	<%@include file ='/WEB-INF/jsp/navbar.jsp'%>
	<div id="div-form" >
		<div class="container">
			<div class="row">
				<div class="col-md-10 ">
					<form action="/config" method="post" class="form-horizontal">
						<fieldset>
							<!-- Form Name -->
							<legend>Cambiar preferencias</legend>
							<!-- Text input-->
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Date Of Birth">Edad mínima</label>
								<div class="col-md-4">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-birthday-cake"></i>
										</div>
										<input id="Date Of Birth" name="minAge" type="text" placeholder="Edad mínima" class="form-control input-md">
									</div>


								</div>
							</div>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Date Of Birth">Edad máxima</label>
								<div class="col-md-4">

									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-birthday-cake"></i>
										</div>
										<input id="Date Of Birth" name="maxAge" type="text" placeholder="Edad máxima" class="form-control input-md">
									</div>


								</div>
							</div>


							<!-- Multiple Radios (inline) -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Gender">Busco</label>
								<div class="col-md-4">
									<label class="radio-inline" for="Gender-0">
										<input type="radio" name="gender" id="Gender-0" value="Hombre" checked="checked">
										Chicos
									</label>
									<label class="radio-inline" for="Gender-1">
										<input type="radio" name="gender" id="Gender-1" value="Mujer">
										Chicas
									</label>
									<label class="radio-inline" for="Gender-2">
										<input type="radio" name="gender" id="Gender-2" value="Ambos">
										Ambos
									</label>
								</div>
							</div>


							<!-- Textarea -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Overview (max 200 words)">Descripción</label>
								<div class="col-md-4">
									<textarea class="form-control" rows="10"  id="Overview (max 200 words)" name="descripcion">Descripción</textarea>
								</div>
							</div>


							<div class="form-group">
								<label class="col-md-4 control-label" ></label>
								<div class="col-md-4">
									<button href="/config" class="btn btn-success" type="submit"><span class="glyphicon glyphicon-thumbs-up"></span> Submit</button>
									<a href="/profile-redirect" class="btn btn-danger" value=""><span class="glyphicon glyphicon-remove-sign"></span> Clear</a>

								</div>
							</div>

						</fieldset>
					</form>
				</div>
				<div class="col-md-2 hidden-xs">
					<img src="http://websamplenow.com/30/userprofile/images/avatar.jpg" class="img-responsive img-thumbnail ">
				</div>


			</div>
		</div>
		<!-- jQuery Version 1.11.1 -->
		<script src="js/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js"></script>


	</div>

</body> --%>
<body>
	<%@include file ='/WEB-INF/jsp/navbar.jsp'%>

	<div class="opacity">
		<div class="container-fluid text-center">
			<div class="row">
				<div class="col-lg-12">
					<h2>Preferencias</h2>
					<i class="fas fa-angle-down"></i>
					<div class="card mx-auto mb-4 overflow-auto">

						<form action="/config" method="post">

							<div class="d-flex justify-content-center">

								<div class="form-group">
									<h5>Edad Mínima</h5>
									<div class="input-group">
										<input class="form-control" type="text" name="minAge" placeholder="Edad mínima deseada" autocomplete="off">
	                  <div class="input-group-append">
	                    <span class="fa fa-birthday-cake input-group-text" aria-hidden="true"></span>
	                  </div>
									</div>
								</div>

							</div>

							<div class="d-flex justify-content-center">

								<div class="form-group">
									<h5>Edad Máxima</h5>
									<div class="input-group">
										<input class="form-control" type="text" name="maxAge" placeholder="Edad máxima deseada" autocomplete="off">
	                  <div class="input-group-append">
	                    <span class="fa fa-birthday-cake input-group-text" aria-hidden="true"></span>
	                  </div>
									</div>
								</div>

							</div>

							<div class="d-flex justify-content-center">

								<div class="form-group">
									<h5>Busco</h5>
									<div class="input-group">
										<select class="form-control" name="gender">
		                  <option value="Mujer">Chicas</option>
		                  <option value="Hombre">Chicos</option>
											<option value="Ambos">Ambos</option>
		                </select>
		                <div class="input-group-append">
		                  <span class="fa fa-venus-mars input-group-text start_date_calendar" aria-hidden="true"></span>
		                </div>
									</div>
								</div>


							</div>

							<div class="d-flex justify-content-center">

								<div class="form-group">
									<h5>Descripción</h5>
									<div class="input-group">
										<textarea class="form-control" rows="4" cols="30" id="Overview (max 200 words)" name="descripcion" placeholder="Descríbase aquí"></textarea>
									</div>
								</div>

							</div>

							<div class="d-flex justify-content-center">

								<div class="form-group">
									<div class="input-group">
										<button href="/config" class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-thumbs-up"></span>Editar</button>
										<a href="/profile-redirect" class="btn btn-secondary"><span class="glyphicon glyphicon-remove-sign"></span>Limpiar</a>
									</div>
								</div>

							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<style type="text/css">
	body {
		background-image: url("resources/background/photo2.jpg");
		background-size: cover;
		color: white;
		height: 100vh;
	}

	.fa-angle-down {
    padding-bottom: 15px;
  }

	.opacity {
		background-color: rgba(20, 20, 20, 0.5);
		min-height: 100vh;
	}

	.container-fluid {
		padding-top: 25px;
		font-family: "Open Sans";
	}

	.card {
		height: 70vh;
		background-color: rgba(20, 20, 20, 0.8);
		padding-top: 20px;
		padding-bottom: 20px;
		width: 70%;
	}

	.card::-webkit-scrollbar {
		width: 0 !important
	}

	.btn-primary {
		margin-right: 1vh;
	}

	.form-group {
		margin-bottom: 5vh;
	}

</style>
</html>

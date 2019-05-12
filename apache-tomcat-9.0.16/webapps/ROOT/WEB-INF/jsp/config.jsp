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
</head>
<body>
	<%@include file ='/WEB-INF/jsp/navbar.jsp'%>
	<div id="div-form">
		<div class="container">
			<div class="row">
				<div class="col-md-10 ">
					<form action="/config" method="post" class="form-horizontal">
						<fieldset>
							<!-- Form Name -->
							<legend>Configuracion de usuario</legend>
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
									<a href="#" class="btn btn-success"><span class="glyphicon glyphicon-thumbs-up"></span> Submit</a>
									<a href="#" class="btn btn-danger" value=""><span class="glyphicon glyphicon-remove-sign"></span> Clear</a>

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

</body>
</html>
<%@ page language ="java" contentType="text/html" pageEncoding="UTF-8" session="false"%> 
<%@ page import='java.util.List'%>
<%@ page import='beans.User'%>
<%@ page import='beans.DateMatch'%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Configuracion</title>
</head>
<body>
	<%@include file ='/WEB-INF/jsp/navbar.jsp'%>
	<div id="div-form">
		<div class="container">
			<div class="row">
				<div class="col-md-10 ">
					<form class="form-horizontal">
						<fieldset>
							<!-- Form Name -->
							<legend>Configuracion de usuario</legend>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Name (Full name)">Nombre completo</label>  
								<div class="col-md-4">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-user">
											</i>
										</div>
										<input id="Name (Full name)" name="Name (Full name)" type="text" placeholder="Name (Full name)" class="form-control input-md">
									</div>


								</div>


							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Date Of Birth">Edad mínima</label>  
								<div class="col-md-4">

									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-birthday-cake"></i>

										</div>
										<input id="Date Of Birth" name="Date Of Birth" type="text" placeholder="Edad mínima" class="form-control input-md">
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
										<input id="Date Of Birth" name="Date Of Birth" type="text" placeholder="Edad máxima" class="form-control input-md">
									</div>


								</div>
							</div>


							<!-- Multiple Radios (inline) -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Gender">Busco</label>
								<div class="col-md-4"> 
									<label class="radio-inline" for="Gender-0">
										<input type="radio" name="Gender" id="Gender-0" value="1" checked="checked">
										Chicos
									</label> 
									<label class="radio-inline" for="Gender-1">
										<input type="radio" name="Gender" id="Gender-1" value="2">
										Chicas
									</label> 
									<label class="radio-inline" for="Gender-2">
										<input type="radio" name="Gender" id="Gender-2" value="3">
										Ambos
									</label>
								</div>
							</div>


							<!-- Textarea -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Overview (max 200 words)">Descripción</label>
								<div class="col-md-4">                     
									<textarea class="form-control" rows="10"  id="Overview (max 200 words)" name="Overview (max 200 words)">Descripción</textarea>
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
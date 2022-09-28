<jsp:include page="intranetValida.jsp" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>


<title>Gestion Libreria  </title>
</head>
<body>
       
<jsp:include page="intranetCabecera.jsp" />
<div class="container">&nbsp;<br>&nbsp;<br>&nbsp;<br>
<h4>Registro de Usuario</h4>
<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />
</div>

<div class="container" >
 <div class="col-md-12" align="center"> 
	<form action="registraUsuarioBD" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombres">Nombres</label>
				<input class="form-control" type="text" id="id_nombres" name="nombres" placeholder="Ingrese el nombres">
			</div>
			                                    <div class="form-group">            
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Apellido Paterno</label>
													<input class="form-control" id="id_reg_apaterno" name="apaterno" placeholder="Ingrese el Apellido Paterno" type="text" maxlength="5"/>
		                                        </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_amaterno">Apellido Materno</label>
													<input class="form-control" id="id_reg_amaterno" name="amaterno" placeholder="Ingrese el Apellido Materno" type="text" maxlength="5"/>
		                                        </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaNacimiento">Fecha Nacimiento</label>
													<input class="form-control" id="id_reg_fechaNacimiento" name="fechaNacimiento" placeholder="Ingrese la Fecha de Nacimiento" type="text" maxlength="5"/>
		                                        </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaRegistro">Fecha Registro</label>
													<input class="form-control" id="id_reg_fechaRegistro" name="fechaRegistro" placeholder="Ingrese la Fecha de Registro" type="text" maxlength="5"/>
		                                        </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_email">Email</label>
													<input class="form-control" id="id_reg_email" name="email" placeholder="Ingrese el Email" type="text" maxlength="5"/>
		                                        </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estado">Estado</label>                                        
													<input class="form-control" id="id_reg_estado" name="estado" placeholder="Ingrese el Estado" type="text" maxlength="5"/>
		                                        </div>                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_celular">Celular</label>                           
													<input class="form-control" id="id_reg_celular" name="celular" placeholder="Ingrese el nro de Celular" type="text" maxlength="9"/>
		                                        </div>                       
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_direccion">Dirección</label>                         
													<input class="form-control" id="id_reg_direccion" name="direccion" placeholder="Ingrese la Dirección" type="text" maxlength="5"/>
		                                        </div>                       
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_login">Login</label>                                
													<input class="form-control" id="id_reg_login" name="login" placeholder="Ingrese un Login" type="text" maxlength="5"/>
		                                        </div>         
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_password">Password</label>                                   
													<input class="form-control" id="id_reg_password" name="password" placeholder="Ingrese un Password" type="text" maxlength="9"/>
		                                        </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_dni">DNI</label>
													<input class="form-control" id="id_reg_dni" name="dni" placeholder="Ingrese el DNI" type="text" maxlength="8"/>
		                                        </div>
		
			<div class="form-group">
				<label class="control-label" for="id_tipousuario">Tipo de Usuario</label>
				<select id="id_tipousuario" name="tipousuario.idTipoUsuario" class='form-control'>
					<option value=" ">[Seleccione]</option> 
					<c:forEach var="x" items="${requestScope.objTipoUsuario}">
			            <option value="${x.idTipoUsuario}">${x.nombre}</option>
			        </c:forEach>   
				</select>
		    </div>
		    	</form>
		    
		    
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Registra Usuario</button>
			</div>
			
			
<script type="text/javascript">

$("#idBtnElimina").click(function(){
	$("#idFormElimina").submit();
});


function eliminar(id){	
	$('#idModalElimina').modal('show');
	$('#id_elimina').val(id);	
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,codigo,nombre,estado,idSistemaEvaluacion){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombre]').val(nombre);
	$('input[id=id_act_apaterno]').val(apaterno);
	$('input[id=id_act_amaterno]').val(amaterno);
	$('input[id=id_act_fechaNacimiento]').val(fechaNacimiento);
	$('input[id=id_act_fechaRegistro]').val(fechaRegistro);
	$('input[id=id_act_email]').val(email);
	$('input[id=id_act_estado]').val(estado);
	$('input[id=id_act_celular]').val(celular);
	$('input[id=id_act_direccion]').val(direccion);
	$('input[id=id_act_login]').val(login);
	$('input[id=id_act_password]').val(password);
	$('input[id=id_act_dni]').val(dni);
	$('select[id=id_act_tipousuario]').val(idTipoUsuario);
	$('#idModalActualiza').modal("show");
}


$(document).ready(function() {
    $('#tablePaginacion').DataTable();
} );
</script>
			
			

	
 </div>
</div> 

 		 		
</body>
</html>
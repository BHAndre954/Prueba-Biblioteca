<jsp:include page="intranetValida.jsp" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
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
<div class="container" style="margin-top: 4%">
<h3>Mantenimiento Usuario</h3>
  <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudUsuario">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudUsuario" class="simple_form" id="defaultForm2"  method="post">

					<div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="submit" class="btn btn-primary" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" style="width: 150px">REGISTRA</button>
						</div>
						<div class="col-md-4">
							<c:if test="${sessionScope.MENSAJE != null }">
									<div class="alert alert-success" id="success-alert">
							 		   <button type="button" class="close" data-dismiss="alert">x</button>
										${sessionScope.MENSAJE}				
									</div>
							</c:if>
							<c:remove var="MENSAJE"/>
						</div>
					</div>
					
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tablePaginacion" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombres</th>
												<th>Apellido Paterno</th>
												<th>Apellido Materno</th>
												<th>Fecha Nacimiento</th>
												<th>Fecha Registro</th>
												<th>Email</th>
												<th>Estado</th>
												<th>Celular</th>
												<th>Dirección</th>
												<th>Login</th>
												<th>Password</th>
												<th>DNI</th>
												<th>idTipoUsuario</th>
											
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${sessionScope.usuarios}" var="x">
													<tr>
														<td>${x.idUsuario}</td>
														<td>${x.nombres}</td>
														<td>${x.apaterno}</td>
														<td>${x.amaterno}</td>
														<td>${x.fechaNacimiento}</td>
														<td>${x.fechaRegistro}</td>
														<td>${x.email}</td>
														<td>${x.estado}</td>
														<td>${x.celular}</td>
														<td>${x.direccion}</td>
														<td>${x.login}</td>
														<td>${x.password}</td>
														<td>${x.dni}</td>
														<td>${x.tipoUsuario.nombre}</td>
														<td>
<button type='button' data-toggle='modal' onclick="editar('${x.idUsuario}','${x.nombres}','${x.apaterno}','${x.amaterno}','${x.fechaNacimiento}','${x.fechaRegistro}','${x.email}','${x.estado}','${x.celular}','${x.direccion}','${x.login}','${x.password}','${x.dni}','${x.tipoUsuario.idTipoUsuario}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idUsuario}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'> 
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Usuario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudUsuario" class="form-horizontal" method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Usuario</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                
		                                
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombres">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombres" name="nombres" placeholder="Ingrese el Nombre" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Apellido Paterno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="apaterno" placeholder="Ingrese el Apellido Paterno" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_amaterno">Apellido Materno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_amaterno" name="amaterno" placeholder="Ingrese el Apellido Materno" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaNacimiento">Fecha Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_fechaNacimiento" name="fechaNacimiento" placeholder="Ingrese la Fecha de Nacimiento" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaRegistro">Fecha Registro</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_fechaRegistro" name="fechaRegistro" placeholder="Ingrese la Fecha de Registro" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_email">Email</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_email" name="email" placeholder="Ingrese el Email" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estado">Estado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_estado" name="estado" placeholder="Ingrese el Estado" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_celular">Celular</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_celular" name="celular" placeholder="Ingrese el nro de Celular" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_direccion">Dirección</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_direccion" name="direccion" placeholder="Ingrese la Dirección" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_login">Login</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_login" name="login" placeholder="Ingrese un Login" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_password">Password</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_password" name="password" placeholder="Ingrese un Password" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_dni" name="dni" placeholder="Ingrese el DNI" type="text" maxlength="8"/>
		                                        </div>
		                                    </div>
		                             </div>
		                             
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tipoUsuario">id Tipo Usuario</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_tipoUsuario" name="tipoUsuario.idTipoUsuario" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                </form>   
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Usuario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudUsuario" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Curso</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idUsuario" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombres" name="nombres" placeholder="Ingrese el Nombre" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_apaterno">Apellido Paterno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_apaterno" name="apaterno" placeholder="Ingrese el Apellido Paterno" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_amaterno">Apellido Materno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_amaterno" name="amaterno" placeholder="Ingrese el Apellido Materno" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fechaNacimiento">Fecha Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fechaNacimiento" name="fechaNacimiento" placeholder="Ingrese la Fecha de Nacimiento" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fechaRegistro">Fecha Registro</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fechaRegistro" name="fechaRegistro" placeholder="Ingrese la Fecha de Registro" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_email">Email</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_email" name="email" placeholder="Ingrese el Email" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_estado" name="estado" placeholder="Ingrese el Estado" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_celular">Celular</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_celular" name="celular" placeholder="Ingrese el nro de Celular" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_direccion">Dirección</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_direccion" name="direccion" placeholder="Ingrese la Dirección" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_login">Login</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_login" name="login" placeholder="Ingrese un Login" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_password">Password</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_password" name="password" placeholder="Ingrese un Password" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_dni" name="dni" placeholder="Ingrese el DNI" type="text" maxlength="8"/>
		                                        </div>
		                                    </div>                     
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_tipoUsuario">id Tipo Usuario</label>
		                                        <div class="col-lg-5">
													<select id="id_act_tipoUsuario" name="tipoUsuario.idTipoUsuario" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
		
		<div class="modal fade" id="idModalElimina" >
					<div class="modal-dialog" style="width: 60%">
				 	
				 	<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Usuario</h4>
						</div>
				
						  <div class="modal-footer">
						    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR</button>
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						  </div>
					</div>
				</div>
    </div>
</div>	
<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">
$.getJSON("cargatipousuario", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_tipoUsuario").append("<option value="+item.idTipoUsuario +">"+ item.nombre +"</option>");
		$("#id_act_tipoUsuario").append("<option value="+item.idTipoUsuario +">"+ item.nombre +"</option>");
	});
	
});
</script>

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

function editar(id,nombres,apaterno,amaterno,fechaNacimiento,fechaRegistro,email,estado,celular,direccion,login,password,dni,idTipoUsuario){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombres]').val(nombres);
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
	$('select[id=id_act_tipoUsuario]').val(idTipoUsuario);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tablePaginacion').DataTable();
} );
</script>

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombres": {
        		selector : '#id_reg_nombres',
                validators: {
                    notEmpty: {
                        message: 'El Nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El Nombre es de 3 a 5 caracteres',
                    	min : 3,
                    	max : 5
                    }
                }
            },
        	"apaterno": {
        		selector : '#id_reg_apaterno',
                validators: {
                    notEmpty: {
                        message: 'El Apellido Paterno es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El Apellido Parterno es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
        	"amaterno": {
        		selector : '#id_reg_amaterno',
                validators: {
                    notEmpty: {
                        message: 'El Apellido Materno es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El Apellido Materno es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "fechaNacimiento": {
        		selector : '#id_reg_fechaNacimiento',
                validators: {
                    notEmpty: {
                        message: 'La fecha de nacimiento es un campo obligatorio'
                    },
                    date :{
                    	format: 'YYYY-MM-DD',
                    	message:'La fecha de nacimiento tiene formato YYYY-MM-DD',
                    }
                }
            },
            "fechaRegistro": {
        		selector : '#id_reg_fechaRegistro',
                validators: {
                    notEmpty: {
                        message: 'La fecha de registro es un campo obligatorio'
                    },
                    date :{
                    	format: 'YYYY-MM-DD',
                    	message:'La fecha de registro tiene formato YYYY-MM-DD',
                    }
                }
            },
            "email": {
        		selector : '#id_reg_email',
                validators: {
                	notEmpty: {
                        message: 'El correo es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El correo es entre 6 y 100 caracteres',
                    	min : 6,
                    	max : 100
                    },
                    regex: {
    					regex:"/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/",
    					message:"Formato de correo incorrecto"
                    }
                }
            },
            "estado": {
        		selector : '#id_reg_estado',
                validators: {
                    notEmpty: {
                        message: 'El estado es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El estado es de 6 a 8 caracteres',
                    	min : 6,
                    	max : 8
                    }
                }
            },
            "celular": {
              	 selector : '#id_reg_celular',
                   validators: {
                       notEmpty: {
                      	 message:'Ingrese su número de Celular por favor'
                       },
                       digits: {
                      	 message:'Ingrese Celular'
                       },
                       celular: {
                           country: 'Inserte número de celular'
                       },
                   }
               },
            "direccion":{
           		selector : '#id_reg_direccion',
        		validators :{
        			notEmpty :{
        				message : 'La dirección es obligatorio'
        			},
        			stringLength : {
        				message: "la dirección es de 5 a 20 caracteres",
        				min : 5,
        				max: 15
        			}
        		}        		
        	},
        	"login": {
        		selector : '#id_reg_login',
                validators: {
                    notEmpty: {
                        message: 'El login es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El login es de 2 a 95 caracteres',
                    	min : 2,
                    	max : 95
                    }
                }
            },
            "password": {
        		selector : '#id_reg_password',
                validators: {
                    notEmpty: {
                        message: 'El password es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El password es de 2 a 25 caracteres',
                    	min : 2,
                    	max : 25
                    }
                }
            },
            "dni": {
        		selector : '#id_reg_dni',
                validators: {
                    notEmpty: {
                        message: 'El DNI es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El DNI es de 5 a 8 caracteres',
                    	min : 5,
                    	max : 8
                    }
                }
            },
            "tipoUsuario.idTipoUsuario": {
        		selector : '#id_reg_tipoUsuario',
                validators: {
                	notEmpty: {
                        message: 'El Tipo de Usuario es un campo obligatorio'
                    },
                }
            },
        	
        }   
    });
</script>

<script type="text/javascript">
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombres": {
        		selector : '#id_act_nombres',
                validators: {
                    notEmpty: {
                        message: 'El Nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El Nombre es de 3 a 5 caracteres',
                    	min : 3,
                    	max : 5
                    }
                }
            },
        	"apaterno": {
        		selector : '#id_act_apaterno',
                validators: {
                    notEmpty: {
                        message: 'El Apellido Paterno es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El Apellido Parterno es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
        	"amaterno": {
        		selector : '#id_act_amaterno',
                validators: {
                    notEmpty: {
                        message: 'El Apellido Materno es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El Apellido Materno es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "fechaNacimiento": {
        		selector : '#id_act_fechaNacimiento',
                validators: {
                    notEmpty: {
                        message: 'La fecha de nacimiento es un campo obligatorio'
                    },
                    date :{
                    	format: 'YYYY-MM-DD',
                    	message:'La fecha de nacimiento tiene formato YYYY-MM-DD',
                    }
                }
            },
            "fechaRegistro": {
        		selector : '#id_act_fechaRegistro',
                validators: {
                    notEmpty: {
                        message: 'La fecha de registro es un campo obligatorio'
                    },
                    date :{
                    	format: 'YYYY-MM-DD',
                    	message:'La fecha de registro tiene formato YYYY-MM-DD',
                    }
                }
            },
            "email": {
        		selector : '#id_act_email',
                validators: {
                	notEmpty: {
                        message: 'El correo es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El correo es entre 6 y 100 caracteres',
                    	min : 6,
                    	max : 100
                    },
                    regex: {
    					regex:"/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/",
    					message:"Formato de correo incorrecto"
                    }
                }
            },
            "estado": {
        		selector : '#id_act_estado',
                validators: {
                    notEmpty: {
                        message: 'El estado es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El estado es de 6 a 8 caracteres',
                    	min : 6,
                    	max : 8
                    }
                }
            },
            "celular": {
              	 selector : '#id_act_celular',
                   validators: {
                       notEmpty: {
                      	 message:'Ingrese su número de Celular por favor'
                       },
                       digits: {
                      	 message:'Ingrese Celular'
                       },
                       celular: {
                           country: 'Inserte número de celular'
                       },
                   }
               },
            "direccion":{
           		selector : '#id_act_direccion',
        		validators :{
        			notEmpty :{
        				message : 'La dirección es obligatorio'
        			},
        			stringLength : {
        				message: "la dirección es de 5 a 20 caracteres",
        				min : 5,
        				max: 15
        			}
        		}        		
        	},
        	"login": {
        		selector : '#id_act_login',
                validators: {
                    notEmpty: {
                        message: 'El login es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El login es de 2 a 95 caracteres',
                    	min : 2,
                    	max : 95
                    }
                }
            },
            "password": {
        		selector : '#id_act_password',
                validators: {
                    notEmpty: {
                        message: 'El password es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El password es de 2 a 25 caracteres',
                    	min : 2,
                    	max : 25
                    }
                }
            },
            "dni": {
        		selector : '#id_act_dni',
                validators: {
                    notEmpty: {
                        message: 'El DNI es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El DNI es de 5 a 8 caracteres',
                    	min : 5,
                    	max : 8
                    }
                }
            },
            "tipoUsuario.idTipoUsuario": {
        		selector : '#id_act_tipoUsuario',
                validators: {
                	notEmpty: {
                        message: 'El Tipo de Usuario es un campo obligatorio'
                    },
                }
            },
        	
        }   
    });
</script>

    
</body>
</html> 
	
	






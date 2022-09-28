<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<jsp:include page="intranetValida.jsp" />
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
<h4>Registro de Libro</h4>
</div>
  

<div class="container" >
 <div class="col-md-12" align="center"> 
		<div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudLibro">
			  		<input type="hidden" id="el_idLibro" name="idLibro" />
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudLibro" class="simple_form" id="defaultForm2"  method="post">

					<div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_titulo_filtro" name="titulo" placeholder="Ingrese el titulo" type="text" maxlength="30"/>
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
												<th>Codigo</th>
												<th>Titulo</th>
												<th>Estado</th>
												<th>Tipo</th>
												<th>Tipo de Libro</th>
												<th>Editar</th>
												<th>Eliminar</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${sessionScope.libros}" var="x">
													<tr>
														<td>${x.idLibro}</td>
														<td>${x.codigo}</td>
														<td>${x.titulo}</td>
														<td>${x.estado}</td>
														<td>${x.tipo}</td>
														<td>${x.tipoLibro.nombre}</td>
														<td>
<button type='button' data-toggle='modal' onclick="editar('${x.idLibro}','${x.codigo}','${x.titulo}','${x.estado}','${x.tipo}','${x.tipoLibro.idTipoLibro}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idLibro}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'> 
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Curso</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraCrudLibro" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Libro</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
											<input type="hidden" id="reg_idLibro" name="idLibro" />

		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="reg_codigo">Codigo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="reg_codigo" name="codigo" placeholder="Ingrese el Codigo" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="reg_titulo">Titulo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="reg_titulo" name="titulo" placeholder="Ingrese el Titulo" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                	<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="reg_estado">Estado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="reg_estado" name="estado" placeholder="Ingrese el Estado" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="reg_tipo">Tipo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="reg_tipo" name="tipo" placeholder="Ingrese el Tipo" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="reg_tipoLibro">Tipo Libro</label>
		                                        <div class="col-lg-5">
													<select id="reg_tipoLibro" name="tipoLibro.idTipoLibro" class='form-control'> 
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Libro</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraCrudLibro" class="form-horizontal" method="post">
		                    <div class="panel-group" id="steps">

		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Libro</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_idLibro">Id</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="ac_idLibro" name="idLibro" readonly="readonly"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_codigo">Codigo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="ac_codigo" name="codigo" placeholder="Ingrese el codigo" type="text" maxlength="15"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_titulo">Titulo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="ac_titulo" name="titulo" placeholder="Ingrese el Titulo" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_estado">Estado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="ac_estado" name="estado" placeholder="Ingrese el Estado" type="text" maxlength="50"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_tipo">Tipo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="ac_tipo" name="tipo" placeholder="Ingrese el Tipo" type="text" maxlength="50"/>
		                                        </div>
		                                    </div>	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="ac_tipoLibro">Sistema de Evaluacion</label>
		                                        <div class="col-lg-5">
													<select id="ac_tipoLibro" name="tipoLibro.idTipoLibro" class='form-control'>  
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
					<div class="modal-content">

						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Libro</h4>
						</div>
						<div class="form-group">
                             <label class="col-lg-3 control-label" for="eli_idLibro">Id</label>
                             <div class="col-lg-5">
									<input class="form-control" id="eli_idLibro" name="idLibro" readonly="readonly"/>
                             </div>
		             </div>
						  <div class="modal-footer">
						    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR</button>
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						  </div>
					</div>
			</div>
		</div>
				
</div>  
</div>  

<script type="text/javascript">
$.getJSON("getTipoLibros", {}, function(data, q,t){
	$.each(data, function(index,item){
		$("#reg_tipoLibro").append("<option value="+item.idTipoLibro+">"+ item.nombre +"</option>");
	});
	$.each(data, function(index,item){
		$("#ac_tipoLibro").append("<option value="+item.idTipoLibro+">"+ item.nombre +"</option>");
	});	
});

$("#idBtnElimina").click(function(){
	$("#idFormElimina").submit();
});


function eliminar(id){	
	$('#idModalElimina').modal('show');
	$('#el_idLibro').val(id);	
	$('#eli_idLibro').val(id);	
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,codigo,titulo,estado,tipo,idtipo){	
	$('#ac_idLibro').val(id);
	$('#ac_codigo').val(codigo);
	$('#ac_titulo').val(titulo);
	$('#ac_estado').val(estado);
	$('#ac_tipo').val(tipo);
	$('#ac_tipoLibro').val(idtipo);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tablePaginacion').DataTable();
} );
</script> 		
</body>
</html>
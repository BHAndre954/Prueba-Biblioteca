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
<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />
</div>


<div class="modal-dialog" style="width: 60%">
<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
				
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Libro</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
	<form action="registraCrudLibro" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_codigo">Codigo</label>
				<input class="form-control" type="text" id="id_nombre" name="codigo" placeholder="Ingrese el codigo">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_titulo">Titulo</label>
				<input class="form-control" type="text" id="id_titulo" name="titulo" placeholder="Ingrese el titulo">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_estado">Estado</label>
				<input class="form-control" type="text" id="id_estado" name="estado" placeholder="Ingrese el estado">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_tipo">Tipo</label>
				<input class="form-control" type="text" id="id_tipo" name="tipo" placeholder="Ingrese el tipo">
			</div>
			
			
			<div class="form-group">
				<label class="control-label" for="reg_tipoLibro">Tipo Libro</label>
				<select id="reg_tipoLibro" name="tipoLibro.idTipoLibro" class='form-control'> 
				 </select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Editorial</button>
			</div>
	</form>
	 </div>
 </div>
</div> 
<script type="text/javascript">
/*$.getJSON("cargaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});*/
///^\d{9}$/i,
</script>
<script type="text/javascript">

</script>

<script type="text/javascript">
$.getJSON("getTipoLibros", {}, function(data, q,t){
	$.each(data, function(index,item){
		$("#reg_tipoLibro").append("<option value="+item.idTipoLibro+">"+ item.nombre +"</option>");
	});
	$.each(data, function(index,item){
		$("#ac_tipoLibro").append("<option value="+item.idTipoLibro+">"+ item.nombre +"</option>");
	});	
});

$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>   		
</body>
</html>
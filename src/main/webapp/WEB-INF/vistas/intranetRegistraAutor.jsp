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
<h4>Registro de Autor</h4>
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
	<form action="registraAutorA" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombres">Nombres</label>
				<input class="form-control" type="text" id="id_nombres" name="nombres" placeholder="Ingrese los nombres">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_apaterno">Apellido Paterno</label>
				<input class="form-control" id="id_apaterno" name="apaterno" placeholder="Ingrese el apellido Paterno" type="text" maxlength="90"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_amaterno">Apellido Materno</label>
				<input class="form-control" id="id_amaterno" name="amaterno" placeholder="Ingrese el apellido materno" type="text" maxlength="90" />
			</div>
		
			<div class="form-group">
				<label class="control-label" for="id_pais">Pais</label>
				<select id="id_pais" name="pais.idPais" class='form-control'>
					<option value=" ">[Seleccione]</option> 
					<c:forEach var="x" items="${requestScope.objPais}">
			            <option value="${x.idPais}">${x.nombre}</option>
			        </c:forEach>   
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Autor</button>
			</div>
	</form>
	
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
$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombres: {
    		selector : '#id_nombres',
            validators: {
                notEmpty: {
                    message: 'Los nombres es un campo obligatorio'
                },
                stringLength :{
                	message:'Los nombres es de 2 a 100 caracteres',
                	min : 2,
                	max : 100
                }
            }
        },
        apaterno: {
    		selector : '#id_apaterno',
            validators: {
                notEmpty: {
                    message: 'El apellido paterno es obligatoria'
                },
	            stringLength :{
                	message:'El apellido paterno es de 2 a 100 caracteres',
                	min : 2,
                	max : 100
                }
            }
        },
        amaterno: {
    		selector : '#id_amaterno',
            validators: {
                notEmpty: {
                    message: 'El apellido materno es obligatoria'
                },
	            stringLength :{
                	message:'El apellido materno es de 2 a 100 caracteres',
                	min : 2,
                	max : 100
                }
            }
        },
        	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>   		 		
</body>
</html>
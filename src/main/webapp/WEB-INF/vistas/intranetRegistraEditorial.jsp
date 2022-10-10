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
<h4>Registro de Editorial</h4>
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
				
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Editorial</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
	<form action="registraEditorialBD" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_direccion">Direccion</label>
				<input class="form-control" id="id_direccion" name="direccion" placeholder="Ingrese la direccion" type="text" maxlength="90"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_telefono">Telefono</label>
				<input class="form-control" id="id_telefono" name="telefono" placeholder="Ingrese el telefono" type="text" maxlength="9" pattern="[1-9]{9}"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_correo">Correo</label>
				<input class="form-control" id="id_correo" name="correo" placeholder="Ingrese el correo" type="text" maxlength="50" pattern="[\w-\.]+@([\w-]+\.)+[\w-]{2,4}"/>
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
$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#id_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 2 a 100 caracteres',
                	min : 2,
                	max : 100
                }
            }
        },
        direccion: {
    		selector : '#id_direccion',
            validators: {
                notEmpty: {
                    message: 'La direccion es obligatoria'
                },
	            stringLength :{
                	message:'La direccion es de 2 a 100 caracteres',
                	min : 2,
                	max : 100
                }
            }
        },
        telefono: {
    		selector : '#id_telefono',         
        },
        correo: {
    		selector : '#id_correo',
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
        }   	
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
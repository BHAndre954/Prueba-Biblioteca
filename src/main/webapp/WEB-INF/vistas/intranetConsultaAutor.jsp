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
<div class="container" style="margin-top: 4%">
<h4>Consulta Autor</h4>

<form action=actionRegistraAutor id="id_form"> 
		<div class="row">
			<div class="col-md-3">		
				<div class="form-group">
					<select id="id_pais" name="autor.pais.idPais" class='form-control'>
						<option value="0">[Seleccione Pais]</option>    
						<option value="-1">[Todos]</option>    
					</select>
			    </div>
		 	</div>
		 </div>   
		 <div class="row">
		 	<div class="col-md-12">
				<div class="content" >
						<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>NOMBRES</th>
												<th>APELLIDO PATERNO</th>
												<th>APELLIDO MATERNO</th>
												<th>PAIS</th>
											</tr>
										</thead>
										<tbody>
												   

										</tbody>
							</table>	
					</div>	
				</div>
		 </div>
		    
	</form>
	
</div>

<script type="text/javascript">
	$("#id_pais").change(function(){
		
		 	$("#id_table tbody").empty(); 
		   
		 	var var_pais = $("#id_pais").val();
		 
		 	$.getJSON("consultaAutores", {"parametro":var_pais}, function(data){
				$.each(data, function(index,item){
					$("#id_table").append("<tr><td>"+ item.idAutor +"</td><td>"+ item.nombres +"</td><td>"+ item.apaterno +"</td><td>"+ item.amaterno +"</td><td>"+ item.pais.nombre +"</td><td>");
				});
			});
		 	
		
	});

	$.getJSON("listaTotalPaises",{}, function(data){
		$.each(data, function(i,obj){
			$("#id_pais").append("<option value='" + obj.idPais +  "'>" + obj.nombre +"</option>")
		})
	});
</script>

</body>
</html>




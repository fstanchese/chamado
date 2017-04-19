<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<style type="text/css">
	<c:set var="path" value="${pageContext.request.contextPath}" scope="request"/>
	@IMPORT url("${path}/resources/css/bootstrap.min.css");
	@IMPORT url("${path}/resources/css/bootstrap-theme.min.css");
	@IMPORT url("${path}/resources/css/custom.css");
	@IMPORT url("${path}/resources/css/style.css");
	body{
	  background: -webkit-linear-gradient(left, #dcdfe8, #4b62a8);
	  background: linear-gradient(to right, #dcdfe8, #4b62a8);
	}
	section{
	  margin: 50px;
	}
</style>
<meta charset="UTF-8">
<title>Chamado - Atendimento</title>
<style>
    .error {
        color: red; font-weight: bold; font-size: 12px;
    }
</style>
</head>
<body>
	<div class="container">
		<c:import url="..\cabecalho.jsp" />
		<form:form commandName="chamado" class="form-horizontal" action="${path}/chamados/atenderChamado" method="post">
		<form:input path="id" type="hidden" value="${chamado.id}"/>
		
		<div class="panel panel-group">
     		<div class="panel panel-primary">
   				<div class="panel-heading">
	   					<strong>Atender Chamado</strong>
   				</div>
   			</div>
   			<br>
			<div class="panel-body">
			
				<div class="row top-buffer">
				<div class="col-sm-12">
					<label for="assunto">Assunto</label> 
					<form:textarea id="assunto" path="assunto"  class="form-control"  rows="1"/>
					<form:errors path="assunto" cssClass="error"/>
				</div>
				</div>
								
				<div class="row top-buffer">
				<div class="col-sm-12">
					<label for="descricao">Descrição</label> 
					<form:textarea id="descricao" path="descricao"  class="form-control"  rows="10"/>
					<form:errors path="descricao" cssClass="error"/>
				</div>
				</div>
						
				<div class="row top-buffer">
				<div class="col-sm-12">
						<button type="submit" class="btn btn-primary">Salvar</button>
						<a href="${pageContext.request.contextPath}/chamados" class="btn btn-default">Cancelar</a>
				</div>
				</div> 	
			</div> 	
   			<div class="panel-footing">
   				<div class="clearfix">
   					<h1 class="panel-title"></h1>
   				</div>
   			</div>			
		</div>	
		</form:form>
		<br>
	</div>
	<script src="${path}/resources/js/jquery.min.js" 		type="text/javascript"></script>
	<script src="${path}/resources/js/bootstrap.min.js" 	type="text/javascript"></script>
	<script src="${path}/resources/js/jquery.maskedinput-1.3.1.min.js" type="text/javascript"></script>
	<script src="${path}/resources/js/chamado.js" 			type="text/javascript"></script>
</body>
</html>
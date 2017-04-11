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
</style>
<meta charset="UTF-8">
<title>Fila</title>
<style>
    .error {
        color: red; font-weight: bold; font-size: 12px;
    }
</style>
</head>
<body>
	<div class="container">
		<c:import url="..\cabecalho.jsp" />
		<form:form commandName="fila" class="form-horizontal" action="${path}/filas/crudFila" method="post">
		<form:input path="id" type="hidden" value="${fila.id}"/>
		
		<div class="panel panel-info">
   			<div class="panel-heading">
   				<div class="clearfix">
   					<c:if test="${not empty fila.id}">
	   					<strong>Alterar Fila</strong>
					</c:if>
   					<c:if test="${empty fila.id}">
	   					<strong>Nova Fila</strong>
					</c:if>  					
   				</div>
   			</div>
   			<br>
			<div class="panel-body">
				<div class="row top-buffer">
				<div class="col-sm-12">
					<label for="descricao">Descrição</label> 
					<form:input path="descricao" type="text" class="form-control input-sm"  maxlength="100" autofocus="autofocus"/>
 					<form:errors path="descricao" cssClass="error"/>
				</div>
				</div>
				
				<div class="row top-buffer">
				<div class="col-sm-8">
					<label for="gerente">Gerente</label>
                    <form:select path="gerente" class="form-control" name="gerente">
					<option value=""></option>
					<c:forEach var="gerente" items="${gerentes}">
						<option value="${gerente.id}"
							${gerente.id==fila.gerente.id ? 'selected' : ''}>${gerente.nome}
						</option>
					</c:forEach>
					</form:select>
					<form:errors path="gerente" cssClass="error" />
				</div>
				<c:if test="${login.tipoUsuario eq 'ADMINISTRADOR'}">
					<div class="col-sm-4">
		                <label for="ativo">Ativo</label>
	                    <form:select path="ativo" class="form-control" name="ativo">
	                        <form:option value="1" label="Sim"/>
	                        <form:option value="0" label="Não"/>
	                    </form:select>
		            </div>
				</c:if>
				</div>
				
				<div class="row top-buffer">
				<div class="col-sm-12">
						<button type="submit" class="btn btn-primary">Salvar</button>
						<a href="${pageContext.request.contextPath}/filas" class="btn btn-default">Cancelar</a>
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
</body>
</html>
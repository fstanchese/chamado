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
.panel-heading {
   color: #fff;
   background-color: #428bca;
   border-color: #428bca;
    margin-top: 50px;
}
body{
		  background: -webkit-linear-gradient(left, #e1e5f2, #0c35b7);
		  background: linear-gradient(to right, #e1e5f2, #0c35b7);
}
</style>
<meta charset="UTF-8">
<title>Chamado</title>
<style>
    .error {
        color: red; font-weight: bold; font-size: 12px;
    }
</style>
</head>
<body>
	<div class="container">
		<c:import url="..\cabecalho.jsp" />
		<form:form commandName="chamado" class="form-horizontal" action="${path}/chamados/crudChamado" method="post">
		<form:input path="id" type="hidden" value="${chamado.id}"/>
		
		<div class="panel panel-group">
     		<div class="panel panel-primary">
   				<div class="panel-heading">
   					<c:if test="${not empty chamado.id}">
	   					<strong>Alterar Chamado</strong>
					</c:if>
   					<c:if test="${empty chamado.id}">
	   					<strong>Novo Chamado</strong>
					</c:if>  					
   				</div>
   			</div>
			<div class="panel-body">
			
				<div class="row top-buffer">
					<div class="col-sm-4">
						<label for="fila">Fila</label>
	                    <form:select path="fila" class="form-control" name="fila">
						<c:forEach var="fila" items="${filas}">
							<option value="${fila.id}"
								${fila.id==chamado.fila.id ? 'selected' : ''}>${fila.descricao}
							</option>
						</c:forEach>
						</form:select>
						<form:errors path="fila" cssClass="error" />
					</div>
					
					<div class="col-sm-4">
						<label for="sla">SLA Chamado</label>
                    	<form:select path="sla" class="form-control" name="sla">
						<c:forEach var="sla" items="${slas}">
							<option value="${sla.id}"
								${sla.id==chamado.sla.id ? 'selected' : ''}>${sla.descricao}
							</option>
						</c:forEach>
						</form:select>
						<form:errors path="sla" cssClass="error" />
					</div>
				</div>

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
						
				<c:if test="${login.tipoUsuario eq 'ADMINISTRADOR'}">
   				<c:if test="${not empty chamado.id}">
				<div class="row top-buffer">
					<div class="col-sm-4">
		                <label for="ativo">Ativo</label>
	                    <form:select path="ativo" class="form-control" name="ativo">
	                        <form:option value="1" label="Sim"/>
	                        <form:option value="0" label="Não"/>
	                    </form:select>
		            </div>
				</div>
				</c:if>	
				</c:if>	
				
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
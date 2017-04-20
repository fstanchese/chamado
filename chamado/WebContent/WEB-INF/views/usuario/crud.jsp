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
<title>Usuário</title>
<style>
    .error {
        color: red; font-weight: bold; font-size: 12px;
    }
</style>
</head>
<body>
	<div class="container">
		<c:import url="..\cabecalho.jsp" />
		<form:form commandName="usuario" class="form-horizontal" action="${path}/usuarios/crudUsuario" method="post">
		<form:input path="id" type="hidden" value="${usuario.id}"/>
		
		<div class="panel panel-group">
     		<div class="panel panel-primary">
   				<div class="panel-heading">
   					<c:if test="${not empty usuario.id}">
	   					<strong>Alterar Usuário</strong>
					</c:if>
   					<c:if test="${empty usuario.id}">
	   					<strong>Novo Usuário</strong>
					</c:if>  					
   				</div>
   			</div>
			<div class="panel-body">
				<div class="row top-buffer">
				<div class="col-sm-12">
					<label for="nome">Nome</label> 
					<form:input path="nome" type="text" class="form-control input-sm"  maxlength="100" autofocus="autofocus"/>
 					<form:errors path="nome" cssClass="error"/>
				</div>
				</div>
				
				<div class="row top-buffer">
				<div class="col-sm-4">
					<label for="cpf">CPF</label> 
					<form:input path="cpf" type="text" class="form-control input-sm"  maxlength="15"/>
 					<form:errors path="cpf" cssClass="error"/>
				</div>
				<div class="col-sm-4">				
					<label for="celular">Celular</label> 
					<form:input path="celular" type="text" class="form-control input-sm"  maxlength="15"/>
 					<form:errors path="celular" cssClass="error"/>
				</div>
	            <div class="col-sm-4">
					<label for="email">E-mail</label> 
					<form:input path="email" type="text" class="form-control input-sm"  maxlength="60"/>
 					<form:errors path="email" cssClass="error"/>
				</div>

	            </div>
	            
	            <div class="row top-buffer">

				<div class="col-sm-4">
	                <label for="tipoUsuario">Tipo Usuário</label>
                    <form:select path="tipoUsuario" class="form-control" name="tipoUsuario">
                        <form:option value="SOLICITANTE" label="Solicitante"/>
                        <form:option value="SOLUCIONADOR" label="Solucionador"/>
                        <form:option value="ADMINISTRADOR" label="Administrador"/>
                    </form:select>
	            </div>	
	            <div id='blocoSLA' style='display: block'>
	            <div class="col-sm-4">
					<label for="sla">SLA do Solicitante</label>
                    <form:select path="sla" class="form-control" name="sla">
					<c:forEach var="sla" items="${slas}">
						<option value="${sla.id}"
							${sla.id==usuario.sla.id ? 'selected' : ''}>${sla.descricao}
						</option>
					</c:forEach>
					</form:select>
					<form:errors path="sla" cssClass="error" />
				</div>
				</div>
	            <div id='blocoFila' style='display: block'>
					<div class="col-sm-4">
						<label for="fila">Fila associada</label>
	                    <form:select path="fila" class="form-control" name="fila">
						<c:forEach var="fila" items="${filas}">
							<option value="${fila.id}"
								${fila.id==usuario.fila.id ? 'selected' : ''}>${fila.descricao}
							</option>
						</c:forEach>
						</form:select>
						<form:errors path="fila" cssClass="error" />
					</div>
				</div>
				</div>
				
	            <div class="row top-buffer">
	            
	            <div class="col-sm-4">
					<label for="login">Login</label> 
					<form:input path="login" type="text" class="form-control"  maxlength="100"/>
 					<form:errors path="login" cssClass="error"/>
				</div>	
				<div class="col-sm-2">
					<label for="senha">Senha</label> 
					<form:input path="senha" type="text" class="form-control"  maxlength="6" />
 					<form:errors path="senha" cssClass="error"/>
				</div>
				<div class="col-sm-2">
					<label for="confirmaSenha">Confirme Senha</label> 
					<form:input path="confirmaSenha" type="text" class="form-control"  maxlength="6" />
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
						<a href="${pageContext.request.contextPath}/usuarios" class="btn btn-default">Cancelar</a>
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
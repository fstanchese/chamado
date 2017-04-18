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
	@IMPORT url("${path}/resources/css/zebra.dialog.css");
	
</style>
<meta charset="UTF-8">
<title>Cadastro de Chamados</title>
</head>
<body>
	<div class="container">
		<c:import url="..\cabecalho.jsp" />
		<div class="panel panel-group">
   		<div class="panel panel-primary">
 			<div>Ola, ${login.nome} você é um ${login.tipoUsuario} ${login.fila.descricao}</div>
   			<div class="panel-heading">
				<a href="${path}/chamados/novo" class="btn btn-info" role="button">Novo Chamado</a>
   			</div>
			<c:if test="${not empty chamados}">
				<table class="table table-hover table-condensed  table-bordered">
				<thead>
					<tr>
						<th align=center>Solicitante</th>
						<th align=center>Fila</th>
						<th align=center>Cadastro</th>
						<th align=center>Limite</th>
						<th align=center>Prazo</th>
						<th align=center>Status</th>
						<th align=center>Assunto</th>
						<th width="12%">&nbsp;&nbsp;Ação</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="chamado" items="${chamados}">
						<tr>
							<td>&nbsp;${chamado.solicitante.nome}</td>
							<td>&nbsp;${chamado.fila.descricao}</td>
							<td><fmt:formatDate value="${chamado.dtCadastro}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
							<td><fmt:formatDate value="${chamado.dtLimite}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
							<td>&nbsp;${chamado.prazo}</td>
							<td>&nbsp;${chamado.status}</td>
							<td>&nbsp;${chamado.assunto}</td>
							<td width="3%">
								<a href="${path}/chamados/edit/${chamado.id}" class="btn btn-warning btn-xs" role="button">Alterar</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</c:if>
		</div>
		</div>
	</div>
	<script src="${path}/resources/js/jquery.min.js" 		type="text/javascript"></script>
	<script src="${path}/resources/js/bootstrap.min.js" 	type="text/javascript"></script>
	<script src="${path}/resources/js/zebra.dialog.js" 		type="text/javascript"></script>
	<script src="${path}/resources/js/zebra.dialog.src.js" 	type="text/javascript"></script>
</body>
</html>
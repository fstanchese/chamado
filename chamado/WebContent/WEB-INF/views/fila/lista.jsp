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
<title>Cadastro de Filas</title>
</head>
<body>
	<div class="container">
		<c:import url="..\cabecalho.jsp" />
		<div class="panel panel-group">
   		<div class="panel panel-primary">
 			<div>Ola, ${login.nome} voc� � um ${login.tipoUsuario} ${login.fila.descricao}</div>
   			<div class="panel-heading">
				<a href="${path}/filas/novo" class="btn btn-info" role="button">Nova Fila</a>
   			</div>
			<c:if test="${not empty filas}">
				<table class="table table-hover table-condensed table-striped table-bordered">
				<thead>
					<tr>
						<th align=center>Descri��o</th>
						<th align=center>Gerente</th>
						<th align=center>Ativo</th>
						<th width="12%">&nbsp;&nbsp;A��o</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="fila" items="${filas}">
						<tr id="row${fila.id}">
							<td>&nbsp;${fila.descricao}</td>
							<td>&nbsp;${fila.gerente.nome}</td>
							<td>&nbsp;${fila.ativo == '1' ? 'Sim' : 'N�o'}</td>
							<td width="3%">
								<a href="${path}/filas/edit/${fila.id}" class="btn btn-warning btn-xs" role="button">Alterar</a>
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
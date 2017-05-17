<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<style type="text/css">
<c:set var="path" value="${pageContext.request.contextPath}" scope="request"/>
@IMPORT url("${path}/resources/css/bootstrap.min.css");
@IMPORT url("${path}/resources/css/bootstrap-theme.min.css");
@IMPORT url("${path}/resources/css/style.css");
@IMPORT url("${path}/resources/css/custom.css");
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
	<script src="${path}/resources/js/jquery.min.js" 		type="text/javascript"></script>
	<script src="${path}/resources/js/bootstrap.min.js" 	type="text/javascript"></script><meta charset="UTF-8">
<title>Cadastro de Chamados</title>
</head>
<body>
	<script type="text/javascript">
	$(document).ready(function() {
		$('#statusId').on('change', function() {
			this.form.submit();
	  	});
	});
	</script>
	<div class="container">
		<c:import url="..\cabecalho.jsp" />
		<div class="panel panel-group">
   		<div class="panel panel-primary">
   			<div class="panel-heading">
				<a href="${path}/chamados/novo" class="btn btn-info" role="button">Novo Chamado</a>
				<br>
				<br>
				<form class="form-horizontal">
                    <select id="statusId" class="form-control" name="statusId">
                        <option value="ABERTO" ${"ABERTO"==statusFiltro ? 'selected' : ''}>Aberto</option>
                        <option value="FECHADO" ${"FECHADO"==statusFiltro ? 'selected' : ''}>Fechado</option>
                        <option value="EMATENDIMENTO" ${"EMATENDIMENTO"==statusFiltro ? 'selected' : ''}>Em atendimento</option>
                        <option value="PENDENTE" ${"PENDENTE"==statusFiltro ? 'selected' : ''}>Pendente</option>
                        <option value="CANCELADO" ${"CANCELADO"==statusFiltro ? 'selected' : ''}>Cancelado</option>
                        <option value="ATRASADO" ${"ATRASADO"==statusFiltro ? 'selected' : ''}>Atrasado</option>
                        <option value="TODOS" ${"TODOS"==statusFiltro ? 'selected' : ''}>Todos</option>
                    </select>
				</form>
   			</div>
			<c:if test="${not empty chamados}">
				<table class="table table-hover table-condensed table-striped table-bordered">
				<thead>
					<tr>
						<th align=center>Solicitante</th>
						<th align=center>Fila</th>
						<th align=center>Inicio Prazo</th>
						<th align=center>Limite Prazo</th>
						<th align=center>Tempo Restante</th>
						<th align=center>Inicio Atend</th>
						<th align=center>Fim Atend</th>
						<th align=center>Status</th>
						<th align=center>Assunto</th>
						<c:if test="${login.tipoUsuario eq 'ADMINISTRADOR'}">
							<th align=center>Ativo</th>
						</c:if>
						<th width="12%">&nbsp;&nbsp;Ação</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="chamado" items="${chamados}">
						<tr>
							<td>&nbsp;${chamado.solicitante.nome}</td>
							<td>&nbsp;${chamado.fila.descricao}</td>
							<c:if test="${empty chamado.dtAlteracao}">
								<td nowrap><fmt:formatDate value="${chamado.dtCadastro}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
							</c:if>
							<c:if test="${not empty chamado.dtAlteracao}">
								<td nowrap><fmt:formatDate value="${chamado.dtAlteracao}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
							</c:if>							
							<td nowrap><fmt:formatDate value="${chamado.dtLimite}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
							<td nowrap>&nbsp;${chamado.prazo}</td>
							<td nowrap><fmt:formatDate value="${chamado.dtInicioAtendimento}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
							<td nowrap><fmt:formatDate value="${chamado.dtFimAtendimento}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
							<td>&nbsp;${chamado.status}</td>
							<td nowrap>&nbsp;${chamado.assunto}</td>
							<c:if test="${login.tipoUsuario eq 'ADMINISTRADOR'}">
								<td>&nbsp;${chamado.ativo == '1' ? 'Sim' : 'Não'}</td>
							</c:if>
							<td width="3%">
								<c:if test="${chamado.status eq 'ABERTO' && chamado.solicitante.id eq login.id}">
									<a href="${path}/chamados/edit/${chamado.id}" class="btn btn-warning btn-xs" role="button">Alterar</a>
								</c:if>
								<c:if test="${login.tipoUsuario eq 'SOLUCIONADOR' && chamado.status ne 'FECHADO'}">
									<a href="${path}/chamados/atender/${chamado.id}" class="btn btn-info btn-xs" role="button">Atender</a>
								</c:if>							
							</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</c:if>
		</div>
		</div>
	</div>
	<script src="${path}/resources/js/zebra.dialog.js" 		type="text/javascript"></script>
	<script src="${path}/resources/js/zebra.dialog.src.js" 	type="text/javascript"></script>
</body>
</html>
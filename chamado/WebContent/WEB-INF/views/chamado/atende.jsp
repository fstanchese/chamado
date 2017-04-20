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
			<div class="panel-body">

				<div class="row top-buffer">
				<div class="col-sm-12">
					<label for="nome">Solicitante</label> 
					<input type="text" name="nome" type="text" class="form-control input-sm" value="${chamado.solicitante.nome}" disabled/>
				</div>
				</div>
							
				<div class="row top-buffer">
				<div class="col-sm-4">
					<label for="fila">Fila</label>
                    <select id="fila" class="form-control" name="fila" disabled>
						<option value="${chamado.fila.id}" selected>${chamado.fila.descricao}</option>
					</select>
				</div>
				
				<div class="col-sm-4">
					<label for="fila">Status</label>
                    <select id="fila" class="form-control" name="fila" disabled>
						<option value="${chamado.status}" selected>${chamado.status}</option>
					</select>
				</div>

				<div class="col-sm-4">
					<label for="prazo">Tempo Restante</label> 
					<input type="text" name="prazo" type="text" class="form-control input-sm" value="${chamado.prazo}" disabled/>
				</div>
				</div>
					
				<div class="row top-buffer">
				<div class="col-sm-12">
					<label for="assunto">Assunto</label> 
					<input type="textarea" id="assunto" name="assunto"  class="form-control" rows="1" value="${chamado.assunto}" disabled/>
				</div>
				</div>
								
				<div class="row top-buffer">
				<div class="col-sm-12">
					<label for="descricao">Descrição</label> 
					<input type="textarea" id="descricao" name="descricao"  class="form-control"  rows="10" value="${chamado.descricao}" disabled/>
				</div>
				</div>

				<div class="row top-buffer">
				<div class="col-sm-12">
					<label for="solucao">Resposta</label> 
					<form:textarea id="solucao" path="solucao"  class="form-control"  rows="10"/>
					<form:errors path="solucao" cssClass="error"/>
				</div>
				</div>

				<div class="row top-buffer">
					<div class="col-sm-4">
		                <label for="finaliza">Finaliza ?</label>
	                    <form:select path="finaliza" class="form-control">
	                        <form:option value="Nao" label="Não"/>
	                        <form:option value="Sim" label="Sim"/>
	                    </form:select>
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
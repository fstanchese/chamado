<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
			<ul class="nav navbar-nav navbar-left">
				<li>
					<form action="${pageContext.request.contextPath}/logout" method="post">
						<button id="btn-sair" type="submit" class="btn btn-default">Sair</button>
					</form>
				</li>
			</ul>			
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${login.tipoUsuario eq 'ADMINISTRADOR'}">
					<li><a href="${pageContext.request.contextPath}/filas">Filas</a></li>
					<li><a href="${pageContext.request.contextPath}/usuarios">Usuários</a></li>
				</c:if>
				<li><a href="${pageContext.request.contextPath}/chamados">Chamados</a></li>
			</ul>
		</nav>
	</div>
</nav>
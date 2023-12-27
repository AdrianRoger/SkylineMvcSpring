<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<link rel="stylesheet" href="./assets/css/style.css">

<title>Contato</title>
</head>
<body>
	<div class="gotop toinvisivel bi bi-arrow-up btn-fundo"
		onclick="scrollToTop()"></div>
	<header>
		<!-- Começo do menu de navegação -->
		<nav class="navbar navbar-expand-md bg-fundo navbar-dark pe-2">
			<div class="container-fluid d-flex justify-content-between">
				<a href="index.html"
					class="navbar-brand d-flex align-items-center logo"> <img
					class="logotipo-2" src="./assets/img/logo_white.png" alt="Logotipo">
					Skyline
				</a>
				<button class="navbar-toggler mx-sm-3" type="button"
					data-bs-toggle="collapse" data-bs-target="#hamburguer">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="container-fluid">
					<div class="collapse navbar-collapse" id="hamburguer">
						<div class="navbar-nav ms-auto">
							<a href="index.html" class="nav-link">Home</a> <a
								href="destino.html" class="nav-link">Destino</a> <a
								href="promocoes.html" class="nav-link">Promoções</a> <a
								href="contato.html" class="nav-link active">Contato</a>
							<hr class="group-divider">
							<div class="dropdown ms-2">
								<button class="btn btn-outline-light btn-fundo dropdown-toggle"
									type="button" data-bs-toggle="dropdown" aria-expanded="false">
									Admin Pages</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="clientes">Clientes</a></li>
									<li><a class="dropdown-item" href="contato">Contato</a></li>
									<li><a class="dropdown-item" href="cidades">Cidades</a></li>
									<li><a class="dropdown-item" href="voo">Vôo</a></li>
									<li><a class="dropdown-item" href="reservas">Reservas</a></li>
								</ul>
							</div>
						</div>
						<!-- div-navbar -->
					</div>
				</div>
			</div>

		</nav>
		<!-- O menu de navegação acaba aqui -->
	</header>
	<main>
		<section id="fundos"
			class="d-flex justify-content-center align-items-center text-center">
			<div class="fundo-azul-opaco revelar">
				<h1 class="titulo-3">Com dificuldades?</h1>
				<p>Deixe-nos uma mensagem, um de nossos consultores entrará em
					contato em breve.</p>
			</div>
		</section>
		<section>
			<div class="container max-formulario py-5">
				<div class="row">
					<div class="col">
						<h1 class="text-center titulo-3">Fale Conosco</h1>
						<hr class="group-divider">
						<div class="table-responsive">
							<table class="table table-striped">

								<tr>
									<th>#</th>
									<th>Nome</th>
									<th>Email</th>
									<th>Telefone</th>
									<th>Mensagem</th>
									<th>Resolvido</th>
									<th>Ações</th>
								</tr>
								<jstl:forEach items="${contatos}" var="c">
									<tr>
										<td>${c.id_contato}</td>
										<td>${c.nome}</td>
										<td>${c.email}</td>
										<td>${c.telefone}</td>
										<td>${c.mensagem}</td>
										<td>${c.resolvido ? 'Sim' : 'Não'}</td>
										<td>
											<div class="btn-group">
												<a href="#" class="btn btn-sm btn-outline-secondary"
													data-bs-toggle="modal"
													data-bs-target="#update${c.id_contato}"><i class="bi bi-pencil-square"></i></a> 
												<a
													href="#" data-bs-toggle="modal"
													data-bs-target="#delete${c.id_contato}"
													class="btn btn-sm btn-outline-danger"><i class="bi bi-trash3-fill"></i></a>
											</div>
										</td>
									</tr>
									
									<div class="modal" id="delete${c.id_contato}" tabindex="-1">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Excluir Mensagem</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<p>Deseja realmente excluir?</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-sm btn-secondary"
														data-bs-dismiss="modal">Close</button>
													<a href="contato-delete?id=${c.id_contato}"
														class="btn btn-sm btn-danger">Excluir</a>
												</div>
											</div>
										</div>
									</div>
									
									<div class="modal" id="update${c.id_contato}" tabindex="-1">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Contato</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<p>Nome : ${c.nome}</p>
													<p>Email : ${c.email}</p>
													<p>Telefone : ${c.telefone}</p>
													<p>Mensagem : ${c.mensagem}</p>
													<p>Resolvido: ${c.resolvido ? 'Sim' : 'Não'}</p>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Cancelar</button>
													<a href="./contato-update?id=${c.id_contato}"
														class="btn btn-primary">Marcar como Concluído</a>
												</div>
											</div>
										</div>
									</div>
								</jstl:forEach>

							</table>
						</div>
					</div>
				</div>
			</div>
		</section>


	</main>
	<footer>
		<div class="container-fluid bg-fundo rodape mt-5">
			<div class="container">
				<div class="row row-cols-1 row-cols-md-3 g-3">
					<!-- Grupo Fale Conosco -->
					<div class="col">
						<div class="gp-col-foot">
							<h3 class="foot-title gp-revelar">Fale Conosco</h3>
							<hr class="group-divider">
							<div class="gp-footer gp-revelar">
								<i class="bi bi-telephone-fill fs-4"></i>
								<p class="marc">+55 (61) 9 9999-999</p>
							</div>
							<div class="gp-footer gp-revelar">
								<i class="bi bi-envelope-fill fs-4"></i>
								<p class="marc">skyline@skyline.com</p>
							</div>
							<div class="gp-footer gp-revelar">
								<i class="bi bi-geo-alt-fill fs-4"></i>
								<p class="marc">72.145-831 Brasília-DF</p>
							</div>
						</div>
					</div>
					<!-- Grupo Redes Sociais -->
					<div class="col">
						<div class="gp-col-foot">
							<h3 class="foot-title gp-revelar">Redes Sociais</h3>
							<hr class="group-divider">
							<div class="gp-footer gp-revelar">
								<i class="bi bi-instagram fs-4"></i>
								<p class="marc">instagram.com/skyline</p>
							</div>
							<div class="gp-footer gp-revelar">
								<i class="bi bi-facebook fs-4"></i>
								<p class="marc">facebook.com/skyline</p>
							</div>
							<div class="gp-footer gp-revelar">
								<i class="bi bi-youtube fs-4"></i>
								<p class="marc">youtube.com/skyline</p>
							</div>
						</div>
					</div>
					<!-- Grupo Seções nessa página -->
					<div class="col">
						<div class="gp-col-foot">
							<h3 class="foot-title gp-revelar">Powered By</h3>
							<hr class="group-divider">
							<div class="gp-footer gp-revelar">
								<i class="bi bi-filetype-html fs-4"></i>
								<p class="marc">HTML/CSS</p>
							</div>
							<div class="gp-footer gp-revelar">
								<i class="bi bi-bootstrap-fill fs-4"></i>
								<p class="marc">BootStrap 5.3.1</p>
							</div>
							<div class="gp-footer gp-revelar">
								<i class="bi bi-filetype-js fs-4"></i>
								<p class="marc">ScrollReveal</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		<div class="marca-pessoal">
			<!-- <p>Página Desenvolvida por <strong>Adrian Roger</strong>.  -->
			<a class="git-link fs-3" href="https://github.com/AdrianRoger"
				target="_blank"><i class="bi bi-github me-2"></i>github.com/AdrianRoger</a>
		</div>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/scrollreveal"></script>
	<script src="./assets/js/script.js"></script>

</body>
</html>

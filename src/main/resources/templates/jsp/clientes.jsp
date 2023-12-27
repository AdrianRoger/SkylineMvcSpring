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

<title>Clientes</title>
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
								href="contato.html" class="nav-link">Contato</a>
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
				<h1 class="titulo-3">Clientes</h1>
				<p>Página de cadastro de clientes.</p>
			</div>
		</section>
		<section>
			<div class="container-fluid py-5">
				<div class="row">
					<div class="col">
						<h1 class="text-center titulo-3">Clientes</h1>
						<hr class="group-divider">
						<div class="table-responsive">
							<table class="table table-striped text-center">

								<tr>
									<th>CPF</th>
									<th>Nome</th>
									<th>Email</th>
									<th>Telefone</th>
									<th>Cep</th>
									<th>Rua</th>
									<th>Número</th>
									<th>Complemento</th>
									<th>Ativo</th>
									<th>Ações</th>
								</tr>
								<jstl:forEach items="${clientes}" var="cli">
									<tr>
										<td class="text-nowrap">
											<a class="link-underline link-underline-opacity-0" href="#" 
											data-bs-toggle="modal" data-bs-target="#updateCpf${cli.cpf}" title="Editar cpf">
											<i class="bi bi-pencil-fill me-2 "></i>${cli.cpf}</a>
										</td>
										<td>${cli.nome}</td>
										<td>${cli.email}</td>
										<td>${cli.telefone}</td>
										<td>${cli.cep}</td>
										<td>${cli.rua}</td>
										<td>${cli.numero}</td>
										<td>${cli.complemento}</td>
										<td>${cli.ativo ? 'Sim' : 'Não' }</td>
										<td>
											<div class="btn-group">
												<a href="#" class="btn btn-sm btn-outline-secondary"
													data-bs-toggle="modal" data-bs-target="#update${cli.cpf}"><i class="bi bi-pencil-square"></i></a>
												<a href="#" class="btn btn-sm btn-outline-danger"
													data-bs-toggle="modal" data-bs-target="#detalhe${cli.cpf}"><i class="bi bi-trash3-fill"></i></a>
											</div>
										</td>
									</tr>
									<!-- Modal Update CPF -->
									<div class="modal" id="updateCpf${cli.cpf}" tabindex="-1">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Alterar CPF: ${cli.nome}</h5>

													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<form action="/SkylineMvcServlet/clientes-updateCpf">

														<div class="mb-3">
															<label for="cpf" class="col-form-label">CPF Atual:</label> 
															<input type="text" class="form-control cpf"
																id="cpf" name="oldcpf" value="${cli.cpf}" readonly>
														</div>
														<div class="mb-3">
															<label for="cpf" class="col-form-label">Novo CPF:</label> 
															<input type="text" class="form-control cpf"
																id="cpf" name="newcpf" required>
														</div>
														
														<div class="modal-footer">
															<button type="button" class="btn btn-sm btn-secondary"
																data-bs-dismiss="modal">Cancelar</button>
															<button type="submit" class="btn btn-sm btn-primary">Atualizar</button>
														</div>
													
													</form>
												</div>
											</div>
										</div>
									</div>
			
									<!-- MODAL DETALHES para delete -->
									<div class="modal" id="detalhe${cli.cpf}" tabindex="-1">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Detalhes do cliente.</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<p>
														<strong>Nome: </strong> ${cli.nome}
													</p>
													<p>
														<strong>CPF: </strong> ${cli.cpf}
													</p>
													<p>
														<strong>Email: </strong> ${cli.email}
													</p>
													<p>
														<strong>Telefone: </strong> ${cli.telefone}
													</p>
													<p>
														<strong>Cep: </strong> ${cli.cep}
													</p>
													<p>
														<strong>Rua: </strong> ${cli.rua}
													</p>
													<p>
														<strong>Número: </strong> ${cli.numero}
													</p>
													<p>
														<strong>Complemento: </strong> ${cli.complemento}
													</p>
													<p>
														<strong>Ativo: </strong> ${cli.ativo ? 'Sim' : 'Não'}
													</p>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-sm btn-secondary"
														data-bs-dismiss="modal">Cancelar</button>
													<a href="clientes-delete?cpf=${cli.cpf}"
														class="btn btn-sm btn-danger">Excluir</a>
												</div>
											</div>
										</div>
									</div>
									<!-- MODAL CLIENTES-UPDATE -->
									<div class="modal" id="update${cli.cpf}" tabindex="-1">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Atualizar Cliente</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<form action="/SkylineMvcServlet/clientes-update">

														<div class="mb-3">
															<label for="cpf" class="col-form-label">CPF do Cliente:</label> 
															<input type="text" class="form-control cpf"
																id="cpf" name="cpf" value="${cli.cpf}" readonly>
														</div>
														
														<div class="mb-3">
															<label for="nome" class="col-form-label">Nome:</label> 
															<input type="text" class="form-control nome"
																id="nome" name="nome" value="${cli.nome}" required>
														</div>
														
														<div class="mb-3">
															<label for="email" class="col-form-label">Email:</label>
															<input type="email" class="form-control email" id="email"
																name="email" value="${cli.email}" required>
														</div>
														
														<div class="mb-3">
															<label for="telefone" class="col-form-label">Telefone:</label> 
															<input type="tel" class="form-control telefone" id="telefone" 
															value="${cli.telefone}" placeholder="(99)99999-9999" name="telefone">
														</div>
														
														<div class="mb-3">
															<label for="cep" class="col-form-label">CEP: </label> 
															<input type="text" class="form-control cep"
																id="cep" name="cep" placeholder="99999-999" value="${cli.cep}" required>
														</div>
														
														<div class="mb-3">
															<label for="rua" class="col-form-label">Rua:</label> 
															<input type="text" class="form-control rua"
																id="rua" name="rua" value="${cli.rua}" required>
														</div>
														
														<div class="mb-3">
															<label for="numero" class="col-form-label">Número:</label> 
															<input type="text" class="form-control"
																id="numero" name="numero" value="${cli.numero}" required>
														</div>
														
														<div class="mb-3">
															<label for="complemento" class="col-form-label">Complemento:</label> 
															<input type="text" class="form-control"
																id="complemento" name="complemento" value="${cli.complemento}">
														</div>
														
														<div class="mb-3">
															<label for="ativo" class="col-form-label">Ativo:</label> 
															<input type="text" class="form-control"
																id="ativo" name="ativo" value="${cli.ativo ? 'Sim' : 'Não'}" readonly>
														</div>

														<div class="modal-footer">
															<button type="button" class="btn btn-sm btn-secondary"
																data-bs-dismiss="modal">Cancelar</button>
															<button type="submit" class="btn btn-sm btn-primary">Atualizar</button>
														</div>

													</form>
												</div>
											</div>
										</div>
									</div>
								</jstl:forEach>

							</table>
							
							<!--  MODAL CREATE -->
							<a href="#" class="btn btn-outline-light btn-fundo"
								data-bs-toggle="modal" data-bs-target="#createClientes">Cadastrar
								Cliente</a>
							<div class="modal" id="createClientes" tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Cadastrar Cliente</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form action="/SkylineMvcServlet/clientes-create">
											
												<div class="mb-3">
													<label for="cpf" class="col-form-label">CPF:</label> 
													<input type="text" class="form-control cpf"
														id="cpf" name="cpf" placeholder="000.000.000-00" required>
												</div>
												
												<div class="mb-3">
													<label for="nome" class="col-form-label">Nome:</label> 
														<input type="text" class="form-control nome"
														id="nome" name="nome" required>
												</div>
												
												<div class="mb-3">
													<label for="email" class="col-form-label">Email:</label>
													<input type="email" class="form-control" id="email"
														name="email" required>
												</div>
												
												<div class="mb-3">
													<label for="telefone" class="col-form-label">Telefone:</label> 
													<input type="text" class="form-control telefone" id="telefone" 
														placeholder="(00)00000-0000" name="telefone">
												</div>
												
												<div class="mb-3">
													<label for="cep" class="col-form-label">Cep:</label> 
													<input type="text" class="form-control cep" id="cep"
														name="cep" placeholder="00000-000" required>
												</div>

												<div class="mb-3">
													<label for="rua" class="col-form-label">Rua:</label> 
													<input type="text" class="form-control" id="rua"
														name="rua" required>
												</div>
												
												<div class="mb-3">
													<label for="numero" class="col-form-label">Número:</label> 
													<input type="text" class="form-control numero" id="numero"
														name="numero" required>
												</div>
												
												<div class="mb-3">
													<label for="complemento" class="col-form-label">Complemento:</label> 
													<input type="text" class="form-control" id="complmento"
														name="complemento">
												</div>
												
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Cancelar</button>
													<button type="submit" class="btn btn-primary">Cadastrar</button>
												</div>

											</form>
										</div>
									</div>
								</div>
							</div>

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
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.js"></script>
	<script src="./assets/js/script.js"></script>
	<script>		
		$('.cpf').mask('000.000.000-00');
	  $(document).ready(function() {
		    $('.nome').on('input', function() {
		      let formatado = $(this).val().replace(/[^A-Za-zÀ-ÿ\s]/g, '');
		      $(this).val(formatado);
		    });
		  });
		$('.telefone').mask('(00)00000-0000');
		$('.cep').mask('00000-000');
// 		$('.numero').mask('###000');
		$(document).ready(function() {
		    $('.numero').on('input', function() {
		      let formatado = $(this).val().replace(/[^0-9]/g, ''); // Permite apenas números de 0 a 9
		      $(this).val(formatado);
		    });
		  });
	</script>
</body>
</html>

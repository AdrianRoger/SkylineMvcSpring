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

<title>Reservas</title>
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
				<h1 class="titulo-3">Reservas</h1>
				<p>Página de Cadastro de Reservas.</p>
			</div>
		</section>
		<section>
			<div class="container max-formulario py-5">
				<div class="row">
					<div class="col">
						<h1 class="text-center titulo-3">Reservas</h1>
						<hr class="group-divider">
						<div class="table-responsive">
							<table class="table table-striped">

								<tr>
									<th>Data reserva</th>
									<th>Qtd pessoas</th>
									<th>Cliente</th>
									<th>Preço total</th>
									<th>Origem</th>
									<th>Destino</th>
									<th>Cancelada</th>
									<th>Ações</th>
								</tr>
								<jstl:forEach items="${reservas}" var="res">
									<input type="hidden" id="id" name="id" value="${v.id_voo}">
									<tr>
										<td>${res.data_reserva}</td>
										<td>${res.num_pessoas}</td>
										<td>${res.cliente.cpf} ${res.cliente.nome}</td>
										<td>R$ ${res.voo.preco_unit * res.num_pessoas}</td>
										<td>${res.voo.origem.cidade}-${res.voo.origem.estado}</td>
										<td>${res.voo.destino.cidade}-${res.voo.destino.estado}</td>
										<td>
											<a href="#" data-bs-toggle="modal" data-bs-target="#cancel${res.id_reserva}">
												${res.cancelada ? 'Sim' : 'Não'} <i class="bi bi-pencil-fill"></i>
											</a>
										</td>
										<td>
											<div class="btn-group">
												<a href="#" class="btn btn-sm btn-outline-secondary"
													data-bs-toggle="modal" data-bs-target="#update${res.id_reserva}"><i class="bi bi-pencil-square"></i></a>
												<a href="#" class="btn btn-sm btn-outline-danger"
													data-bs-toggle="modal" data-bs-target="#detalhe${res.id_reserva}"><i class="bi bi-trash3-fill"></i></a>
											</div>
										</td>
									</tr>
									
									<div class="modal" id="cancel${res.id_reserva}" tabindex="-1">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Detalhes da Reserva</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<p>
														<strong>Data da reserva: </strong> ${res.data_reserva}
													</p>
													<p>
														<strong>Quantidade de pessoas: </strong> ${res.num_pessoas}
													</p>
													<p>
														<strong>Cliente: </strong> ${res.cliente.cpf} ${res.cliente.nome}
													</p>
													<p>
														<strong>Preço total:</strong> R$ ${res.voo.preco_unit * res.num_pessoas}
													</p>
													<p>
														<strong>Origem:</strong> ${res.voo.origem.cidade}-${res.voo.origem.estado}
													</p>
													<p>
														<strong>Destino:</strong> ${res.voo.destino.cidade}-${res.voo.destino.estado}
													</p>
													<p>
														<strong>Cancelada:</strong> ${res.cancelada ? 'Sim' : 'Não'}
													</p>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-sm btn-secondary"
														data-bs-dismiss="modal">Voltar</button>
													<a href="reservas-cancel?id=${res.id_reserva}"
														class="${res.cancelada ? 'btn btn-sm btn-disabled disabled' : 'btn btn-sm btn-danger' }">
														Cancelar Reserva
													</a>
												</div>
											</div>
										</div>
									</div>
									
									<div class="modal" id="detalhe${res.id_reserva}" tabindex="-1">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Detalhes da Reserva</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<p>
														<strong>Data da reserva: </strong> ${res.data_reserva}
													</p>
													<p>
														<strong>Quantidade de pessoas: </strong> ${res.num_pessoas}
													</p>
													<p>
														<strong>Cliente: </strong> ${res.cliente.cpf} ${res.cliente.nome}
													</p>
													<p>
														<strong>Preço total:</strong> R$ ${res.voo.preco_unit * res.num_pessoas}
													</p>
													<p>
														<strong>Origem:</strong> ${res.voo.origem.cidade}-${res.voo.origem.estado}
													</p>
													<p>
														<strong>Destino:</strong> ${res.voo.destino.cidade}-${res.voo.destino.estado}
													</p>
													<p>
														<strong>Cancelada:</strong> ${res.cancelada ? 'Sim' : 'Não'}
													</p>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-sm btn-secondary"
														data-bs-dismiss="modal">Cancelar</button>
													<a href="reservas-delete?id=${res.id_reserva}"
														class="btn btn-sm btn-danger">Excluir</a>
												</div>
											</div>
										</div>
									</div>
									<!-- Meu Trabalho Continua daqui -->
									<div class="modal" id="update${res.id_reserva}" tabindex="-1 ">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Atualizar Reserva</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<form action="/SkylineMvcServlet/reservas-update">
														<input type="hidden" value="${res.id_reserva}" name="id">

														<div class="mb-3">
															<label for="num_pessoas" class="col-form-label">Quantidade
																de pessoas:</label> <input type="text" class="form-control num_pessoas"
																id="num_pessoas" name="num_pessoas" value="${res.num_pessoas}" required>
														</div>
														
														<div class="mb-3">
															<label for="cancelada" class="col-form-label">Cancelada:</label> 
															<input type="text" class="form-control" id="cancelada1" 
																name="cancelada" value="${res.cancelada ? 'Sim' : 'Não'}" readonly>
														</div>

														<div class="mb-3">
															<label for="voo" class="col-form-label">Vôo:</label> <select
																class="form-control" id="voo" name="voo" required>
																<option value="" disabled selected>
																	${res.voo.origem.cidade}-${res.voo.origem.estado} para 
																	${res.voo.destino.cidade}-${res.voo.destino.estado}
																	${res.voo.data_partida} preço unitário R$ ${res.voo.preco_unit}
																</option>
																<jstl:forEach items="${voos}" var="v">
																	<option value="${v.id_voo}">
																		${v.origem.cidade}-${v.origem.estado} para
																		${v.destino.cidade}-${v.destino.estado}
																		${v.data_partida} preço unitário R$ ${v.preco_unit}</option>
																</jstl:forEach>
															</select>
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
							<a href="#" class="btn btn-outline-light btn-fundo"
								data-bs-toggle="modal" data-bs-target="#createReserva">Cadastrar
								Reserva</a>
							<div class="modal" id="createReserva" tabindex="-3">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Cadastrar Reserva</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form action="/SkylineMvcServlet/reservas-create">
												<div class="mb-3">
													<label for="num_pessoas1" class="col-form-label">Quantidade
														de pessoas:</label> <input type="text" class="form-control num_pessoas"
														id="num_pessoas1" name="num_pessoas" required>
												</div>
												
												<div class="mb-3">
													<label for="assentos1" class="col-form-label">Cliente:</label>
													<select class="form-control" id="clientes1" name="cliente"
														required>
														<option value="" disabled selected>Selecione um
															cliente:</option>
														<jstl:forEach items="${clientes}" var="cli">
															<option value="${cli.cpf}">${cli.cpf}-${cli.nome}</option>
														</jstl:forEach>
													</select>
												</div>
												
												<div class="mb-3">
													<label for="voo1" class="col-form-label">Vôo:</label>
													<select class="form-control" id="voo1" name="voo"
														required>
														<option value="" disabled selected>Selecione um
															Vôo</option>
														<jstl:forEach items="${voos}" var="v">
															<option value="${v.id_voo}">
																${v.origem.cidade}-${v.origem.estado} para ${v.destino.cidade}-${v.destino.estado}
																${v.data_partida} preço unitário R$ ${v.preco_unit}
															</option>
														</jstl:forEach>
													</select>
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
//		$('.data').mask('00/00/0000');
		$('.num_pessoas').mask('000');
//		$('.preco_unit').mask("#.##0,00", {reverse : true});
	</script>
</body>
</html>

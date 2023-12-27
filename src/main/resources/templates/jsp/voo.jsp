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

<title>Voo</title>
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
				<h1 class="titulo-3">Vôo</h1>
				<p>Página de Cadastro de vôos.</p>
			</div>
		</section>
		<section>
			<div class="container max-formulario py-5">
				<div class="row">
					<div class="col">
						<h1 class="text-center titulo-3">Vôo</h1>
						<hr class="group-divider">
						<div class="table-responsive">
							<table class="table table-striped">

								<tr>
									<th>Número do Vôo</th>
									<th>Compania</th>
									<th>Assentos</th>
									<th>Preço Unitário</th>
									<th>Data de Partida</th>
									<th>Origem</th>
									<th>Destino</th>
									<th>Ações</th>
								</tr>
								<jstl:forEach items="${voos}" var="v">
									<input type="hidden" id="id" name="id" value="${v.id_voo}">
									<tr>
										<td>${v.num_voo}</td>
										<td>${v.comp_aerea}</td>
										<td>${v.assentos}</td>
										<td>R$ ${v.preco_unit}</td>
										<td>${v.data_partida}</td>
										<td>${v.origem.getCidade()}-${v.origem.getEstado()}</td>
										<td>${v.destino.getCidade()}-${v.destino.getEstado()}</td>
										<td>
											<div class="btn-group">
												<a href="#" class="btn btn-sm btn-outline-secondary"
													data-bs-toggle="modal" data-bs-target="#update${v.id_voo}"><i class="bi bi-pencil-square"></i></a>
												<a href="#" class="btn btn-sm btn-outline-danger"
													data-bs-toggle="modal" data-bs-target="#detalhe${v.id_voo}"><i class="bi bi-trash3-fill"></i></a>
											</div>
										</td>
									</tr>
									<div class="modal" id="detalhe${v.id_voo}" tabindex="-1">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Detalhes Vôo</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<p>
														<strong>Número do vôo:</strong> ${v.num_voo}
													</p>
													<p>
														<strong>Compania Aérea:</strong> ${v.comp_aerea}
													</p>
													<p>
														<strong>Assentos:</strong> ${v.assentos}
													</p>
													<p>
														<strong>Preço Unitário:</strong> R$ ${v.preco_unit}
													</p>
													<p>
														<strong>Data Partida:</strong> ${v.data_partida}
													</p>
													<p>
														<strong>Origem:</strong> ${v.origem.cidade} -
														${v.origem.estado}
													</p>
													<p>
														<strong>Destino:</strong> ${v.destino.cidade} -
														${v.destino.estado}
													</p>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-sm btn-secondary"
														data-bs-dismiss="modal">Cancelar</button>
													<a href="voo-delete?id=${v.id_voo}"
														class="btn btn-sm btn-danger">Excluir</a>
												</div>
											</div>
										</div>
									</div>
									<div class="modal" id="update${v.id_voo}" tabindex="-2">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Atualizar Vôo</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<form action="/SkylineMvcServlet/voo-update">
														<input type="hidden" value="${v.id_voo}" name="id">

														<div class="mb-3">
															<label for="num_voo" class="col-form-label">Número
																do Vôo:</label> <input type="text" class="form-control num_voo"
																id="num_voo" name="num_voo" value="${v.num_voo}" required>
														</div>
														<div class="mb-3">
															<label for="comp_aerea" class="col-form-label">Compania
																Aérea:</label> <input type="text" class="form-control"
																id="comp_aerea" name="comp_aerea" value="${v.comp_aerea}" required>
														</div>
														<div class="mb-3">
															<label for="assentos" class="col-form-label">Assentos:</label>
															<input type="text" class="form-control assentos" id="assentos"
																name="assentos" value="${v.assentos}" required>
														</div>
														<div class="mb-3">
															<label for="preco_unit" class="col-form-label">Preço
																Unitário: (Valor atual:R$ ${v.preco_unit}) </label> <input type="text" class="form-control preco_unit"
																id="preco_unit" placeholder="R$ 0,00" name="preco_unit" required>
														</div>
														<div class="mb-3">
															<label for="data" class="col-form-label">Data
																Partida:</label> <input type="text" class="form-control data"
																id="data" name="data" placeholder="DD/MM/AAAA" required>
														</div>

														<div class="mb-3">
															<label for="origem" class="col-form-label">Origem:</label>
															<select class="form-control" id="origem" name="origem"
																required>
																<option value="" disabled selected>${v.origem.cidade}</option>
																<jstl:forEach items="${cidades}" var="ori">
																	<option value="${ori.id_cidade}">${ori.cidade}-${ori.estado}</option>
																</jstl:forEach>
															</select>
														</div>
														<div class="mb-3">
															<label for="destino" class="col-form-label">Destino:</label>
															<select class="form-control" id="destino" name="destino"
																required>
																<option value="" disabled selected>${v.destino.cidade}</option>
																<jstl:forEach items="${cidades}" var="dest">
																	<option value="${dest.id_cidade}">${dest.cidade}-${dest.estado}</option>
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
								data-bs-toggle="modal" data-bs-target="#createVoo">Cadastrar
								Voo</a>
							<div class="modal" id="createVoo" tabindex="-3">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Cadastrar Vôo</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form action="/SkylineMvcServlet/voo-create">
												<div class="mb-3">
													<label for="num_voo1" class="col-form-label">Número
														do Vôo:</label> <input type="text" class="form-control num_voo"
														id="num_voo1" name="num_voo" required>
												</div>
												<div class="mb-3">
													<label for="comp_aerea1" class="col-form-label">Compania
														Aérea:</label> <input type="text" class="form-control"
														id="comp_aerea1" name="comp_aerea" required>
												</div>
												<div class="mb-3">
													<label for="assentos1" class="col-form-label">Assentos:</label>
													<input type="text" class="form-control assentos" id="assentos1"
														name="assentos" required>
												</div>
												<div class="mb-3">
													<label for="preco_unit1" class="col-form-label">Preço
														Unitário:</label> <input type="text" class="form-control preco_unit"
														id="preco_unit1" placeholder="R$ 0,00" name="preco_unit" required>
												</div>
												<div class="mb-3">
													<label for="data1" class="col-form-label">Data
														Partida:</label> <input type="text" class="form-control data" id="data1"
														name="data" placeholder="DD/MM/AAAA" required>
												</div>

												<div class="mb-3">
													<label for="origem1" class="col-form-label">Origem:</label>
													<select class="form-control" id="origem1" name="origem"
														required>
														<option value="" disabled selected>Selecione uma
															origem</option>
														<jstl:forEach items="${cidades}" var="ori">
															<option value="${ori.id_cidade}">${ori.cidade}-${ori.estado}</option>
														</jstl:forEach>
													</select>
												</div>
												<div class="mb-3">
													<label for="destino1" class="col-form-label">Destino:</label>
													<select class="form-control" id="destino1" name="destino"
														required>
														<option value="" disabled selected>Selecione um
															destino</option>
														<jstl:forEach items="${cidades}" var="dest">
															<option value="${dest.id_cidade}">${dest.cidade}-${dest.estado}</option>
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
		$('.data').mask('00/00/0000');
		$('.num_voo').mask('0000000000');
		$('.assentos').mask('000');
		$('.preco_unit').mask("#.##0,00", {reverse : true});
	</script>
</body>
</html>

/*Usuario*/

insert into usuario(cpf, nome, email, telefone, cep, rua, numero, complemento, ativo)
	values("000.000.000-01", "Adrian Roger", "adrian.santos@aluno.recode.org.br", 
	"(61)995034528", "72145-000", "Qnm 38", 46, null, true);

insert into usuario(cpf, nome, email, telefone, cep, rua, numero, complemento, ativo)
	values("000.000.000-02", "Lucas", "lucas@gmail.com", 
	"(61)999999999", "00000-000", "Sem nome", 01, null, true);
	
insert into usuario(cpf, nome, email, telefone, cep, rua, numero, complemento, ativo)
	values("000.000.000-03", "Marco Aurélio", "marco.aurelio@gmail.com", 
	"(61)987654321", "72000-000", "Qnm 40 conj C", 35, null, true);

/*Cidade*/

insert into cidade(id, cidade, estado, pais, aeroporto) 
	values(null, "Brasília", "DF", "BR", "Aeroporto Internacional Juscelino Kubitschek");
	
insert into cidade(id, cidade, estado, pais, aeroporto)
	values(null, "Goiania", "GO", "BR", "Aeroporto Internacional Santa Genoveva");
	
insert into cidade(id, cidade, estado, pais, aeroporto)
	values(null, "Guarulhos", "SP", "BR", "Aeroporto Internacional de Guarulhos");
	
insert into cidade(id, cidade, estado, pais, aeroporto)
	values(null, "São Paulo", "SP", "BR", "Aeroporto Deputado Freitas Nobre");
	
insert into cidade(id, cidade, estado, pais, aeroporto)
	values(null, "Rio de Janeiro", "RJ", "BR", "Aeroporto Santos Drumond");

/*Voo*/

insert into voo(id, num_voo, comp_aerea, assentos, preco_unit, data_partida, origem_id, destino_id)
	values(null, 101, "Latam Air Lines", 40, 980.00, "2023-11-12", 2, 5);
	
insert into voo(id, num_voo, comp_aerea, assentos, preco_unit, data_partida, origem_id, destino_id)
	values(null, 102, "Gol Air Lines", 50, 850.00, "2024-01-20", 3, 4);
	
insert into voo(id, num_voo, comp_aerea, assentos, preco_unit, data_partida, origem_id, destino_id)
	values(null, 103, "Voepass Linhas Aereas", 30, 1230.00, "2023-12-25", 1, 3);
	
insert into voo(id, num_voo, comp_aerea, assentos, preco_unit, data_partida, origem_id, destino_id)
	values(null, 104, "Azul Linhas Aéreas Brasileiras", 60, 820.00, "2024-01-10", 3, 1);


/*Reserva*/

insert into reserva(id, data_reserva, num_pessoas, cancelada, usuario_cpf, voo_id)
	values(null, curdate(), 2, false, "000.000.000-01", 3);
	
insert into reserva(id, data_reserva, num_pessoas, cancelada, usuario_cpf, voo_id)
	values(null, curdate(), 2, false, "000.000.000-01", 4);
	
insert into reserva(id, data_reserva, num_pessoas, cancelada, usuario_cpf, voo_id)
	values(null, curdate(), 5, false, "000.000.000-02", 1);
	
insert into reserva(id, data_reserva, num_pessoas, cancelada, usuario_cpf, voo_id)
	values(null, curdate(), 2, false, "000.000.000-03", 1);

/*Contato*/

insert into contato(id, nome, email, telefone, mensagem, resolvido)
	values(null, "Altair Martins", "altair@gmail.com", "(11)40028922", "Solicito contato para esclarecimento de preços", false);
	
insert into contato(id, nome, email, telefone, mensagem, resolvido)
	values(null, "Rosa Maria", "rosa@gmail.com", "(01)12345678", "Preciso de informações sobre passagens para PCD", false);
	
insert into contato(id, nome, email, telefone, mensagem, resolvido)
	values(null, "George Mota", "mota@gmail.com", "(11)33565896", "Preciso tirar dúvidas referentes às formas de pagamento", false);


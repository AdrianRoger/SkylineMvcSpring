drop database skylineSpring;
create database skylineSpring;
use skylineSpring;

create table if not exists USUARIO(
	cpf varchar(14) primary key,
    nome varchar(80) not null,
    email varchar(80) unique not null,
    telefone varchar(14),
    cep varchar(9) not null,
    rua varchar(80) not null,
    numero int not null,
    complemento varchar(80),
    ativo boolean default true
);
insert into usuario values("000.000.000-01", "Adrian Roger", "adrian.santos@aluno.recode.org.br", 
"61995034528", "72145-000", "Qnm 38", 46, null, true);
insert into usuario values("000.000.000-02", "Lucas", "lucas@gmail.com", 
"61999999999", "00000-000", "Sem nome", 01, null, true);
insert into usuario values("000.000.000-03", "Marco Aurélio", "marco.aurelio@gmail.com", 
"61987654321", "72000-000", "Qnm 40 conj C", 35, null, true);

create table if not exists CIDADE(
	id int primary key auto_increment,
    cidade varchar(30) not null,
    estado varchar(30) not null,
    pais varchar(30) not null,
    aeroporto varchar(80) not null
);

insert into cidade values(null, "Brasília", "DF", "BR", "Aeroporto Internacional Juscelino Kubitschek");
insert into cidade values(null, "Goiania", "GO", "BR", "Aeroporto Internacional Santa Genoveva");
insert into cidade values(null, "Guarulhos", "SP", "BR", "Aeroporto Internacional de Guarulhos");
insert into cidade values(null, "São Paulo", "SP", "BR", "Aeroporto Deputado Freitas Nobre");
insert into cidade values(null, "Rio de Janeiro", "RJ", "BR", "Aeroporto Santos Drumond");

create table if not exists VOO(
	id int primary key auto_increment,
    num_voo int unique not null,
    comp_aerea varchar(30) not null,
    assentos int not null,
    preco_unit decimal(10,2) not null,
    data_partida date not null,
    origem_id int not null,
    destino_id int not null,
    constraint foreign key (origem_id) references cidade(id),
    constraint foreign key (destino_id) references cidade(id)
);

insert into voo values(null, 101, "Latam Air Lines", 40, 980.00, "2023-11-12", 2, 5);
insert into voo values(null, 102, "Gol Air Lines", 50, 850.00, "2024-01-20", 3, 4);
insert into voo values(null, 103, "Voepass Linhas Aereas", 30, 1230.00, "2023-12-25", 1, 3);
insert into voo values(null, 104, "Azul Linhas Aéreas Brasileiras", 60, 820.00, "2024-01-10", 3, 1);


create table if not exists RESERVA(
	id int primary key auto_increment,
    data_reserva date not null,
    num_pessoas int not null,
    cancelada boolean default false,
    usuario_cpf varchar(14) not null,
    voo_id int not null,
    constraint foreign key (usuario_cpf) references usuario(cpf) on update cascade,
    constraint foreign key (voo_id) references voo(id) on update cascade
);

insert into reserva values(null, curdate(), 2, false, "000.000.000-01", 3);
insert into reserva values(null, curdate(), 2, false, "000.000.000-01", 4);
insert into reserva values(null, curdate(), 5, false, "000.000.000-02", 1);
insert into reserva values(null, curdate(), 2, false, "000.000.000-03", 1);

create table if not exists CONTATO(
	id int primary key auto_increment,
    nome varchar(80) not null,
    email varchar(80) not null,
    telefone varchar(14) not null,
    mensagem varchar(500) not null,
    resolvido boolean default false
);

insert into contato values(null, "Altair Martins", "altair@gmail.com", "1140028922", "Solicito contato para esclarecimento de preços", false);
insert into contato values(null, "Rosa Maria", "rosa@gmail.com", "0112345678", "Preciso de informações sobre passagens para PCD", false);
insert into contato values(null, "George Mota", "mota@gmail.com", "01133565896", "Preciso tirar dúvidas referentes às formas de pagamento", false);

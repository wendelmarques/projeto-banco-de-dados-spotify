drop database spotify; -- apaga um banco de dados com nome spotify
create database spotify; -- cria um banco de dados chamado spotify
use spotify;

create table administrador(
	nome varchar(256) not null,
	matricula varchar(14) not null,

	primary key (matricula)
)ENGINE=InnoDB;

create table usuario (
	id_usuario varchar(20) not null,
	email varchar(256) not null,
	nome varchar(256) not null,
	senha varchar(256) not null,
	cidade_residencia varchar(40) not null,
	data_cadastro date not null,
	adm_matricula varchar(256) not null,

	primary key(id_usuario),
	unique(id_usuario),

	foreign key (adm_matricula) references administrador(matricula)

)ENGINE=InnoDB;

create table artista(
	id_user_artista varchar(20) not null,
	cnpj varchar(20) not null,
	nome_artistico varchar(256) not null,
	genero_musical varchar(14) not null,
	
	primary key(id_user_artista),
	unique(cnpj, id_user_artista),
	foreign key(id_user_artista) references usuario(id_usuario)

)ENGINE=InnoDB;

create table album(

	idartAlb varchar(20) not null,
	nome_album varchar(256) not null,
	data_lancamento date not null,

	primary key(nome_album, idartAlb),
	unique(idartAlb, nome_album),
	foreign key(idartAlb) references artista(id_user_artista)

)ENGINE=InnoDB;


create table musica(

	id varchar(40) not null,
	titulo varchar(60) not null,
	duracao time not null,
	produtora varchar(70) not null,
	Nome_albumMus varchar(256) not null,
	idartalbMus varchar(20) not null,
	sequencia int not null,

	primary key(id, idartalbMus),
	unique(id),
	foreign key(Nome_albumMus, idartalbMus) references album(nome_album, idartAlb)


)ENGINE=InnoDB;

create table ouvinte(

	tipo_conta varchar(15) not null,
	id_user_ouvinte varchar(20) not null,

	primary key(id_user_ouvinte),
	foreign key(id_user_ouvinte) references usuario(id_usuario)

)ENGINE=InnoDB;

create table playlist(

	cod_playlist varchar(40) not null,
	nome varchar(256) not null,
	id_ouvinte_playlist varchar(20) not null,

	primary key(cod_playlist, id_ouvinte_playlist),
	unique(cod_playlist),
	foreign key(id_ouvinte_playlist) references ouvinte(id_user_ouvinte)

)ENGINE=InnoDB;

create table compos(

	id_artista_compos varchar(20) not null,
	id_musica_compos varchar(20) not null,

	foreign key(id_artista_compos) references artista(id_user_artista),
	foreign key(id_musica_compos) references musica(id)

)ENGINE=InnoDB;

create table interpreta(

id_artista_interpreta varchar(20) not null,
id_musica_interpreta varchar(20) not null,

foreign key(id_artista_interpreta) references artista(id_user_artista),
foreign key(id_musica_interpreta) references musica(id)


)ENGINE=InnoDB;


create table escuta(

	hora time not null,
	data date not null,
	mus_id varchar(40) not null,
	id_ouvinte_escuta varchar(20) not null,

	foreign key(mus_id) references musica(id),
	foreign key(id_ouvinte_escuta) references ouvinte(id_user_ouvinte)

)ENGINE=InnoDB;

create table possui(

	sequencia int not null,
	possui_cod_playlist varchar(40) not null,
	possui_mus_id varchar(40) not null,

	foreign key(possui_cod_playlist) references playlist(cod_playlist),
	foreign key(possui_mus_id) references musica(id)

)ENGINE=InnoDB;

create table segue(

	id_artista_segue varchar(20) not null,
	id_ouvinte_segue varchar(20) not null,

	foreign key(id_artista_segue) references artista(id_user_artista),
	foreign key(id_ouvinte_segue) references ouvinte(id_user_ouvinte)

)ENGINE=InnoDB;


insert into administrador values('Rafael Rodrigues', '201802122');
insert into administrador values('Joao Netto', '201712345');
insert into administrador values('Paulo Augusto', '201502468');


insert into usuario values('999123456', 'arthurgomes@gmail.com', 'Arthur Gomes', '123456', 'Goiânia', '2011-10-21', '201802122');
insert into usuario values('999125634', 'dayllonnight@outlook.com', 'Dayllon Souza', '246801', 'Belo Horizonte', '2012-08-13', '201802122');
insert into usuario values('999123465', 'misael@hotmail.com', 'Misael', '253416', 'São Paulo', '2014-10-24', '201802122');
insert into usuario values('999354627', 'paulorc@gmail.com', 'Paulo', '982435', 'Rio de Janeiro', '2013-12-07', '201712345');
insert into usuario values('999253641', 'rodrigotap@inf.ufg.br', 'Rodrigo', '174635', 'Florianopólis', '2008-03-04', '201712345');
insert into usuario values('999873465', 'castrocaio@hotmail.com', 'Caio Castro', '452819', 'Amapá', '2010-06-13', '201712345');
insert into usuario values('999172635', 'juliocesar@outlook.com', 'Julio César', '057467', 'Acre', '2011-08-25', '201502468');
insert into usuario values('999111222', 'pedrohenrique@inf.ufg.br', 'Pedro Henrique', '103856', 'Tocantins', '2010-10-19', '201502468');


insert into artista values('999123465', '12.785.699/0001-21', 'Post Malone', 'Hip-Hop');
insert into artista values('999125634', '91.149.344/0001-12', 'Dayllon night', 'Rock');
insert into artista values('999354627', '01.790.256/0001-02', 'Japones do cerrado', 'Sertanejo');
insert into artista values('999253641', '25.628.382/0001-23', 'Chris', 'Pop');



insert into album values('999123465', 'I remind you', '2014-02-17');
insert into album values('999125634', 'Find', '2014-02-17');
insert into album values('999354627', 'Replace', '2014-02-17');
insert into album values('999253641', 'Result', '2014-02-17');




insert into musica values('12345678', 'Sunflower', '00:03:02', 'Death Row', 'I remind you', '999123465', '2');
insert into musica values('54637281', 'Enemies', '00:03:10', 'Death Row', 'I remind you', '999123465', '1');
insert into musica values('35463728', 'Internet', '00:02:50', 'Death Row', 'I remind you', '999123465', '1');
insert into musica values('38574632', 'T.N.T', '00:05:02', 'Avast', 'Find', '999125634', '1');
insert into musica values('87654321', 'Shoot to Thrill', '00:05:06', 'Avast', 'Find', '999125634', '2');
insert into musica values('18273645', 'Moneytalks', '00:03:40', 'Avast', 'Find', '999125634', '1');
insert into musica values('98725343', 'Rock and Roll Train', '00:03:02', 'Avast', 'Find', '999125634', '3');
insert into musica values('90647003', 'Bebo Cerveja', '00:04:02', 'Sunset Sound', 'Replace', '999354627', '3');
insert into musica values('18327463', 'Bora Festejar', '00:03:32', 'Sunset Sound', 'Replace', '999354627', '3');
insert into musica values('37263474', 'Ayo', '00:02:02', 'Studios 301', 'Result', '999253641','1');
insert into musica values('25172736', 'The Life', '00:04:32', 'Studios 301', 'Result', '999253641', '2');
insert into musica values('83847573', 'Are You With Me', '00:03:42', 'Studios 301', 'Result', '999253641', '3');
insert into musica values('19283746', 'Without Me', '00:03:35', 'Studios 301', 'Result', '999253641', '2');
insert into musica values('26354735', 'Shape Of You', '00:03:01', 'Studios 301', 'Result', '999253641', '1');



insert into ouvinte values('Premium', '999123456');
insert into ouvinte values('Premium', '999873465');
insert into ouvinte values('Free', '999172635');
insert into ouvinte values('Free', '999111222');



insert into playlist values('02661836', 'Hip-Hop', '999123456');
insert into playlist values('52637485', 'Rock', '999123456');
insert into playlist values('63547283', 'Rock', '999873465');
insert into playlist values('15264744', 'Pop', '999873465');
insert into playlist values('10293847', 'Sertanejo', '999873465');
insert into playlist values('16254637', 'Pop', '999111222');


insert into compos values('999123465', '12345678');
insert into compos values('999123465', '54637281');
insert into compos values('999123465', '35463728');
insert into compos values('999125634', '38574632');
insert into compos values('999125634', '87654321');
insert into compos values('999125634', '18273645');
insert into compos values('999125634', '98725343');
insert into compos values('999354627', '90647003');
insert into compos values('999354627', '18327463');
insert into compos values('999253641', '37263474');
insert into compos values('999253641', '25172736');
insert into compos values('999253641', '83847573');
insert into compos values('999253641', '19283746');
insert into compos values('999253641', '26354735');

insert into interpreta values('999123465', '12345678');
insert into interpreta values('999123465', '54637281');
insert into interpreta values('999123465', '35463728');
insert into interpreta values('999125634', '38574632');
insert into interpreta values('999125634', '87654321');
insert into interpreta values('999125634', '18273645');
insert into interpreta values('999125634', '98725343');
insert into interpreta values('999354627', '90647003');
insert into interpreta values('999354627', '18327463');
insert into interpreta values('999253641', '37263474');
insert into interpreta values('999253641', '25172736');
insert into interpreta values('999253641', '83847573');
insert into interpreta values('999253641', '19283746');
insert into interpreta values('999253641', '26354735');


insert into escuta values('14:15:03', '2019-10-24', '12345678', '999123456');
insert into escuta values('20:11:02', '2019-09-22', '38574632', '999123456');
insert into escuta values('22:10:23', '2019-10-20', '18273645', '999123456');
insert into escuta values('16:11:40', '2019-11-21', '12345678', '999873465');
insert into escuta values('08:05:45', '2019-11-19', '83847573', '999111222');
insert into escuta values('10:01:23', '2019-11-22', '26354735', '999111222');




insert into possui values('2', '02661836', '12345678');
insert into possui values('2', '52637485', '38574632');
insert into possui values('2', '52637485', '18273645');
insert into possui values('2', '15264744', '83847573');
insert into possui values('2', '16254637', '26354735');
insert into possui values('2', '16254637', '12345678');


insert into segue values('999123465', '999123456');
insert into segue values('999123465', '999873465');
insert into segue values('999123465', '999172635');
insert into segue values('999125634', '999123456');
insert into segue values('999125634', '999111222');
insert into segue values('999354627', '999172635');
insert into segue values('999253641', '999873465');
insert into segue values('999253641', '999111222');


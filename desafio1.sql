DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.artistas(
    id int NOT NULL PRIMARY KEY auto_increment,
    nome varchar(50) NOT NULL
);
CREATE TABLE SpotifyClone.albuns(
    id int NOT NULL PRIMARY KEY auto_increment,
    album_nome varchar(100) NOT NULL,
  	ano_lancamento int NOT NULL,
 	artista_id int NOT NULL,
  	FOREIGN KEY (artista_id) REFERENCES artistas(id)
);
CREATE TABLE SpotifyClone.musicas(
	id int NOT NULL PRIMARY KEY auto_increment,
  	nome varchar(50) NOT NULL,
  	artista_id int NOT NULL,
  	duracao_segundos smallint NOT NULL,
 	album_id int NOT NULL,
  	FOREIGN KEY(artista_id) REFERENCES artistas(id),
  	FOREIGN KEY(album_id) REFERENCES albuns(id)
);
CREATE TABLE SpotifyClone.planos(
    id int NOT NULL PRIMARY KEY auto_increment,
  	plano varchar(100) NOT NULL,
  	valor_plano decimal(19, 2) NOT NULL
);

CREATE TABLE SpotifyClone.usuarios(
    id int NOT NULL PRIMARY KEY auto_increment,
  	nome varchar(100) NOT NULL,
  	idade int NOT NULL,
  	plano_id int NOT NULL,
   	data_assinatura DATETIME NOT NULL DEFAULT NOW(),
  	FOREIGN KEY (plano_id) REFERENCES planos(id)
);

CREATE TABLE SpotifyClone.historico(
  	historico_id int auto_increment,
  	usuario_id int NOT NULL,
  	musica_id int NOT NULL,
   	data_reprodução DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  	PRIMARY KEY (historico_id, usuario_id, musica_id),
  	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  	FOREIGN KEY (musica_id) REFERENCES musicas(id)
);

CREATE TABLE SpotifyClone.seguindo(
  	seguindo_id int NOT NULL auto_increment,
  	usuario_id int NOT NULL,
  	artista_id int NOT NULL,
  	PRIMARY KEY (seguindo_id, usuario_id),
  	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  	FOREIGN KEY (artista_id) REFERENCES artistas(id)
);

INSERT INTO
  SpotifyClone.planos(plano, valor_plano)
VALUES
 	("gratuito", 0),
	("universitário", 5.99),
  ("pessoal", 6.99),
	("familiar", 7.99);

INSERT INTO
	SpotifyClone.artistas(nome)
VALUES
	("Walter Phoenix"),
  ("Peter Strong"),
  ("Lance Day"),
  ("Freedie Shannon"),
  ("Tyler Isle"),
  ("Fog");

INSERT INTO
  SpotifyClone.albuns(album_nome, ano_lancamento, artista_id)
VALUES
  ("Envious", 1990, 1),
  ("Exuberant", 1993, 1),
  ("Hallowed Steam", 1995, 2),
  ("Incandescent", 1998, 3),
  ("Temporary Culture", 2001, 4),
  ("Library of liberty", 2003, 4),
  ("Chained Down", 2007, 5),
  ("Cabinet of fools", 2012, 5),
  ("No guarantees", 2015, 5),
  ("Apparatus", 2015, 6);
  
INSERT INTO
	SpotifyClone.musicas(nome, artista_id, duracao_segundos, album_id)
VALUES
	("Soul For Us", 1, 200, 1),
    ("Reflections Of Magic", 1, 163, 1),
    ("Dance WITH Her Own", 1, 116, 1),
    ("Troubles Of My INNER Fire", 1, 203, 2),
    ("Time Fireworks", 1, 152, 2),
    ("Magic Circus", 2, 105, 3),
    ("Honey, So Do I", 2, 207, 3),
    ("Sweetie, Let's Go Wild", 2, 139, 3),
    ("She Knows", 2, 244, 3),
    ("Fantasy For Me", 3, 100, 4),
    ("Celebration Of More", 3, 146, 4),
    ("Rock His Everything", 3, 223, 4),
    ("Home Forever", 3, 231, 4),
    ("Diamond Power", 3, 241, 4),
    ("Let's Be Silly", 3, 132, 4),
    ("Thang Of Thunder", 4, 240, 5),
    ("Words Of Her Life", 4, 185, 5),
    ("Without My Streets", 4, 176, 5),
    ("Need Of The Evening", 4, 190, 6),
    ("History Of My Roses", 4, 222, 6),
    ("Without My Love", 4, 111, 6),
    ("Walking AND Game", 4, 123, 6),
    ("Young AND Father", 4, 197, 6),
    ("Finding My Traditions", 5, 179, 7),
    ("Walking AND Man", 5, 229, 7),
    ("Hard AND Time", 5, 135, 7),
    ("Honey, I'm A Lone Wolf", 5, 150, 7),
    ("She Thinks I Won't Stay Tonight", 5, 166, 8),
    ("He Heard You're Bad For Me", 5, 154, 8),
    ("He Hopes We Can't Stay", 5, 210, 8),
    ("I Know I Know", 5, 117, 8),
    ("He's Walking Away", 5, 159, 9),
    ("He's Trouble", 5, 138, 9),
    ("I Heard I Want To Bo Alone", 5, 120, 9),
    ("I Ride Alone", 5, 151, 9),
    ("Honey", 6, 79, 10),
    ("You Cheated ON Me", 6, 95, 10),
    ("Wouldn't It Be Nice", 6, 213, 10),
    ("Baby", 6, 136, 10),
    ("You Make Me Feel So..", 6, 83, 10);


INSERT INTO
	SpotifyClone.usuarios
	(nome, idade, plano_id)
VALUES
	('Thati', 23, 1),
	('Cintia', 35, 4),
	('Bill', 20, 2),
	('Roger', 45, 3),
	('Norman', 58, 3),
	('Patrick', 33, 4),
	('Vivian', 26, 2),
	('Carol', 19, 2),
	('Angelina', 42, 4),
	('Paul', 46, 4);
 
INSERT INTO
	SpotifyClone.seguindo(usuario_id, artista_id)
VALUES
		(1, 1),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 3),
    (3, 1),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 3),
    (6, 1),
    (7, 2),
    (7, 5),
    (8, 1),
    (8, 5),
    (9, 6),
    (9, 4),
    (9, 3),
    (10, 2),
    (10, 6);
  
INSERT INTO
	SpotifyClone.historico(usuario_id, musica_id, data_reprodução)
VALUES
    (1, 36, '2020-02-28 10:45:55'),
    (1, 25, '2020-05-02 05:30:35'),
    (1, 23, '2020-03-06 11:22:33'),
    (1, 14, '2020-08-05 08:05:17'),
    (1, 15, '2020-09-14 16:32:22'),
    (2, 34, '2020-01-02 07:40:33'),
    (2, 24, '2020-05-16 06:16:22'),
    (2, 21, '2020-10-09 12:27:48'),
    (2, 39, '2020-09-21 13:14:46'),
    (3, 6, '2020-11-13 16:55:13'),
    (3, 3, '2020-12-05 18:38:30'),
    (3, 26, '2020-07-30 10:00:00'),
    (4, 2, '2021-08-15 17:10:10'),
    (4, 35, '2021-07-10 15:20:30'),
    (4, 27, '2021-01-09 01:44:33'),
    (5, 7, '2019-02-07 20:33:48'),
    (5, 12, '2017-01-24 00:31:17'),
    (5, 14, '2017-10-12 12:35:20'),
    (5, 1, '2018-05-29 14:56:41'),
    (6, 38, '2019-02-07 20:33:48'),
    (6, 29, '2017-01-24 00:31:17'),
    (6, 30, '2017-10-12 12:35:20'),
    (6, 22, '2018-05-29 14:56:41'),
    (7, 5, '2018-05-09 22:30:49'),
    (7, 4, '2020-07-27 12:52:58'),
    (7, 11, '2018-01-16 18:40:43'),
    (8, 39, '2018-03-21 16:56:40'),
    (8, 40, '2020-10-18 13:38:05'),
    (8, 32, '2019-05-25 08:14:03'),
    (8, 33, '2021-08-15 21:37:09'),
    (9, 16, '2021-05-24 17:23:45'),
    (9, 17, '2018-12-07 22:48:52'),
    (9, 8, '2021-03-14 06:14:26'),
    (9, 9, '2020-04-01 03:36:00'),
    (10, 20, '2017-02-06 08:21:34'),
    (10, 21, '2017-12-04 05:33:43'),
    (10, 12, '2017-07-27 05:24:49'),
    (10, 13, '2017-12-25 01:03:57');
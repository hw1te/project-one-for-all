DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.artistas(
    id int NOT NULL PRIMARY KEY auto_increment,
    nome varchar(50) NOT NULL
);
CREATE TABLE SpotifyClone.musicas(
    id int NOT NULL PRIMARY KEY auto_increment,
    artista_id int NOT NULL,
  	nome varchar(100) NOT NULL,
  	duracao_segundos int NOT NULL,
  	FOREIGN KEY (artista_id) REFERENCES artistas(id)
);
CREATE TABLE SpotifyClone.albuns(
    id int NOT NULL PRIMARY KEY auto_increment,
    artista_id int NOT NULL,
  	nome varchar(100) NOT NULL,
  	ano_lancamento int NOT NULL,
  	FOREIGN KEY (artista_id) REFERENCES artistas(id)
);

CREATE TABLE SpotifyClone.planos(
    id int NOT NULL PRIMARY KEY auto_increment,
  	plano varchar(100) NOT NULL,
  	valor_plano int NOT NULL
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
  	nome varchar(100) NOT NULL,
  	usuario_id int NOT NULL,
  	musica_id int NOT NULL,
   	data_reprodução DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  	PRIMARY KEY (historico_id),
  	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  	FOREIGN KEY (musica_id) REFERENCES musicas(id)
);

CREATE TABLE SpotifyClone.seguindo(
  	seguindo_id int NOT NULL auto_increment,
  	usuario_id int NOT NULL,
  	artista_id int NOT NULL,
  	PRIMARY KEY (seguindo_id),
  	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  	FOREIGN KEY (artista_id) REFERENCES artistas(id)
);
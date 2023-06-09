DROP DATABASE IF EXISTS SpotifyClone;

--   CREATE DATABASE IF NOT EXISTS SpotifyClone;

--   CREATE TABLE SpotifyClone.tabela1(
--       coluna1 tipo restricoes,
--       coluna2 tipo restricoes,
--       colunaN tipo restricoes,
--   ) engine = InnoDB;

--   CREATE TABLE SpotifyClone.tabela2(
--       coluna1 tipo restricoes,
--       coluna2 tipo restricoes,
--       colunaN tipo restricoes,
--   ) engine = InnoDB;

--   INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
--   VALUES
--     ('exemplo de dados 1', 'exemplo de dados A'),
--     ('exemplo de dados 2', 'exemplo de dados B'),
--     ('exemplo de dados 3', 'exemplo de dados C');

--   INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
--   VALUES
--     ('exemplo de dados 1', 'exemplo de dados X'),
--     ('exemplo de dados 2', 'exemplo de dados Y');

 DROP DATABASE IF EXISTS SpotifyClone;
 CREATE DATABASE IF NOT EXISTS SpotifyClone;

    CREATE TABLE IF NOT EXISTS SpotifyClone.plano(
      id_plano INT AUTO_INCREMENT PRIMARY KEY,
      tipo_plano VARCHAR(100) NOT NULL,
      valor_plano DECIMAL (3,2)
  ) ENGINE = InnoDB;

   INSERT INTO SpotifyClone.plano (tipo_plano, valor_plano)
    VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  CREATE TABLE IF NOT EXISTS SpotifyClone.usuario(
      id_usuario INT AUTO_INCREMENT PRIMARY KEY,
      usuario VARCHAR(100) NOT NULL,
      idade INT NOT NULL,
      data_assinatura DATE,
      id_plano INT,
      FOREIGN KEY (id_plano) REFERENCES SpotifyClone.plano(id_plano)
  ) ENGINE=InnoDB;

INSERT INTO SpotifyClone.usuario (usuario, idade, data_assinatura, id_plano)
    VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-01-17', 2),
    ('Sandi Metz', 58, '2018-04-29', 2),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 85, '2019-06-05', 4),
    ('Judith Butler', 45, '2020-05-13', 4),
    ('Jorge Amado', 58, '2017-02-17', 4);

    CREATE TABLE IF NOT EXISTS SpotifyClone.artista(
      id_artista INT AUTO_INCREMENT PRIMARY KEY,
      nome_artista VARCHAR(100) NOT NULL
  ) ENGINE = InnoDB;

   INSERT INTO SpotifyClone.artista (nome_artista)
    VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

    CREATE TABLE IF NOT EXISTS SpotifyClone.album(
      id_album INT AUTO_INCREMENT PRIMARY KEY,
      nome_album VARCHAR(100) UNIQUE,
      ano_lancamento INT,
      id_artista INT,
      FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
  ) ENGINE = InnoDB;

INSERT INTO SpotifyClone.album (nome_album, ano_lancamento, id_artista)
    VALUES
    ('Renaissance', 2002, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

    CREATE TABLE IF NOT EXISTS SpotifyClone.cancoes(
      id_cancoes INT AUTO_INCREMENT PRIMARY KEY,
      cancoes_nome VARCHAR(200) NOT NULL UNIQUE,
      duracao_cancao INT NOT NULL,
      id_album INT,
      FOREIGN KEY (id_album) REFERENCES album(id_album)
  ) ENGINE = InnoDB;

 INSERT INTO SpotifyClone.cancoes (cancoes_nome, duracao_cancao, id_album)
    VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGO’S GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Don’t Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bard’s Song', 244, 7),
    ('Feeling Good', 100, 8);

    CREATE TABLE IF NOT EXISTS SpotifyClone.seguindo(
      id_usuario INTEGER,
      id_artista INTEGER,
      CONSTRAINT PRIMARY KEY (id_usuario, id_artista),
      FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
      FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
  ) ENGINE = InnoDB;
  
    INSERT INTO SpotifyClone.seguindo (id_usuario, id_artista)
    VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

    CREATE TABLE IF NOT EXISTS SpotifyClone.historico(
      id_usuario INTEGER,
      id_cancoes INTEGER,
      data_reproducao DATETIME,
      CONSTRAINT PRIMARY KEY(id_usuario, id_cancoes),
   FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
   FOREIGN KEY (id_cancoes) REFERENCES cancoes(id_cancoes)
  ) ENGINE = InnoDB;

    INSERT INTO SpotifyClone.historico (id_usuario, id_cancoes, data_reproducao)
    VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4,'2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');


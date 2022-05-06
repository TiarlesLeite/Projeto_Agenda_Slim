//varial para criar tabela
final createTable = '''
CREATE TABLE contato(
  id INTEGER NOT NULL PRIMARY KEY
  ,nome VARCHAR(200) NOT NULL
  ,telefone CHAR(16) NOT NULL
  ,email VARCHAR(150) NOT NULL
  ,url_avatar VARCHAR (300) NOT NULL
)
''';

final insert1 = '''
INSERT INTO contato (nome, telefone, email, url_avatar)
VALUES ('Tiarles','(51)99570-6770','felipe@email.com','https://cdn.pixabay.com/photo/2021/07/03/10/54/naruto-6383641_960_720.png')
''';

final insert2 = '''
INSERT INTO contato (nome, telefone, email, url_avatar)
VALUES ('Fatima','(89)98456-1739','fatima@email.com','https://cdn.pixabay.com/photo/2021/01/17/09/11/woman-5924367_960_720.png')
''';

final insert3 = '''
INSERT INTO contato (nome, telefone, email, url_avatar)
VALUES ('Uhtred','(55)98765-4321','uhtred@email.com','https://cdn.pixabay.com/photo/2020/11/22/22/17/male-5768177_960_720.png')
''';

final insert4 = '''
INSERT INTO contato (nome, telefone, email, url_avatar)
VALUES ('Berenice','(89)92345-6789','berenice@email.com','https://cdn.pixabay.com/photo/2022/03/10/07/51/woman-7059281_960_720.png')
''';

final insert5 = '''
INSERT INTO contato (nome, telefone, email, url_avatar)
VALUES ('Rebeka','(45)99843-5789','rebeka@email.com','https://cdn.pixabay.com/photo/2021/09/24/22/05/woman-6653634_960_720.jpg')
''';

final criarBanco = [
  '''
    CREATE TABLE usuario (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL, 
    email TEXT NOT NULL,
    senha TEXT NOT NULL,
    cpf TEXT NOT NULL,
    telefone TEXT NOT NULL
    )''',
  '''INSERT INTO usuario(nome, email, senha, cpf, telefone) VALUES("Adrieli","adrieli@gmail.com","0000", "123.123.123-23", "44999999999")''',
  '''INSERT INTO usuario(nome, email, senha, cpf, telefone) VALUES("Adrieli K","adrieliK@gmail.com","0001", "123.123.123-23", "44999999999")''',
  '''
    CREATE TABLE familia (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL, 
    descricao TEXT NOT NULL
    )''',
  '''INSERT INTO familia(nome, descricao) VALUES("Souza","Familia Souza")''',
  '''INSERT INTO familia(nome, descricao) VALUES("Moraes","Familia Moraes")''',
  '''
    CREATE TABLE usuario_familia (
    id INTEGER PRIMARY KEY,
    usuario_id INTEGER NOT NULL, 
    familia_id INTEGER NOT NULL,
    FOREIGN KEY(usuario_id) REFERENCES usuario(id),
    FOREIGN KEY(familia_id) REFERENCES familia(id)
    )''',
  '''INSERT INTO usuario_familia(usuario_id, familia_id) VALUES(1,1)''',
  '''INSERT INTO usuario_familia(usuario_id, familia_id) VALUES(2,1)''',
      """
    CREATE TABLE glicemia(
      id INTEGER NOT NULL PRIMARY KEY
      ,valorGlicemia VARCHAR(200) NOT NULL
    )
    """,
  ''' INSERT INTO glicemia(id, valorGlicemia) VALUES (1, '150') ''',
  ''' INSERT INTO glicemia(id, valorGlicemia) VALUES (2, '130') ''',
  ''' INSERT INTO glicemia(id, valorGlicemia) VALUES (3, '140') ''',
  ''' INSERT INTO glicemia(id, valorGlicemia) VALUES (4, '150') ''',
  ''' INSERT INTO glicemia(id, valorGlicemia) VALUES (5, '130') ''',
  ''' INSERT INTO glicemia(id, valorGlicemia) VALUES (6, '140') ''',
  """
    CREATE TABLE pressaoArterial(
      id INTEGER NOT NULL PRIMARY KEY
      ,valorPressaoArterial VARCHAR(200) NOT NULL
    )
    """,
  '''
    INSERT INTO pressaoArterial(id, valorPressaoarterial) VALUES (1, '135')''',
    '''INSERT INTO pressaoArterial(id, valorPressaoarterial) VALUES (2, '140')''',
    '''INSERT INTO pressaoArterial(id, valorPressaoarterial) VALUES (3, '150')''',
  '''
    INSERT INTO pressaoArterial(id, valorPressaoarterial) VALUES (4, '135')''',
  '''INSERT INTO pressaoArterial(id, valorPressaoarterial) VALUES (5, '140')''',
  '''INSERT INTO pressaoArterial(id, valorPressaoarterial) VALUES (6, '150')'''
    
];

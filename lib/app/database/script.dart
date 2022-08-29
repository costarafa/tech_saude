final createTable = 
"""
CREATE TABLE glicemia(
  id INTEGER NOT NULL PRIMARY KEY
  ,valorGlicemia VARCHAR(200) NOT NULL
)
""";

final insert1 = """
INSERT INTO glicemia(valorGlicemia) VALUES ('150')

""";

final String  criarBanco = 
  '''
    CREATE TABLE usuario (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL, 
    email TEXT NOT NULL,
    senha TEXT NOT NULL,
    telefone TEXT NOT NULL
    )''';

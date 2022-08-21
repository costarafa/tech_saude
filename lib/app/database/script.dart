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
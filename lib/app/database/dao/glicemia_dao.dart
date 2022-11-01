import 'package:flutter/cupertino.dart';
import 'package:saude_tech/app/database/sqlite/connection.dart';
import 'package:saude_tech/app/domain/entities/glicemia.dart';
import 'package:sqflite/sqflite.dart';
// ignore: import_of_legacy_library_into_null_safe

class GlicemiaDAO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  const GlicemiaDAO({Key key}) : super(key: key);

  Future<bool> salvar(Glicemia glicemia) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO glicemia (valorGlicemia) VALUES (?)';
    var linhasAfetadas = await db.rawInsert(sql, [glicemia.valorGlicemia]);
    db.close();
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(Glicemia glicemia) async {
    const sql = 'UPDATE glicemia SET valorGlicemia=? WHERE id = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas = await db.rawUpdate(sql, [glicemia.valorGlicemia]);
    db.close();
    return linhasAfetadas > 0;
  }

  Future<List<Glicemia>> listarTodos() async {
    Database database;
    try {
      const sql = 'SELECT * FROM glicemia';
      database = await Conexao.abrirConexao();
      List<Map<String, Object>> resultado = (await database.rawQuery(sql));
      if (resultado.isEmpty) {
        return null;
      }else{
        List<Glicemia> glicemias = resultado.map((linha) {
          return Glicemia(
              id: linha['id'] as int,
              valorGlicemia: linha['valorGlicemia']);
        }).toList();
        database.close();
        return glicemias;
      }
    } catch (e) {
      throw Exception('Error ao listar valores de glicemia');
    } finally {
      database.close();
    }
  }

  Future<bool> excluir(int id) async {
    Database db;
    try {
      const sql = 'DELETE FROM glicemia WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      db.close();
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('Erro ao excluir');
    } finally {
      db.close();
    }
  }

  // ignore: missing_return
  validateValorGlicemia(int valorGlicemia) {
    if (valorGlicemia < 100) {
      return ('Glicemia ok');
    } else if (valorGlicemia > 100 && valorGlicemia < 125) {
      return ('Glicemia de Jejum alterada');
    } else if (valorGlicemia >= 126 && valorGlicemia < 140) {
      return ('Glicemia acima do nível, tome um remédio');
    } else if (valorGlicemia > 140 && valorGlicemia < 200) {
      return ('Você está intolerante a Glicose');
    }
  }
}

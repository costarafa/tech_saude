import 'package:saude_tech/app/database/sqlite/connection.dart';
import 'package:saude_tech/app/domain/entities/glicemia.dart';
import 'package:sqflite/sqflite.dart';
// ignore: import_of_legacy_library_into_null_safe

class GlicemiaDAO {
  Database _db;

  Future<List<Glicemia>> find() async {
    _db = await Conexao.abrirConexao();

    List<Map<String, dynamic>> resultado = await _db.query('glicemia');
    List<Glicemia> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Glicemia(id: linha['id'], valorGlicemia: linha['valorGlicemia']);
    });
    return lista;
  }

  remove(int id) async {
    _db = await Conexao.abrirConexao();
    var sql = 'DELETE FROM glicemia WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  save(Glicemia glicemia) async {
    _db = await Conexao.abrirConexao();
    var sql;
    if (glicemia.id == null) {
      sql = 'INSERT INTO glicemia (valorGlicemia) VALUES (?)';
      _db.rawInsert(sql, [glicemia.valorGlicemia]);
    } else {
      sql = 'UPDATE glicemia SET valorGlicemia = ? WHERE id = ?';
      _db.rawUpdate(sql, [glicemia.valorGlicemia]);
    }
  }
}

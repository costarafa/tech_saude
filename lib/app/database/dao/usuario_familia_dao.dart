import 'package:flutter/material.dart';
import 'package:saude_tech/app/database/sqlite/connection.dart';
import 'package:saude_tech/app/domain/entities/usuario_familia.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioFamiliaDao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  const UsuarioFamiliaDao({Key key}) : super(key: key);

  Future<bool> salvar(UsuarioFamilia usuarioFamilia) async {
    Database db = await Conexao.abrirConexao();
    const sql =
        'INSERT INTO usuario_familia (usuario_id, familia_id) VALUES (?,?)';
    var linhasAfetadas = await db.rawInsert(
        sql, [usuarioFamilia.usuario_id, usuarioFamilia.familia_id]);
    db.close();
    return linhasAfetadas > 0;
  }

  Future<List<UsuarioFamilia>> listarTodos() async {
     Database database;
    try {
      const sql = 'SELECT * FROM usuario_familia';
      database = await Conexao.abrirConexao();
      List<Map<String, Object>> resultado = (await database.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List<UsuarioFamilia> usuarioFamilias = resultado.map((linha) {
        return UsuarioFamilia(
            id: linha['id'] as int,
            usuario_id: linha['usuario_id'].toString(),
            familia_id: linha['familia_id'].toString());
      }).toList();
      database .close();
      return usuarioFamilias;
    } catch (e) {
      throw Exception('Error ao listar ');
    } finally {
      database.close();
    }
  }

  Future<bool> excluir(int id) async {
     Database db;
    try {
      const sql = 'DELETE FROM usuario_familia WHERE id = ?';
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
}
import 'package:flutter/material.dart';
import 'package:saude_tech/app/database/sqlite/connection.dart';
import 'package:saude_tech/app/domain/entities/familia.dart';
import 'package:sqflite/sqflite.dart';

class FamiliaDao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  const FamiliaDao({Key key}) : super(key: key);

  Future<bool> salvar(Familia familia) async {
    Database db = await Conexao.abrirConexao();
    const sql =
        'INSERT INTO familia (nome, descricao) VALUES (?,?)';
    var linhasAfetadas = await db.rawInsert(
        sql, [familia.nome, familia.descricao]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(Familia familia) async {
    const sql =
        'UPDATE familia SET nome = ?, descricao=? WHERE id = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas = await db.rawUpdate(sql, [
      familia.nome,
      familia.descricao,
      familia.id
    ]);
    return linhasAfetadas > 0;
  }

  Future<List<Familia>> listarTodos() async {
     Database database;
    try {
      const sql = 'SELECT * FROM familia';
      database = await Conexao.abrirConexao();
      List<Map<String, Object>> resultado = (await database.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List<Familia> familias = resultado.map((linha) {
        return Familia(
            id: linha['id'] as int,
            nome: linha['nome'].toString(),
            descricao: linha['descricao'].toString());
      }).toList();
      return familias;
    } catch (e) {
      throw Exception('Error ao listar familias');
    } finally {
      database.close();
    }
  }

  Future<bool> excluir(int id) async {
     Database db;
    try {
      const sql = 'DELETE FROM familia WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('Erro ao excluir');
    } finally {
      db.close();
    }
  }

}
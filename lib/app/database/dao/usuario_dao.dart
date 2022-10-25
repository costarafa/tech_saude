import 'package:flutter/material.dart';
import 'package:saude_tech/app/database/sqlite/connection.dart';
import 'package:saude_tech/app/domain/entities/usuario.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioDao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  const UsuarioDao({Key key}) : super(key: key);

  Future<bool> salvar(Usuario usuario) async {
    Database db = await Conexao.abrirConexao();
    const sql =
        'INSERT INTO usuario (nome, email, senha, telefone, cpf) VALUES (?,?,?,?,?)';
    var linhasAfetadas = await db.rawInsert(
        sql, [usuario.nome, usuario.email, usuario.senha, usuario.telefone, usuario.cpf]);
    db.close();
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(Usuario usuario) async {
    const sql =
        'UPDATE usuario SET nome = ?, email=?, senha=?, telefone=?, cpf=? WHERE id = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas = await db.rawUpdate(sql, [
      usuario.nome,
      usuario.email,
      usuario.senha,
      usuario.telefone,
      usuario.cpf,
      usuario.id
    ]);
    db.close();
    return linhasAfetadas > 0;
  }

  Future<List<Usuario>> listarTodos() async {
     Database database;
    try {
      const sql = 'SELECT * FROM usuario';
      database = await Conexao.abrirConexao();
      List<Map<String, Object>> resultado = (await database.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List<Usuario> usuarios = resultado.map((linha) {
        return Usuario(
            id: linha['id'] as int,
            nome: linha['nome'].toString(),
            email: linha['email'].toString(),
            senha: linha['senha'].toString(),
            telefone: linha['telefone'].toString(),
            cpf: linha['cpf'].toString());
      }).toList();
      database.close();
      return usuarios;
    } catch (e) {
      throw Exception('Error ao listar usuários');
    } finally {
      database.close();
    }
  }

  Future<bool> excluir(int id) async {
     Database db;
    try {
      const sql = 'DELETE FROM usuario WHERE id = ?';
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
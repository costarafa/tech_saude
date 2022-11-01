import 'package:flutter/cupertino.dart';
import 'package:saude_tech/app/database/sqlite/connection.dart';
import 'package:saude_tech/app/domain/entities/pressao_arterial.dart';
import 'package:sqflite/sqflite.dart';
// ignore: import_of_legacy_library_into_null_safe

class PressaoArterialDAO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  const PressaoArterialDAO({Key key}) : super(key: key);

  Future<bool> salvar(PressaoArterial pressaoArterial) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO pressaoArterial (valorPressaoArterial) VALUES (?)';
    var linhasAfetadas =
        await db.rawInsert(sql, [pressaoArterial.valorPressaoArterial]);
    db.close();
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(PressaoArterial pressaoArterial) async {
    const sql =
        'UPDATE pressaoArterial SET valorPressaoArterial=? WHERE id = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas = await db.rawUpdate(
        sql, [pressaoArterial.valorPressaoArterial, pressaoArterial.id]);
    db.close();
    return linhasAfetadas > 0;
  }

  Future<List<PressaoArterial>> listarTodos() async {
    Database database;
    try {
      const sql = 'SELECT * FROM pressaoArterial';
      database = await Conexao.abrirConexao();
      List<Map<String, Object>> resultado = (await database.rawQuery(sql));
      if (resultado.isEmpty) {
        return null;
      } else {
        List<PressaoArterial> pressoesArteriais = resultado.map((linha) {
          return PressaoArterial(
              id: linha['id'] as int,
              valorPressaoArterial: linha['valorPressaoArterial']);
        }).toList();
        database.close();
        return pressoesArteriais;
      }
    } catch (e) {
      throw Exception('Error ao listar valores de pressão arterial');
    } finally {
      database.close();
    }
  }

  Future<bool> excluir(int id) async {
    Database db;
    try {
      const sql = 'DELETE FROM pressaoArterial WHERE id = ?';
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

// Hoje se considera que a pressão está ótima quando o valor de medição fica na faixa de 12 por 8 — ou, como
//  preferem os especialistas, 120 por 80 milímetros de mercúrio (mmHg).
//  Se o índice passou dos 14 por 9, aí ela é considerada alta

  validateValorPressaoArterial(int valorPressao) {
    if (valorPressao <= 11) {
      return ('Pressão baixa!! tome um remédio');
    } else if (valorPressao <= 12) {
      return ('Pressão ok');
    } else if (valorPressao > 12 && valorPressao <= 14) {
      return ('Pressão alta! Tome remedio');
    }
  }
}

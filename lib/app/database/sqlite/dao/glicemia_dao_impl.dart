import 'package:saude_tech/app/domain/entities/glicemia.dart';
import 'package:saude_tech/app/domain/interfaces/glicemia_dao.dart';
import 'package:sqflite/sqflite.dart';


import '../connection.dart';

class GlicemiaDAOImpl implements GlicemiaDAO{
  Database _db;

  @override
  Future<List<Glicemia>> find() async{
    _db = await Connection.get();
    
    List<Map<String,dynamic>> resultado = await _db.query('glicemia');
    List<Glicemia> lista = List.generate(resultado.length, (i){
      var linha = resultado[i];
      return Glicemia(
        id: linha['id'],
        valorGlicemia: linha['valorGlicemia']
      );
    }
    );
    return lista;
  }

  @override
  remove(int id) async{
    _db = await Connection.get();
    var sql = 'DELETE FROM glicemia WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  save(Glicemia glicemia) async{
    _db = await Connection.get();
    var sql;
    if(glicemia.id == null){
      sql= 'INSERT INTO glicemia (valorGlicemia) VALUES (?)';
      _db.rawInsert(sql, [glicemia.valorGlicemia]);
    }else{
      sql = 'UPDATE glicemia SET valorGlicemia = ? WHERE id = ?';
      _db.rawUpdate(sql,[glicemia.valorGlicemia]);
    }
  }

}
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../script.dart';



class Connection{
  static Database? _db;

  static Future <Database> get() async{

    if(_db == null){
      var path = join(await getDatabasesPath(), 'banco_glicemia');
      _db = await openDatabase(
        path,
        version:1,
        onCreate: (db, v){
          db.execute(createTable);
          db.execute(insert1);
        }
      );
    }
    return _db!;
  }
}

class Conexao {
  static Database? _db;
  static Future<Database> abrirConexao() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'banco2.db');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute(criarBanco);
        },
      );
    }
    return _db!;
  }
}

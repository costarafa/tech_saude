import 'package:path/path.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';

import '../script.dart';

class Conexao {
  static Database _db;
  static Future<Database> abrirConexao() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'banco.db');
      _db = await openDatabase(
        path,
        version: 2,
        onCreate: (db, version) {
          for (var comando in criarBanco) {
            db.execute(comando);
          }
        },
      );
    }
    return _db;
  }
}

import 'package:path/path.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';

import '../script.dart';

class Conexao {
  static Database _db;
  static Future<Database> abrirConexao() async {
    if (_db == null || _db.isOpen == false ) {
      var path = join(await getDatabasesPath(), 'banco5.db');
      _db = await openDatabase(
        path,
        version: 1,
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

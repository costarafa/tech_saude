import 'package:flutter_test/flutter_test.dart';
import 'package:saude_tech/app/database/sqlite/connection.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
   Database db;

  setUp(() async {
    db = (await Conexao.abrirConexao());
  });

  tearDown(() {});

  tearDownAll(() {
    db.close();
  });

  group("Teste de Conexão", () {
    test("Teste de conexão aberta", () {
      expect(db.isOpen, true);
    });
  });
}

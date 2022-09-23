import 'package:flutter_test/flutter_test.dart';
import 'package:saude_tech/app/database/dao/glicemia_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  GlicemiaDAO glicemiaDAO;
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  setUp(() {
    glicemiaDAO = GlicemiaDAO();
  });

  tearDown(() async {

  });

  test("Validar o valor da glicemia", () async {
    var glicemia = 105;
    var resultado = await glicemiaDAO.validateValorGlicemia(glicemia);
    expect(resultado, 'Glicemia de Jejum alterada');
  });
}

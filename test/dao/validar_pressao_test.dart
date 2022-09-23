import 'package:flutter_test/flutter_test.dart';
import 'package:saude_tech/app/database/dao/pressao_arterial_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  PressaoArterialDAO pressaoArterialDAO;
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  setUp(() {
    pressaoArterialDAO = PressaoArterialDAO();
  });

  tearDown(() async {});

  test("Validar o valor da pressão arterial", () async {
    var pressaoArterial = 8;
    var resultado = await pressaoArterialDAO.validateValorPressaoArterial(pressaoArterial);
    expect(resultado, 'Pressão baixa!! tome um remédio');
  });
}

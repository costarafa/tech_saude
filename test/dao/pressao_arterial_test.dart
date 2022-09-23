import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:saude_tech/app/database/dao/pressao_arterial_dao.dart';
import 'package:saude_tech/app/domain/entities/pressao_arterial.dart';


import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  PressaoArterialDAO pressaoArterialDao;
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  setUp(() {
    pressaoArterialDao = const PressaoArterialDAO();
  });

  tearDown(() async {
    String path = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(path); // irá excluir o banco - não use na produção
  });

  test("Persistir no banco de dados pressão arterial", () async {
    var pressaoArterial = PressaoArterial(
        valorPressaoArterial: "150");
    var resultado = await pressaoArterialDao.salvar(pressaoArterial);
    expect(resultado, true);
  });

  test("Alterar um registro da pressão arterial do banco", () async {
    var pressaoArterial = PressaoArterial(
        id: 1,
         valorPressaoArterial: "160");
    var resultado = await pressaoArterialDao.alterar(pressaoArterial);
    expect(resultado, true);
  });

  test("Listar todos os valores de pressão arterial", () async {
    var resultado = await pressaoArterialDao.listarTodos();
    expect(resultado, isInstanceOf<List<PressaoArterial>>());
  });

  test('teste excluir pressão arterial', () async {
    var resultado = await pressaoArterialDao.excluir(1);
    expect(resultado, true);
  });
}

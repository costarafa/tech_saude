import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:saude_tech/app/database/dao/familia_dao.dart';

import 'package:saude_tech/app/domain/entities/familia.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
 FamiliaDao familiaDao;
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  setUp(() {
    familiaDao = const FamiliaDao();
  });

  tearDown(() async {
    String path = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(path); // irá excluir o banco - não use na produção
  });

  test("Persistir no banco de dados uma familia", () async {
    var familia =  Familia(
        nome: "Santos",
        descricao: "Familia Santos de Paranavaí");
    var resultado = await familiaDao.salvar(familia);
    expect(resultado, true);
  });

  test("Alterar um registro de uma familia do banco", () async {
    var familia =Familia(
        id: 1,
        nome: "Santos",
        descricao: "Familia Santos de Paranavaí Paraná");
    var resultado = await familiaDao.alterar(familia);
    expect(resultado, true);
  });

  test("Listar todos as familias", () async {
    var resultado = await familiaDao.listarTodos();
    expect(resultado, isInstanceOf<List<Familia>>());
  });

  test('teste excluir familia', () async {
    var resultado = await familiaDao.excluir(1);
    expect(resultado, true);
  });
}
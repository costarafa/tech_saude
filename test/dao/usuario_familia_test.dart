import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:saude_tech/app/database/dao/usuario_familia_dao.dart';

import 'package:saude_tech/app/domain/entities/usuario_familia.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  UsuarioFamiliaDao usuarioFamiliaDao;
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  setUp(() {
    usuarioFamiliaDao = const UsuarioFamiliaDao();
  });

  tearDown(() async {
    String path = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(path); // irá excluir o banco - não use na produção
  });

  test("Persistir no banco de dados uma usuario dentro de uma familia",
      () async {
    var usuarioFamilia = UsuarioFamilia(usuario_id: 1, familia_id: 1);
    var resultado = await usuarioFamiliaDao.salvar(usuarioFamilia);
    expect(resultado, true);
  });

  test("Listar todos as familias e seus usários", () async {
    var resultado = await usuarioFamiliaDao.listarTodos();
    expect(resultado, isInstanceOf<List<UsuarioFamilia>>());
  });

  test('teste excluir usuario_familia', () async {
    var resultado = await usuarioFamiliaDao.excluir(1);
    expect(resultado, true);
  });
}

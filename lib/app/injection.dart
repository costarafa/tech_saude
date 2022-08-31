import 'package:get_it/get_it.dart';
import 'package:saude_tech/app/database/sqlite/dao/glicemia_dao_impl.dart';
import 'package:saude_tech/app/domain/services/glicemiaService.dart';



setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<GlicemiaDAO>(GlicemiaDAOImpl());
  getIt.registerSingleton<GlicemiaService>(GlicemiaService());
}
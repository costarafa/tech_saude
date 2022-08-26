import 'package:get_it/get_it.dart';
import 'package:saude_tech/app/domain/entities/glicemia.dart';

class GlicemiaService{
  var _dao = GetIt.I.get<GlicemiaDAO>();

  save(Glicemia glicemia){
    _validateValorGlicemia(glicemia.valorGlicemia);
    _dao.save(glicemia);
    
  }

  remove(int id){
    _dao.remove(id);
  }

  //valor da glicemia precisa ser inteiro e obrigatorio
  
}
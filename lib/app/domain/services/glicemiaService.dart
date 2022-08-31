import 'package:get_it/get_it.dart';
import 'package:saude_tech/app/domain/entities/glicemia.dart';
import 'package:saude_tech/app/domain/exception/domain_layer_exception.dart';

class GlicemiaService{
  var _dao = GetIt.I.get<GlicemiaDAO>();

  save(Glicemia glicemia){
    validateValorGlicemia(glicemia.valorGlicemia);
    _dao.save(glicemia);    
  }

  remove(int id){
    _dao.remove(id);
  }

  Future<List<Glicemia>>find(){
    return _dao.find();
  }

  //valor da glicemia precisa ser inteiro e obrigatorio
  validateValorGlicemia(valorGlicemia){
    if(valorGlicemia == null){
      throw new DomainLayerException('O valor da glicemia é obrigatório');
    }  
  }
  
}
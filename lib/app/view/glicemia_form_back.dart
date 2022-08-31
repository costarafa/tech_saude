import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:saude_tech/app/domain/entities/glicemia.dart';
import 'package:saude_tech/app/domain/services/glicemiaService.dart';

class GlicemiaFormBack{
  Glicemia glicemia;
  var _service = GetIt.I.get<GlicemiaService>();
  bool _valorGlicemiaIsValid;

  bool get isValid => _valorGlicemiaIsValid;

  //fazer diferença entre alterar e criar
  GlicemiaFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    glicemia = (parameter == null) ? Glicemia(): parameter;
  }

  //salvar
  save() async{
    await _service.save(glicemia);
  }

  String validateValorGlicemia(String valorGlicemia){
    try{
      _service.validateValorGlicemia(valorGlicemia);
      _valorGlicemiaIsValid = true;
      return null;
    }catch(e){
      _valorGlicemiaIsValid = false;
      return e.toString();
    }
  }
}
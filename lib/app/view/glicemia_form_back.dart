import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:saude_tech/app/domain/entities/glicemia.dart';
import 'package:saude_tech/app/services/glicemiaService.dart';


class GlicemiaFormBack {
  Glicemia glicemia;
  var _service = GetIt.I.get<GlicemiaService>();
  bool _valorGlicemiaIsValid;

  bool get isValid => _valorGlicemiaIsValid;

  //fazer diferença entre alterar e criar
  GlicemiaFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    glicemia = (parameter == null) ? Glicemia() : parameter;
  }

  //salvar
  save() async {
    await _service.save(glicemia);
  }
}

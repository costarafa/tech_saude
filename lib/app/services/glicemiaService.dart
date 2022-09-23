import 'package:get_it/get_it.dart';
import 'package:saude_tech/app/domain/entities/glicemia.dart';
import 'package:saude_tech/app/domain/exception/domain_layer_exception.dart';
import 'package:saude_tech/app/domain/interfaces/glicemia_dao.dart';

class GlicemiaService {
  var _dao = GetIt.I.get<GlicemiaDAO>();

  save(Glicemia glicemia) {
    validateCamposNulosGlicemia(glicemia.valorGlicemia);
    _dao.save(glicemia);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Glicemia>> find() {
    return _dao.find();
  }

  //valor da glicemia precisa ser inteiro e obrigatorio
  validateCamposNulosGlicemia(valorGlicemia) {
    if (valorGlicemia == null) {
      throw new DomainLayerException('O valor da glicemia é obrigatório');
    }
    // A glicose de jejum entre 100 e 125 mg/ dL é chamada de glicemia de jejum alterada.
    //  A partir de 126 mg/dL já temos o diagnóstico de diabetes. Na glicose sem jejum, valores acima de
    // 140 mg/dL remetem ao diagnóstico de Intolerância à Glicose e acima de 200mg/dL, também temos o diagnóstico de diabetes
  }

  
}

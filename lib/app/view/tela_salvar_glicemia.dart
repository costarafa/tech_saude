import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/database/dao/glicemia_dao.dart';
import 'package:saude_tech/app/domain/entities/glicemia.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/input.dart';
import 'package:saude_tech/app/view/menu_lateral.dart';

class SalvarGlicemia extends StatefulWidget {
  const SalvarGlicemia({Key key}) : super(key: key);
  @override
  State<SalvarGlicemia> createState() => _SalvarGlicemiaState();
}
dynamic id;
String valor;
int valorGlicemia;
class _SalvarGlicemiaState extends State<SalvarGlicemia> {
  GlicemiaDAO glicemiaDAO = new GlicemiaDAO();

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object> glicemia = argumento as Map<String, Object>;
      id = glicemia['id'] as int;
      valor = glicemia['valorGlicemia'] as String;
    }
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
        appBar: AppBar(
          title: Text("Tech Saúde"),
          backgroundColor: Colors.green,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/menuLateral');
            },
            child: Icon(
              Icons.menu,
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CamposForm(
                      dica: "",
                      rotulo: "Valor Glicemia",
                      obscure: false,
                      valorInicial: "",
                      vincularValor: (value) =>
                          valor = value,
                      teclado: TextInputType.number),
                  SizedBox(
                    height: 30,
                  ),
                  Botao(
                      descricao: 'Salvar',
                      function: () {
                        glicemiaDAO.salvar(Glicemia(valorGlicemia: valor));
                        valorGlicemia = int.parse(valor);
                        if(valorGlicemia <= 70) {
                          Navigator.pushNamed(context, '/glicemiaBaixa');
                        } else if(valorGlicemia <= 99) {
                          Navigator.pushNamed(context, '/glicemiaNormal');
                        } else if(valorGlicemia >= 100) {
                          Navigator.pushNamed(context, '/glicemiaAlta');
                        } else {
                          Navigator.pushNamed(context, '/listarGlicemia');
                        }
                      },
                      color: Colors.green,
                      icon: Icon(Icons.save)
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "OBS: Se você for diabético (a) a recomendação dada pela Sociedade Brasileira de Diabetes é que seja feita 2h depois da refeição, para que seja utilizada como parâmetro de controle. Se não for, continua sendo recomendada 2h, pois antes disso pode haver interferência da dieta nos valores.",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ))),
        drawer: MenuLateral());
  }
}

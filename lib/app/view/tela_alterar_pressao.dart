import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/database/dao/pressao_arterial_dao.dart';
import 'package:saude_tech/app/domain/entities/pressao_arterial.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/input.dart';
import 'package:saude_tech/app/view/menu_lateral.dart';

class AlterarPressao extends StatefulWidget {
  const AlterarPressao({Key key}) : super(key: key);
  @override
  State<AlterarPressao> createState() => _AlterarPressaoState();
}
dynamic id;
String valor;
class _AlterarPressaoState extends State<AlterarPressao> {
  PressaoArterialDAO pressaoArterialDAO = new PressaoArterialDAO();

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object> pressao = argumento as Map<String, Object>;
      valor = pressao['valorPressaoArterial'] as String;
    }
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
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
                      rotulo: "Valor Pressão Arterial",
                      valorInicial: "",
                      vincularValor: (value) =>
                          valor = value,
                      teclado: TextInputType.number),
                  SizedBox(
                    height: 30,
                  ),
                  Botao(
                      descricao: 'Alterar',
                      function: () {
                        pressaoArterialDAO.alterar(PressaoArterial(valorPressaoArterial: valor));
                        Navigator.pushNamed(context, '/listarPressao');
                      },
                      color: Colors.green,
                      icon: Icon(Icons.save)),
                ],
              ),
            ))),
        drawer: MenuLateral());
  }
}

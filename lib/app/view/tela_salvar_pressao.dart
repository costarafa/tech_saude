import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/database/dao/pressao_arterial_dao.dart';
import 'package:saude_tech/app/domain/entities/pressao_arterial.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/input.dart';
import 'package:saude_tech/app/view/menu_lateral.dart';

class SalvarPressao extends StatefulWidget {
  const SalvarPressao({Key key}) : super(key: key);
  @override
  State<SalvarPressao> createState() => _SalvarPressaoState();
}
dynamic id;
String valor;
double valorPressaoArterial;
class _SalvarPressaoState extends State<SalvarPressao> {
  PressaoArterialDAO pressaoArterialDAO = new PressaoArterialDAO();

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object> pressao = argumento as Map<String, Object>;
      id = pressao['id'] as int;
      valor = pressao['valorPressaoArterial'] as String;
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
                      rotulo: "Valor Pressão Arterial",
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
                        pressaoArterialDAO.salvar(PressaoArterial(valorPressaoArterial: valor));
                        valorPressaoArterial = double.parse(valor);
                        if(valorPressaoArterial <= 9.6) {
                          Navigator.pushNamed(context, '/pressaoBaixa');
                        } else if(valorPressaoArterial <= 12.8) {
                          Navigator.pushNamed(context, '/pressaoNormal');
                        } else if(valorPressaoArterial >= 14.9) {
                          Navigator.pushNamed(context, '/pressaoAlta');
                        } else {
                          Navigator.pushNamed(context, '/listarPressao');
                        }
                      },
                      color: Colors.green,
                      icon: Icon(Icons.save)),
                ],
              ),
            ))),
        drawer: MenuLateral());
  }
}

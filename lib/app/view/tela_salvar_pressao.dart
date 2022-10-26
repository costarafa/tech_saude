import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/database/dao/pressao_arterial_dao.dart';
import 'package:saude_tech/app/domain/entities/pressao_arterial.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/input.dart';
import 'package:saude_tech/app/view/menuLateral.dart';

class SalvarPressao extends StatelessWidget {

  PressaoArterial pressaoArterial;
  PressaoArterialDAO pressaoArterialDAO = new PressaoArterialDAO();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CamposForm(
                      dica: "",
                      rotulo: "Valor Pressão Arterial",
                      valorInicial: "",
                      vincularValor: (value) => pressaoArterial.valorPressaoArterial = value,
                      teclado: TextInputType.number),
                  SizedBox(
                    height: 30,
                  ),
                  Botao(
                      descricao: 'Salvar',
                      function: () {
                        pressaoArterialDAO.salvar(pressaoArterial);
                        Navigator.pushNamed(context, '/listarPressao');
                      },
                      color: Colors.green,
                      icon: Icon(Icons.save)),
                ],
              ),
            )),
        drawer: MenuLateral());
  }
}

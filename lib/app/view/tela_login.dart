import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/cartao_generico.dart';
import 'package:saude_tech/app/view/componentes/input.dart';
import 'package:saude_tech/app/view/componentes/menuLateral.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _MenuDoisState();
}

class _MenuDoisState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bem vindo!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text(
                    "Por favor faça seu login:",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                 CamposForm(
                  dica: "Username ou email",
                  rotulo: "",
                  valorInicial: ""
                 ),
                  SizedBox(
                    height: 15,
                  ),
                  CamposForm(
                      dica: "Username ou email", rotulo: "", valorInicial: ""),
                  Botao(
                      descricao: 'Entrar',
                      function: () {
                        Navigator.pushNamed(context, '/');
                      },
                      color: Colors.black54,
                      icon: Icon(Icons.add_chart_sharp)),
                  SizedBox(
                    height: 20,
                  ),
              
                ],
              ),
            )),
        drawer: MenuLateral());
  }
}

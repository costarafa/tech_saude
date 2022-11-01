import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/cartao_generico.dart';
import 'package:saude_tech/app/view/componentes/input.dart';
import 'package:saude_tech/app/view/menuLateral.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _MenuDoisState();
}

class _MenuDoisState extends State<TelaCadastro> {
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
                  Text(
                    "Bem vindo!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text(
                    "Vamos criar sua conta:",
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CamposForm(
                      dica: "",
                      rotulo: "Email",
                      valorInicial: "",
                      teclado: TextInputType.emailAddress),
                  SizedBox(
                    height: 15,
                  ),
                  CamposForm(
                      dica: "",
                      rotulo: "Nome completo",
                      valorInicial: "",
                      teclado: TextInputType.name),
                  SizedBox(
                    height: 15,
                  ),
                  CamposForm(
                      dica: "",
                      rotulo: "Username",
                      valorInicial: "",
                      teclado: TextInputType.name),
                  SizedBox(
                    height: 15,
                  ),
                  CamposForm(
                      dica: "",
                      rotulo: "Senha",
                      valorInicial: "",
                      teclado: TextInputType.visiblePassword),
                  SizedBox(
                    height: 15,
                  ),
                  CamposForm(
                      dica: "",
                      rotulo: "Confirme a senha",
                      valorInicial: "",
                      teclado: TextInputType.visiblePassword),
                  SizedBox(
                    height: 30,
                  ),
                  Botao(
                      descricao: 'Cadastrar',
                      function: () {
                        Navigator.pushNamed(context, '/');
                      },
                      color: Colors.green,
                      icon: Icon(Icons.home)),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Possui conta?",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.left,
                  ),
                  ListTile(
                      title: Text(
                        'Log in',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () => {Navigator.pushNamed(context, '/login')}),
                ],
              ),
            ),
            ),
        drawer: MenuLateral());
  }
}

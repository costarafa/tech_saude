import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/cartao_generico.dart';
import 'package:saude_tech/app/view/componentes/input.dart';
import 'package:saude_tech/app/view/menuLateral.dart';

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
      resizeToAvoidBottomInset: true,
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Bem vindo!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text(
                    "Por favor faça seu login:",
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CamposForm(
                      dica: "", rotulo: "Email", valorInicial: "", teclado: TextInputType.emailAddress),
                  SizedBox(
                    height: 15,
                  ),
                  CamposForm(dica: "", rotulo: "Senha", valorInicial: "", teclado: TextInputType.visiblePassword),
                  SizedBox(
                    height: 30,
                  ),
                  Botao(
                      descricao: 'Entrar',
                      function: () {
                        Navigator.pushNamed(context, '/');
                      },
                      color: Colors.green,
                      icon: Icon(Icons.home)),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Não possui conta?     ",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.left,
                  ),
                  ListTile(
                    title: Text('Cadastre-se', textAlign: TextAlign.center,),
                    onTap: () => {Navigator.pushNamed(context, '/cadastro')}
                  ),
                ],
              ),
              )
            )),
        drawer: MenuLateral());
  }
}

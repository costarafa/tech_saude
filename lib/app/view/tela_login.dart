import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/services/validatorService.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/input.dart';
import 'package:saude_tech/app/view/menu_lateral.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _MenuDoisState();
}

class _MenuDoisState extends State<TelaLogin> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  Validator validator;
  String mensagem;
  String email;
  String senha;

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

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
                      dica: "",
                      rotulo: "Email",
                      teclado: TextInputType.emailAddress,
                      vincularValor: (text) {
                        email = text;
                        String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regExp = new RegExp(pattern);
                        if(email != null && !regExp.hasMatch(email)){
                          mensagem = "Email inválido";
                        }else {
                          return null;
                        }
                      },
                      controller: emailController),
                  SizedBox(
                    height: 15,
                  ),
                  CamposForm(
                      dica: "",
                      rotulo: "Senha",
                      teclado: TextInputType.visiblePassword,
                      controller: senhaController,
                      vincularValor: (text) {
                        senha = text;
                        String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regExp = new RegExp(pattern);
                        if(senha != null && !regExp.hasMatch(senha)){
                          mensagem = "Senha inválida";
                        }else {
                          return null;
                        }
                      } ,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Botao(
                      descricao: 'Entrar',
                      function: () {
                        if (email == null) {
                          mensagem = "Informe o Email";
                        }
                        else if (senha == null) {
                          mensagem = "Informe a senha";
                        } else if (mensagem == null){
                          mensagem = "Bem vindo!";
                        }
                        singIn();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(mensagem),
                        ));
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
                      title: Text(
                        'Cadastre-se',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () => {Navigator.pushNamed(context, '/cadastro')}),
                ],
              ),
            ))),
        drawer: MenuLateral());
  }

  Future singIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: senhaController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "Nenhum usuário encontrado para esse e-mail.";
      } else if (e.code == 'wrong-password') {
        return "Senha incorreta.";
      } else {
        return "Algo está errado! Tente novamente.";
      }
    }
  }
}

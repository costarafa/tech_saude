import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/database/dao/usuario_dao.dart';
import 'package:saude_tech/app/domain/entities/usuario.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/cartao_generico.dart';
import 'package:saude_tech/app/view/componentes/input.dart';
import 'package:saude_tech/app/view/menuLateral.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _MenuDoisState();
}
dynamic id;
String email;
String nome;
String cpf;
String senha;
String celular;
class _MenuDoisState extends State<TelaCadastro> {
  UsuarioDao usuarioDao = new UsuarioDao();
  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object> usuario = argumento as Map<String, Object>;
      id = usuario['id'] as int;
      nome = usuario['nome'] as String;
      email = usuario['email'] as String;
      senha = usuario['senha'] as String;
      cpf = usuario['cpf'] as String;
      celular = usuario['celular'] as String;
    }
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
                      vincularValor: (value) =>
                      email = value,
                      teclado: TextInputType.emailAddress),
                  SizedBox(
                    height: 15,
                  ),
                  CamposForm(
                      dica: "",
                      rotulo: "Nome completo",
                      valorInicial: "",
                      vincularValor: (value) =>
                      nome = value,
                      teclado: TextInputType.name),
                  SizedBox(
                    height: 15,
                  ),
                  CamposForm(
                      dica: "",
                      rotulo: "cpf",
                      valorInicial: "",
                      vincularValor: (value) =>
                      cpf = value,
                      teclado: TextInputType.number),
                  SizedBox(
                    height: 15,
                  ),
                  CamposForm(
                      dica: "",
                      rotulo: "Senha",
                      valorInicial: "",
                      vincularValor: (value) =>
                      senha = value,
                      teclado: TextInputType.visiblePassword),
                  SizedBox(
                    height: 15,
                  ),
                  CamposForm(
                      dica: "",
                      rotulo: "Celular",
                      valorInicial: "",
                      vincularValor: (value) =>
                      celular = value,
                      teclado: TextInputType.number),
                  SizedBox(
                    height: 30,
                  ),
                  Botao(
                      descricao: 'Cadastrar',
                      function: () {
                        usuarioDao.salvar(Usuario(nome: nome, email: email, telefone: celular, senha: senha, cpf: cpf));
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
                      onTap: () => {
                        Navigator.pushNamed(context, '/login')}
                  ),
                ],
              ),
            ),
            )
            ),
        drawer: MenuLateral());
  }
}

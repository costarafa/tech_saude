import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/cartao_listar_glicemia.dart';
import 'package:saude_tech/app/view/componentes/cartao_listar_pressao.dart';
import 'package:saude_tech/app/view/menuLateral.dart';
import 'package:saude_tech/app/view/menu_principal.dart';
import 'package:saude_tech/app/view/menu_responsivo_glicemia.dart';
import 'package:saude_tech/app/view/menu_responsivo_pressao.dart';
import 'package:saude_tech/app/view/pressao_arterial_form.dart';
import 'package:saude_tech/app/view/tela_cadastro.dart';
import 'package:saude_tech/app/view/tela_login.dart';
import 'package:saude_tech/app/view/tela_salvar_glicemia.dart';
import 'package:saude_tech/app/view/tela_salvar_pressao.dart';

void main() async {
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
      ),
      routes: {
        '/': (context) =>  MenuPrincipal(),
        '/login': (context) =>  TelaLogin(),
        '/cadastro': (context) =>  TelaCadastro(),
        '/menuLateral': (context) => MenuLateral(),
        '/listarGlicemia': (context) => ListarGlicemia(),
        '/listarPressao': (context) => ListarPressao(),
        '/cadastrarPressao': (context) => SalvarPressao(),
        '/cadastrarGlicemia': (context) => SalvarGlicemia(),
        // '/addUsuario': (context) => const AdicionarUsuario()
      },
    );
  }
}
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/cartao_listar_glicemia.dart';
import 'package:saude_tech/app/view/componentes/cartao_listar_pressao.dart';
import 'package:saude_tech/app/view/componentes/principal.dart';
import 'package:saude_tech/app/view/login.dart';
import 'package:saude_tech/app/view/menu_info_glicemia_alta.dart';
import 'package:saude_tech/app/view/menu_info_glicemia_baixa.dart';
import 'package:saude_tech/app/view/menu_info_glicemia_normal.dart';
import 'package:saude_tech/app/view/menu_info_pressao_alta.dart';
import 'package:saude_tech/app/view/menu_info_pressao_baixa.dart';
import 'package:saude_tech/app/view/menu_info_pressao_normal.dart';
import 'package:saude_tech/app/view/menu_lateral.dart';
import 'package:saude_tech/app/view/tela_alterar_pressao.dart';
import 'package:saude_tech/app/view/tela_cadastro.dart';
import 'package:saude_tech/app/view/tela_salvar_glicemia.dart';
import 'package:saude_tech/app/view/tela_salvar_pressao.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/': (context) =>  Principal(),
        '/login': (context) =>  Login(),
        '/cadastro': (context) =>  TelaCadastro(),
        '/menuLateral': (context) => MenuLateral(),
        '/listarGlicemia': (context) => ListarGlicemia(),
        '/listarPressao': (context) => ListarPressao(),
        '/cadastrarPressao': (context) => SalvarPressao(),
        '/alterarPressao': (context) => AlterarPressao(),
        '/cadastrarGlicemia': (context) => SalvarGlicemia(),
        '/glicemiaBaixa': (context) => MenuGlicemiaBaixa(),
        '/pressaoBaixa': (context) => MenuPressaoBaixa(),
        '/glicemiaNormal': (context) => MenuGlicemiaNormal(),
        '/pressaoNormal': (context) => MenuPressaoNormal(),
        '/glicemiaAlta': (context) => MenuGlicemiaAlta(),
        '/pressaoAlta': (context) => MenuPressaoAlta(),
      },
    );
  }
}
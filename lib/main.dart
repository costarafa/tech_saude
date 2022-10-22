import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/cartao_listar_pressao.dart';
import 'package:saude_tech/app/view/componentes/menuLateral.dart';
import 'package:saude_tech/app/view/menu_principal.dart';
import 'package:saude_tech/app/view/menu_responsivo_glicemia.dart';
import 'package:saude_tech/app/view/menu_responsivo_pressao.dart';
import 'package:saude_tech/app/view/pressao_arterial_form.dart';

void main() {
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
        '/menuLateral': (context) => MenuLateral(),
        '/listarGlicemia': (context) => MenuResponsivoGlicemia(),
        '/listarPressao': (context) => ListarPressao(),
        '/cadastrarPressao': (context) => PressaoForm(),
        // '/addUsuario': (context) => const AdicionarUsuario()
      },
    );
  }
}
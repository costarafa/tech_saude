import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/menuLateral.dart';
import 'package:saude_tech/app/view/menu_principal.dart';

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
        '/': (context) => const MenuPrincipal(),
        '/menuLateral': (context) => MenuLateral(),
        // '/addUsuario': (context) => const AdicionarUsuario()
      },
    );
  }
}
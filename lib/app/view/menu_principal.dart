import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';


class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({Key key}) : super(key: key);

  @override
  State<MenuPrincipal> createState() => _MenuDoisState();
}

class _MenuDoisState extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
          title: const Text('Menu'),
          actions: [
            IconButton(
                icon: const Icon(Icons.person),
                onPressed: () =>
                    Navigator.pushNamed(context, '/addUsuario'))
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Botao(
                    descricao: 'Pessão Arterial',
                    function: () {Navigator.pushNamed(context, '/');},
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Botao(
                    descricao: 'Glicemia',
                    function: () {Navigator.pushNamed(context, '/');},
                    color: Colors.pink,
                  ),
                ],
              ),
            )));
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/menuLateral.dart';


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
          title: Text("Tech Saúde"),
          backgroundColor: Colors.green,
          leading: GestureDetector(
            onTap: () {Navigator.pushNamed(context, '/menuLateral');},
            child: Icon(
              Icons.menu, 
            ),
          ),
          backgroundColor: Colors.blue,
          title: const Text('Menu'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, //remove this when you add image.
                ),
                child: CachedNetworkImage(
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  imageUrl: null,
                ),
              ),
            )
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
                    function: () {
                      Navigator.pushNamed(context, '/');
                    },
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Botao(
                    descricao: 'Glicemia',
                    function: () {
                      Navigator.pushNamed(context, '/');
                    },
                    color: Colors.pink,
                  ),
                ],
              ),
            )),
            drawer: MenuLateral());
  }
}

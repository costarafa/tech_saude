import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/database/dao/glicemia_dao.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/cartao_generico.dart';

import '../domain/entities/glicemia.dart';

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({Key key}) : super(key: key);

  @override
  State<MenuPrincipal> createState() => _MenuDoisState();
}

class _MenuDoisState extends State<MenuPrincipal> {
  GlicemiaDAO glicemiaDAO = new GlicemiaDAO();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
    return OrientationBuilder(builder: (context, orientation)
    {
      return Scaffold(
          appBar: AppBar(
            title: Text("Tech Saúde"),
            backgroundColor: Colors.green,
            leading: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/menuLateral');
              },
              child: Icon(
                Icons.menu,
              ),
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Olá" + user.displayName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "Bem vindo de volta!",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CartaoGenerico(
                      title: Text("VALOR: 180 MMHG"),
                    ),
                    CartaoGenerico(
                      title: Text("VALOR: 160 MMHG"),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Botao(
                        descricao: 'Pressão Arterial',
                        function: () {
                          Navigator.pushNamed(context, '/listarPressao');
                        },
                        color: Colors.black54,
                        icon: Icon(Icons.add_chart_sharp)),
                    SizedBox(
                      height: 20,
                    ),
                    CartaoGenerico(
                      title: Text("VALOR: 200 MH/DL"),
                    ),
                    CartaoGenerico(
                      title: Text("VALOR: 100 MH/DL"),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Botao(
                        descricao: 'Glicemia',
                        function: () {
                          Navigator.pushNamed(context, '/listarGlicemia');
                        },
                        color: Colors.black54,
                        icon: Icon(Icons.add_chart_sharp)),
                  ],
                ),
              )),

          ));
    });
  }
}

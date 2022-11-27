import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/cartao_generico.dart';

class MenuGlicemiaBaixa extends StatefulWidget {
  const MenuGlicemiaBaixa({Key key}) : super(key: key);

  @override
  State<MenuGlicemiaBaixa> createState() => _MenuMenuGlicemiaBaixa();
}

class _MenuMenuGlicemiaBaixa extends State<MenuGlicemiaBaixa> {
  @override
  Widget build(BuildContext context) {
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
                      "Cuidado!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "Sua glicemia está baixa!",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )),

          ));
    });
  }
}

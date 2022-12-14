import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/cartao_generico.dart';

class MenuGlicemiaNormal extends StatefulWidget {
  const MenuGlicemiaNormal({Key key}) : super(key: key);

  @override
  State<MenuGlicemiaNormal> createState() => _MenuMenuGlicemiaNormal();
}

class _MenuMenuGlicemiaNormal extends State<MenuGlicemiaNormal> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
                      "Parabéns!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "Sua glicemia está normal!",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Continue com os seus cuidados e não deixe de consultar o médico regularmente!",
                      style: TextStyle(fontSize: 20), textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Image.asset('assets/dicas-diabetes.png', width: 400, height: 500),
                    ),
                    SizedBox(
                      child: Image.asset('assets/dicas-prevenir-diabetes.png', width: 400, height: 400),
                    ),
                  ],
                ),
              )),

          ));
    });
  }
}

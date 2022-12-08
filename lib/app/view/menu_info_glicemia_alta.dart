import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saude_tech/app/view/componentes/botao.dart';
import 'package:saude_tech/app/view/componentes/cartao_generico.dart';

class MenuGlicemiaAlta extends StatefulWidget {
  const MenuGlicemiaAlta({Key key}) : super(key: key);

  @override
  State<MenuGlicemiaAlta> createState() => _MenuMenuGlicemiaAlta();
}

class _MenuMenuGlicemiaAlta extends State<MenuGlicemiaAlta> {
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
                      "Cuidado",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "Sua glicemia está alta",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Siga as orientações médicas para controlar. Em caso de mal estar recorrente procure um médico. Sintomas:",
                      style: TextStyle(fontSize: 20), textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Image.asset('assets/sintomas-hiper.png', width: 400, height: 400),
                    ),
                    SizedBox(
                      child: Image.asset('assets/dicas-hiperglicemia.png', width: 400, height: 500),
                    ),
                  ],
                ),
              )),

          ));
    });
  }
}

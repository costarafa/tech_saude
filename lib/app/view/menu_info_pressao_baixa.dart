import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuPressaoBaixa extends StatefulWidget {
  const MenuPressaoBaixa({Key key}) : super(key: key);

  @override
  State<MenuPressaoBaixa> createState() => _MenuMenuPressaoBaixa();
}

class _MenuMenuPressaoBaixa extends State<MenuPressaoBaixa> {
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
                      "Cuidado!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      "Sua pressão está baixa!",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Não esqueça de consultar um médico e seguir suas orientações. Sintomas:",
                      style: TextStyle(fontSize: 20), textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Image.asset('assets/sintomas-pressao-baixa.png', width: 400, height: 400),
                    ),
                  ],
                ),
              )),

          ));
    });
  }
}

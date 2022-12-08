import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuPressaoNormal extends StatefulWidget {
  const MenuPressaoNormal({Key key}) : super(key: key);

  @override
  State<MenuPressaoNormal> createState() => _MenuMenuPressaoNormal();
}

class _MenuMenuPressaoNormal extends State<MenuPressaoNormal> {
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
                      "Sua pressão está normal!",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Continue com os seus cuidados e não deixe de consultar o médico regularmente!",
                      style: TextStyle(fontSize: 20), textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      child: Image.asset('assets/dicas-pressao.png', width: 400, height: 400),
                    ),
                    SizedBox(
                      child: Image.asset('assets/dicas-previnir-pressao.jpg', width: 400, height: 400),
                    ),
                  ],
                ),
              )),

          ));
    });
  }
}

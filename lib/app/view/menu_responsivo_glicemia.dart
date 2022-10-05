import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/cartao_generico.dart';

class MenuResponsivoGlicemia extends StatefulWidget {
  const MenuResponsivoGlicemia({Key key}) : super(key: key);

  @override
  State<MenuResponsivoGlicemia> createState() => _MenuResponsivoGlicemiaState();
}

class _MenuResponsivoGlicemiaState extends State<MenuResponsivoGlicemia> {
  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(builder: (context, orientation) {
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
        body: GridView.count(
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
          childAspectRatio: (1 / .4),
          children: [
            CartaoGenerico(
              title: Text("VALOR: 180 MMHG"),
              subtitle: Text("30/09/2022"),
            ),
            CartaoGenerico(
              title: Text("VALOR: 160 MMHG"),
              subtitle: Text("30/09/2022"),
            ),
            CartaoGenerico(
              title: Text("VALOR: 200 MH/DL"),
              subtitle: Text("30/09/2022"),
            ),
            CartaoGenerico(
              title: Text("VALOR: 100 MH/DL"),
              subtitle: Text("30/09/2022"),
            )
          ],
        ),
        
      );
    });
  }
}

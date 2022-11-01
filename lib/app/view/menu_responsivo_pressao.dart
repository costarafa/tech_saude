import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/cartao_generico.dart';

class MenuResponsivoPressao extends StatefulWidget {
  const MenuResponsivoPressao({Key key}) : super(key: key);

  @override
  State<MenuResponsivoPressao> createState() => _MenuResponsivoPressaoState();
}

class _MenuResponsivoPressaoState extends State<MenuResponsivoPressao> {
  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tech Saúde"),
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/menuLateral');
              },
            )
          ],
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
            Text("Pressão Arterial"),
            SizedBox(
              height: 20,
            ),
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

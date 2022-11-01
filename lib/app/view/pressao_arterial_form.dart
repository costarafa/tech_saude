import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/cartao_generico.dart';

class PressaoForm extends StatefulWidget {
  const PressaoForm({Key key}) : super(key: key);

  @override
  State<PressaoForm> createState() => _PressaoFormState();
}

class _PressaoFormState extends State<PressaoForm> {
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
        body: Row(
          children: [
            Text("Pressão Arterial"),
            SizedBox(
              height: 20,
            ),

          ],
        )
      );
    });
  }
}

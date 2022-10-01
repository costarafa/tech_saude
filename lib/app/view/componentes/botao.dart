import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Botao extends StatelessWidget {
  String descricao;
  Function function;
  Color color;
  Icon icon;

  Botao({Key key, this.descricao, this.function, this.color, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        label: Text(this.descricao),
        icon: icon,
        onPressed: () {
          function();
        },
        style: ElevatedButton.styleFrom(
          primary: color,
          textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}

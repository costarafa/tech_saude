import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  String descricao;
  Function function;
  Color color;

  Botao({Key key, this.descricao, this.function, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        label: Text(this.descricao),
        icon: const Icon(Icons.add_circle),
        onPressed: () {
          function();
        },
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: const StadiumBorder(),
          textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
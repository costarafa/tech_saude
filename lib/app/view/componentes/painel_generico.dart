import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/botao_generico.dart';


class PainelGenerico extends StatelessWidget {
  final VoidCallback funcao;
  const PainelGenerico(
      {Key key, this.funcao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    return SizedBox(
      width: largura / 8,
      child: Row(
        children: [
          BotaoGenerico(
            funcao: funcao,
            icon: Icon(Icons.add_circle),
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

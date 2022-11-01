import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/painel_generico.dart';

// ignore: must_be_immutable
class CartaoGenerico extends StatelessWidget {
  Text title;
  Text subtitle;
  dynamic funcao;
  String leading;
  CartaoGenerico({Key key, this.title, this.subtitle, this.funcao, this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
        title: title,
        subtitle: subtitle,
        trailing: PainelGenerico(funcao: funcao,),
    ));
  }
}

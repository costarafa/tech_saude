import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BotaoGenerico extends StatelessWidget {
  final VoidCallback funcao;
  Icon icon;
  Color color;
  BotaoGenerico({Key key, this.funcao, this.icon, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      color: color,
      onPressed: funcao,
    );
  }
}

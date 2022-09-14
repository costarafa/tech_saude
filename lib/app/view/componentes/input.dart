import 'package:flutter/material.dart';

class CamposForm extends StatelessWidget {
  String rotulo;
  String dica;
  ValueChanged<String> vincularValor;
  String valorInicial;
  TextInputType teclado;

  CamposForm(
      {Key key,
       this.rotulo,
       this.dica,
       this.vincularValor,
       this.valorInicial,
       this.teclado})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          decoration: InputDecoration(label: Text(rotulo), hintText: dica),
          onChanged: vincularValor,
          initialValue: valorInicial,
          keyboardAppearance: Brightness.dark,
          keyboardType: teclado,
        ));
  }
}

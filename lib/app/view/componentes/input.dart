import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CamposForm extends StatelessWidget {
  String rotulo;
  String dica;
  ValueChanged<String> vincularValor;
  String valorInicial;
  TextInputType teclado;
  TextEditingController controller;
  bool obscure;
  FormFieldValidator<String> validador;
  FormFieldSetter<String> save;

  CamposForm(
      {Key key,
       this.rotulo,
       this.dica,
       this.vincularValor,
       this.valorInicial,
       this.teclado,
        this.controller,
        this.obscure,
        this.validador,
        this.save})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          decoration: InputDecoration(label: Text(rotulo), hintText: dica, border: OutlineInputBorder(),),
          onChanged: vincularValor,
          initialValue: valorInicial,
          keyboardAppearance: Brightness.dark,
          keyboardType: teclado,
          controller: controller,
          validator: validador,
          onSaved: save,
          obscureText: obscure,
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlicemiaForm extends StatelessWidget{
final _form = GlobalKey<FormState>();

    Widget fieldValorGlicemia(GlicemiaFormBack back){
      return TextFormField(
        validator: back.validateValorGlicemia,
        onSaved:(newValue) => back.glicemia.valorGlicemia = newValue,
        initialValue: back.glicemia.valorGlicemia,
        decoration: InputDecoration(
          labelText: 'Valor Da Glicemia'
        ),
      );
    }
}
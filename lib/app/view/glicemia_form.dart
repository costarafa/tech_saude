import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'glicemia_form_back.dart';

class GlicemiaForm extends StatelessWidget{
final _form = GlobalKey<FormState>();

    Widget fieldValorGlicemia(GlicemiaFormBack back){
      return TextFormField(
        validator: back.validateValorGlicemia,
        onSaved: (newValue) => back.glicemia.valorGlicemia = newValue,
        initialValue: back.glicemia.valorGlicemia,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Valor Da Glicemia'
        ),
      );
    }
}
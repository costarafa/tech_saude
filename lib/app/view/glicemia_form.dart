import 'package:flutter/material.dart';

import 'glicemia_form_back.dart';

class GlicemiaForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldValorGlicemia(GlicemiaFormBack back) {
    return TextFormField(
      //validator: back.validateValorGlicemia,
      onSaved: (newValue) => back.glicemia.valorGlicemia = int.parse(newValue),
      initialValue: back.glicemia.valorGlicemia.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Valor Da Glicemia'),
    );
  }

  Widget build(BuildContext context) {
    var _back = GlicemiaFormBack(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                if (_back.isValid) {
                  _back.save();
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
    );
    body:
    Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _form,
        child: Column(
          children: [fieldValorGlicemia(_back)],
        ),
      ),
    );
  }
}

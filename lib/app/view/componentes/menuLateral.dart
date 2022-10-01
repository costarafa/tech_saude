import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/cartao_email.dart';
import 'package:saude_tech/app/view/componentes/cartao_nome.dart';
import 'package:saude_tech/app/view/componentes/meu_avatar.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          MeuAvatar(),
          SizedBox(
            height: 20,
          ),
          CartaoNome(),
          SizedBox(
            height: 20,
          ),
          CartaoEmail(),
          ListTile(
            leading: Icon(Icons.escalator_warning_outlined),
            title: Text('Família'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.add_circle),
            title: Text('Glicemia'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.add_circle),
            title: Text('Pressão Arterial'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () => {Navigator.pop(context)},
          ),
          
        ],
      ),
    );
  }
}
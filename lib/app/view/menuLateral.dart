import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/cartao_email.dart';
import 'package:saude_tech/app/view/componentes/cartao_nome.dart';
import 'package:saude_tech/app/view/componentes/meu_avatar.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
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
          CartaoEmail(email: user.email,),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => { Navigator.pushNamed(context, '/')},
          ),
          ListTile(
            leading: Icon(Icons.escalator_warning_outlined),
            title: Text('Família'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.add_circle),
            title: Text('Glicemia'),
            onTap: () => { Navigator.pushNamed(context, '/listarGlicemia')},
          ),
          ListTile(
            leading: Icon(Icons.add_circle),
            title: Text('Pressão Arterial'),
            onTap: () => { Navigator.pushNamed(context, '/listarPressao')},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, '/login');
              },
          ),
          
        ],
      ),
    );
  }
}
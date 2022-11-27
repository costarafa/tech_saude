

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/menu_principal.dart';
import 'package:saude_tech/app/view/tela_login.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          return Center(child: Text("Algo deu errado, tente novamente!"));
        } else if (snapshot.hasData) {
          return MenuPrincipal();
        } else {
          return TelaLogin();
        }
      },
    ),
  );

}

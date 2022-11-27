import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/login.dart';
import 'package:saude_tech/app/view/menu_principal.dart';

class Principal extends StatelessWidget {
  const Principal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return MenuPrincipal();
        } else {
          return Login();
        }
      },
    ),
  );
}

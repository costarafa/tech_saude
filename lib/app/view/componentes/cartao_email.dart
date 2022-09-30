import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/painel_email.dart';
import 'package:url_launcher/url_launcher.dart';

class CartaoEmail extends StatelessWidget {
  const CartaoEmail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: const Text('E-mail'),
          subtitle: const Text('adrieli@gmail.com'),
          trailing: PainelEmail(
            funcaoEmail: chamarEmail
          )),
    );
  }

  chamarEmail() {
    String email = 'adrieli@gmail.com';
    String subject = 'Relatório de glicemia';
    String body = 'Relatório mensal de glicemia';   

    String emailUrl = "mailto:$email?subject=$subject&body=$body";

    // ignore: deprecated_member_use
    if ( canLaunch(emailUrl) != null) {
       // ignore: deprecated_member_use
       launch(emailUrl);
    } else {
      throw "Error occured sending an email";
    }
  }
  

}

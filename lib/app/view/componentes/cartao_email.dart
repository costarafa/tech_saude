import 'package:flutter/material.dart';
import 'package:saude_tech/app/database/dao/glicemia_dao.dart';
import 'package:saude_tech/app/domain/entities/glicemia.dart';
import 'package:saude_tech/app/view/componentes/painel_email.dart';
import 'package:url_launcher/url_launcher.dart';

class CartaoEmail extends StatelessWidget {
  String email;
   CartaoEmail({Key key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: const Text('E-mail'),
          subtitle: Text(email),
          trailing: PainelEmail(
            funcaoEmail: chamarEmail
          )),
    );
  }

  chamarEmail() {
    GlicemiaDAO glicemiaDAO = new GlicemiaDAO();
    Glicemia glicemia = new Glicemia();
    String email = 'adrielikethin.dossantos@gmail.com';
    String subject = 'Relatório de glicemia';
    String body = 'Relatório mensal de glicemia ' + glicemiaDAO.listarTodos().toString();

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

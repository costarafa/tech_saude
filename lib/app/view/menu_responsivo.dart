import 'package:flutter/material.dart';
import 'package:saude_tech/app/view/componentes/cartao_email.dart';
import 'package:saude_tech/app/view/componentes/cartao_generico.dart';
import 'package:saude_tech/app/view/componentes/cartao_nome.dart';
import 'package:saude_tech/app/view/componentes/meu_avatar.dart';

import 'componentes/botao.dart';

class MenuResponsivo extends StatefulWidget {
  const MenuResponsivo({Key key}) : super(key: key);

  @override
  State<MenuResponsivo> createState() => _MenuResponsivoState();
}

class _MenuResponsivoState extends State<MenuResponsivo> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        body: GridView.count(
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 4,
          children: [
            MeuAvatar(),
            CartaoNome(),
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
    });
  }
}

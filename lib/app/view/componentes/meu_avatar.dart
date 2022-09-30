import 'package:flutter/cupertino.dart';
import 'package:saude_tech/app/view/componentes/avatar.dart';

class MeuAvatar extends StatelessWidget {
  const MeuAvatar({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Avatar(
      urlImagem: 'https://camo.githubusercontent.com/cc1b2b7702cbb4080ef9274edd33800859c83f4e2a5555df34edf569c3de39da/68747470733a2f2f63646e2e646973636f72646170702e636f6d2f6174746163686d656e74732f313030353133383136303836383636333332382f313030353133383231363738323933343134372f646f776e6c6f616432303232303830353132333435332e706e67',
    );
  }
}
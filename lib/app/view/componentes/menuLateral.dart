import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
           accountName: Text("Adrieli"),
           accountEmail: Text("adrieli@gmail.com.com"),
           currentAccountPicture: CircleAvatar(
             backgroundColor:
             Theme.of(context).platform == TargetPlatform.iOS
                   ? Colors.green: Colors.white,
               child: Text("M", style: 
                    TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
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
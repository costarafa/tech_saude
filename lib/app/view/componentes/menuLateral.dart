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
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.pop(context)},
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../drawer/profile_view.dart';
import '../drawer/settings_view.dart';
import '../drawer/help_view.dart';
import '../drawer/about_view.dart';
import '../photo/photo_view.dart';
import '../todo/todo_view.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            radius: 60,
            child: Icon(
              Icons.face,
              size: 60,
            ),
          ),
          accountName: Text('Your Account Name'),
          accountEmail: Text('yourname@email.com'),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('User Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return ProfileView();
                      },
                    ),
                  ).then((value) => print(value.toString()));
                  print('Tapped');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('App Settings'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return SettingsView();
                    }),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Photo'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return PhotoView();
                    }),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.today),
                title: Text('Todo'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return TodoView();
                    }),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return HelpView();
                    }),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('About'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return AboutView();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

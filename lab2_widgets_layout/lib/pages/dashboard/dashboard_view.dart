import 'package:flutter/material.dart';
import 'package:lab2_widgets_layout/pages/drawer/profile_view.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard View'),
      ),
      drawer: Drawer(
        child: Column(
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
                    leading: Icon(Icons.info),
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
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}

import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                'Sound',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.volume_up),
              title: Text('Sound'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                'Display',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.font_download),
              title: Text('Font'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.format_size),
              title: Text('Size'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                'Language',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

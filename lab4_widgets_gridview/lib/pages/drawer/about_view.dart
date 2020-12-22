import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                'About this application',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(left: 5, right: 5, top: 20),
              child: Text(
                'This is a demo application made by Huynh Vinh-Nam',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

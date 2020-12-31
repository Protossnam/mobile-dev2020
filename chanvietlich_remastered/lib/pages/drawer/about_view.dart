import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  static final routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('About')),
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ));
  }
}

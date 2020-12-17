import 'package:flutter/material.dart';

class UserInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Card(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  'User Information',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.location_on_rounded),
                      title: Text('Location'),
                      subtitle: Text('Hanoi'),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Email'),
                      subtitle: Text('protossnamjune2nd@gmail.com'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Phone'),
                      subtitle: Text('097 666 04 87'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('About me'),
                      subtitle: Text('I am a Data scientist'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

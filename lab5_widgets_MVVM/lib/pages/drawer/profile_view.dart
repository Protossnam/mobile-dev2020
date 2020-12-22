import 'package:flutter/material.dart';

import 'widgets/user_info_view.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Drawer(),
      appBar: AppBar(
        title: Text('Profile View'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Navigator.of(context).pop(['OK']);
              })
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/rog.jpg'), fit: BoxFit.fill),
                  ),
                  height: 300,
                  //color: Colors.deepOrangeAccent,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 60,
                          child: Icon(
                            Icons.face,
                            size: 120,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .apply(color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'consectetur adipisicing elit',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 260),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 100,
                  width: double.infinity,
                  child: Card(
                      color: Colors.white,
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Photos',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                Text('5,000')
                              ]),
                          VerticalDivider(
                            thickness: 1,
                            color: Color(0xFFF6F4F4),
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                Text('5,000')
                              ]),
                          VerticalDivider(
                            thickness: 1,
                            color: Color(0xFFF6F4F4),
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Favorites',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                Text('5,000')
                              ]),
                        ],
                      )),
                ),
              ],
            ),
            UserInfoView(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class UserInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          drawer: Drawer(),
          appBar: AppBar(
            title: Text('App Title'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('Search action');
                },
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  print('More action');
                },
              ),
            ],
          ),
          body: SafeArea(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      color: Colors.deepOrangeAccent,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}

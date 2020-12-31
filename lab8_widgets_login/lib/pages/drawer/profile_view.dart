import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../app/app_auth.dart';
import '../../pages/startup/startup_view.dart';
import 'profile_view_model.dart';

class ProfileView extends StatelessWidget {
  static final routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => AppAuth.instance.appUser == null
          ? StartupView()
          : Scaffold(
              appBar: AppBar(
                title: Text(model.title),
                actions: [
                  IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () async {
                      await AppAuth.instance.signOut().then(
                        (value) {
                          if (value)
                            Navigator.of(context)
                                .pushNamed(StartupView.routeName);
                        },
                      );
                    },
                  )
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
                              image:
                                  Image.asset('assets/lake.jpg').image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 300,
                          //color: Colors.deepOrangeAccent,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              alignment: Alignment.topCenter,
                              child: CircleAvatar(
                                radius: 60,
                                child: Icon(
                                  Icons.face,
                                  size: 120,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              AppAuth.instance.appUser.displayName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              AppAuth.instance.appUser.email,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .apply(color: Colors.white70),
                            ),
                          ],
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
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Photos',
                                      style: TextStyle(
                                          color: Colors.black54),
                                    ),
                                    Text(
                                      '5,000',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Followers',
                                      style: TextStyle(
                                          color: Colors.black54),
                                    ),
                                    Text(
                                      '5,000',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Favorites',
                                      style: TextStyle(
                                          color: Colors.black54),
                                    ),
                                    Text(
                                      '5,000',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Card(
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "User Information",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black38,
                                  ),
                                  Container(
                                      child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        contentPadding:
                                            EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 4),
                                        leading: Icon(Icons.my_location),
                                        title: Text("Location"),
                                        subtitle: Text("Kathmandu"),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.email),
                                        title: Text("Email"),
                                        subtitle: Text(AppAuth
                                            .instance.appUser.email),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.phone),
                                        title: Text("Phone"),
                                        subtitle: Text(AppAuth.instance
                                            .appUser.phoneNumber),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.person),
                                        title: Text("About Me"),
                                        subtitle: Text(
                                            "This is a about me link and you can khow about me in this section."),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}

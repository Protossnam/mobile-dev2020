import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app_auth.dart';
import '../../../pages/login/login_view.dart';
import '../../home/home_view_model.dart';
import '../settings_view.dart';
import '../about_view.dart';
import '../help_view.dart';
import '../profile_view.dart';
import '../privacy_policy_view.dart';
import '../terms_of_service_view.dart';

class DrawerView extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Column(
      children: [
        AppAuth.instance.appUser != null
            ? UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.face,
                    size: 60,
                  ),
                ),
                accountName: Text(AppAuth.instance.appUser.displayName),
                accountEmail: Text(AppAuth.instance.appUser.email),
              )
            : Container(
                height: 150,
                color: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 44),
                        child: Text(
                          'You are not logged in',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .apply(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OutlineButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return LoginView();
                                  },
                                  fullscreenDialog: true,
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.login,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .apply(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
        SingleChildScrollView(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              ListTile(
                enabled: AppAuth.instance.appUser != null,
                leading: Icon(Icons.account_circle),
                title: Text('User Profile'),
                onTap: () {
                  //Navigator.of(context).pop();
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (_) {
                            return ProfileView();
                          },
                          fullscreenDialog: true,
                        ),
                      )
                      .then((value) => print(value.toString()));
                  print('tapped');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings_applications_outlined),
                title: Text('App Settings'),
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return SettingsView();
                      },
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text('Terms of service'),
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return TermsOfServiceView();
                      },
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text('Privacy policy'),
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return PrivacyPolicyView();
                      },
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help'),
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) {
                          return HelpView();
                        },
                        fullscreenDialog: true),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('About'),
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) {
                          return AboutView();
                        },
                        fullscreenDialog: true),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

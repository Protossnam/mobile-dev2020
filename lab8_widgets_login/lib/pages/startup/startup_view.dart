import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../pages/home/home_view.dart';
import '../../pages/login/login_view.dart';
import 'startup_view_model.dart';

class StartupView extends StatelessWidget {
  static final routeName = '/';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady: (model) async => await model.init(),
      builder: (context, model, _) {
        switch (model.authStatus) {
          case AuthStatus.notSignedIn:
            return LoginView();
          case AuthStatus.signedIn:
          case AuthStatus.guest:
            return HomeView();
          default:
            return Scaffold(
              body: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 60),
                    child: Center(
                      child: Text(
                        'MyApp',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: model.isBusy,
                    child: Center(
                      child: LinearProgressIndicator(),
                    ),
                  ),
                ],
              ),
            );
        }
      },
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}

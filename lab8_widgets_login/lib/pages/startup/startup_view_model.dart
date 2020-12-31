import 'package:stacked/stacked.dart';

import '../../app/app_auth.dart';

enum AuthStatus { loading, notSignedIn, signedIn, guest }

class StartupViewModel extends BaseViewModel {
  final title = 'Startup';

  AuthStatus authStatus = AuthStatus.loading;

  Future init() async {
    setBusy(true);
    Future.delayed(Duration(seconds: 1)).then((value) {
      if (AppAuth.instance.appUser != null) {
        authStatus = AuthStatus.signedIn;
      } else if (AppAuth.instance.loginRequired) {
        authStatus = AuthStatus.notSignedIn;
      } else {
        authStatus = AuthStatus.guest;
      }
      setBusy(false);
    });
  }
}

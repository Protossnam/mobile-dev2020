import 'package:stacked/stacked.dart';

import '../../app/app_local_store.dart';
import '../../app/app_auth.dart';
import '../../app/app_user_model.dart';

enum LoginViewType { login, reset, signup }

class LoginViewModel extends BaseViewModel {
  final title = 'Login';

  var _viewType = LoginViewType.login;

  LoginViewType get viewType => _viewType;
  set viewType(value) {
    _viewType = value;
    notifyListeners();
  }

  var _emails = <String>[];
  List<String> get emails => _emails;

  String email;
  String password;

  Future init() async {
    setBusy(true);
    _emails = AppLocalStore.instance.getStringList('emails') ?? [];
    setBusy(false);
  }

  Future<AppUser> login() async {
    setBusy(true);
    return await AppAuth.instance
        .loginWithEmailAndPassword(email, password)
        .then((value) {
      setBusy(false);
      print(value.toString());
      return value;
    });
  }

  Future<AppUser> reset() async {
    setBusy(true);
    return await AppAuth.instance.resetWithEmail(email).then((value) {
      setBusy(false);
      return value;
    });
  }

  Future<AppUser> signup() async {
    setBusy(true);
    return await AppAuth.instance
        .signupWithEmailAndPassword(email, password)
        .then((value) {
      setBusy(false);
      return value;
    });
  }
}

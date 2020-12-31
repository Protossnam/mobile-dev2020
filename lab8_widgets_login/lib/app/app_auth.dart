import 'package:firebase_auth/firebase_auth.dart';

import 'app_local_store.dart';
import 'app_user_model.dart';

extension ExtUser on User {
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}

/// A singleton like a global variable
class AppAuth {
  AppAuth._init();

  static final AppAuth _manager = AppAuth._init();
  static AppAuth get instance => _manager;

  AppUser _appUser;
  AppUser get appUser => _appUser;

  bool loginRequired = false; // true - to require the user to login

  Future<AppUser> init() async {
    print('Preparing to init AppAuth...');
    var appUserJson = AppLocalStore.instance.prefs.getString('appUser');
    if (appUserJson != null)
      _appUser = AppUser.fromJson(appUserJson);
    else
      _appUser = null;
    print('AppAuth init: ${_appUser?.toString()}');
    return _appUser;
  }

  Future<AppUser> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    print('Preparing to loginWithEmailAndPassword...');
    return await Future.delayed(Duration(seconds: 3)).then((value) async {
      _appUser = AppUser.fromMap({
        'id': '1234',
        'displayName': 'Trần Trung Chuyên',
        'phoneNumber': '0983448779',
        'email': email
      });
      print('loginWithEmailAndPassword: ${_appUser != null}');
      await _appUser.saveSession();
      return _appUser;
    });
  }

  Future<AppUser> resetWithEmail(String email) async {
    print('Preparing to resetWithEmail...');
    return await Future.delayed(Duration(seconds: 3)).then((value) {
      print('resetWithEmail');
      return null;
    });
  }

  Future<AppUser> signupWithEmailAndPassword(
    String email,
    String password,
  ) async {
    if (email == null) {
      print('Email = null');
      return null;
    }
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      _appUser = AppUser.fromMap(userCredential.user.toMap());
      print('loginWithEmailAndPassword: ${_appUser != null}');
      await _appUser.saveSession();
      return _appUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    /*
    print('Preparing to signupWithEmailAndPassword...');
    return await Future.delayed(Duration(seconds: 3)).then((value) {
      _appUser = AppUser.fromMap({
        'id': '1234',
        'displayName': 'Trần Trung Chuyên',
        'phoneNumber': '0983448779',
        'email': email
      });
      print('signupWithEmailAndPassword: ${_appUser != null}');
      _appUser.saveSession();
      return _appUser;
    });
    */
  }

  Future<bool> signOut() async {
    print('Preparing to signOut...');
    var result = await _appUser.removeSession();
    if (result) _appUser = null;
    print('signOut: ${_appUser == null}');
    return result;
  }
}

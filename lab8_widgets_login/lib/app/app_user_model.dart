import 'dart:convert';

import 'app_local_store.dart';

class AppUser {
  final String uid;
  final String displayName;
  final String phoneNumber;
  final String email;

  AppUser({this.uid, this.displayName, this.phoneNumber, this.email});

  AppUser copyWith(
      {String uid,
      String displayName,
      String phoneNumber,
      String email}) {
    return AppUser(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return AppUser(
      uid: map['uid'],
      displayName: map['displayName'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  /// Storing user information in local
  Future<bool> saveSession() async {
    print('Preparing to SaveSession...');
    var result = await AppLocalStore.instance.prefs
        .setString('appUser', toJson());
    print('SaveSession: $result');
    if (result)
      await AppLocalStore.instance.setStringList('emails', email);
    return result;
  }

  /// Removing user information from local
  Future<bool> removeSession() async {
    print('Preparing to removeSession...');
    var result = await AppLocalStore.instance.prefs.remove('appUser');
    print('removeSession: $result');
    return result;
  }

  @override
  String toString() {
    return 'AppUser(uid: $uid, displayName: $displayName, phoneNumber: $phoneNumber, email: $email)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppUser &&
        o.uid == uid &&
        o.displayName == displayName &&
        o.phoneNumber == phoneNumber &&
        o.email == email;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        displayName.hashCode ^
        phoneNumber.hashCode ^
        email.hashCode;
  }
}

import 'package:shared_preferences/shared_preferences.dart';

import 'app_auth.dart';

/// Singleton class to persistent store for simple data
class AppLocalStore {
  AppLocalStore._init();

  static final _instance = AppLocalStore._init();
  static AppLocalStore get instance => _instance;

  SharedPreferences _prefs;
  SharedPreferences get prefs => _prefs;

  Future<bool> init() async {
    print('Preparing to init AppLocalStore...');
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
    print('AppLocalStore initialized: ${_prefs != null}');
    await AppAuth.instance.init();
    return _prefs != null;
  }

  Future<bool> setStringList(String key, String value,
      [int max = 5]) async {
    print('Preparing to insertString... $value');

    if (_prefs == null) return false;

    var _items = _prefs.getStringList(key)?.toSet();
    if (_items == null) {
      _items = {};
    }
    if (_items.length >= max) _items = _items.take(4);
    _items.add(value);
    var result = await _prefs.setStringList(key, _items.toList());
    return result;
  }

  List<String> getStringList(String key) {
    var _items = _prefs.getStringList(key)?.toSet();
    _items?.removeWhere((element) => element == null);
    return _items?.toList();
  }
}

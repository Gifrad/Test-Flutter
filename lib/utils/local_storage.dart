import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<SharedPreferences> _pref() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref;
  }

  void saveToLocalStorage(String value) async {
    final pref = await _pref();
    await pref.setString('email', value);
  }

  Future<String?> getLocalSotrage() async {
    final pref = await _pref();
    final value = pref.getString('email');
    return value;
  }

  void removeLocalStorage() async {
    final pref = await _pref();
    await pref.remove('email');
  }
}

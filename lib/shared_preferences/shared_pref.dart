import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  //static String skipped = 'skipped';
  //static bool isSkipped = false;
  // static SharedPreferences _sharedPreference;
  // init() async {
  //   if (_sharedPreference == null) {
  //     _sharedPreference = await SharedPreferences.getInstance();
  //   }
  // }

  static storePref(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    //var pref = _sharedPreference;
    //isSkipped = true;
    pref.setBool('skipped', value);
  }

  static getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isSkipped = pref.getBool('skipped') ?? false;
    return isSkipped;
  }
}

import 'package:shared_preferences/shared_preferences.dart';

enum AppPreferences {
  language,
  countryCode,
  recentSearch,
  accessToken,
  asGuest,
  showWelcome,
}

class SharedStorage {

	Future getData(pref, prefDefault) async {
		return (await SharedPreferences.getInstance()).get(pref.toString()) ?? prefDefault;
	}

  Future<bool> setData(pref, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value is String) {
      return prefs.setString(pref.toString(), value);
    }
    if (value is int) {
      return prefs.setInt(pref.toString(), value);
    }
    if (value is bool) {
      return prefs.setBool(pref.toString(), value);
    }
    if (value is double) {
      return prefs.setDouble(pref.toString(), value);
    }
    if (value is List) {
      return prefs.setStringList(pref.toString(), value);
    }

    return null;
  }
  
}
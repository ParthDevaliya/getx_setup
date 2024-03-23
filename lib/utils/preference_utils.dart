import 'package:shared_preferences/shared_preferences.dart';

import 'preference_constant.dart';

const String authToken = "authToken";

class PreferenceUtils {
  static final PreferenceUtils _preferenceUtils = PreferenceUtils._internal();

  factory PreferenceUtils() {
    return _preferenceUtils;
  }

  PreferenceUtils._internal();

  Future<bool> setPreference(String key, var value) async {
    SharedPreferences preferences = await _getSharedPreference();
    if (value is String) {
      return preferences.setString(key, value);
    } else if (value is bool) {
      return preferences.setBool(key, value);
    } else if (value is double) {
      return preferences.setDouble(key, value);
    } else if (value is int) {
      return preferences.setInt(key, value);
    } else if (value is List<String>) {
       return preferences.setStringList(key, value);
    }
    return false;
  }



  Future<String?> getStringPreference(String key) async {
    SharedPreferences preferences = await _getSharedPreference();
    return preferences.getString(key);
  }

  Future<bool> getBoolPreference(String key) async {
    SharedPreferences preferences = await _getSharedPreference();
    return preferences.getBool(key) ?? false;
  }

  Future<int> getIntPreference(String key) async {
    SharedPreferences preferences = await _getSharedPreference();
    return preferences.getInt(key) ?? 0;
  }

  Future<double> getDoublePreference(String key) async {
    SharedPreferences preferences = await _getSharedPreference();
    return preferences.getDouble(key) ?? 0;
  }

  Future<Object> getListPreference(String key) async {
    SharedPreferences preferences = await _getSharedPreference();
    return preferences.getStringList(key) ?? 0;
  }


  Future<SharedPreferences> _getSharedPreference() async {
    return SharedPreferences.getInstance();
  }

  Future removeAllData() async {
    SharedPreferences preferences = await _getSharedPreference();
    await preferences.clear();
  }

  Future<String?> getToken() async {
    return getStringPreference(authToken);
  }

  Future<Object> getClearDriverLocList() async {
    SharedPreferences preferences = await _getSharedPreference();
    return preferences.remove(PreferenceConstant.driverLocList);
  }


  Future logOut() async {
    SharedPreferences preferences = await _getSharedPreference();
    await preferences.remove(PreferenceConstant.apiToken);
    await preferences.remove(PreferenceConstant.isDispatchLogIn);
    await preferences.remove(PreferenceConstant.isFloristLogIn);
    // Get.offAllNamed(AppRoutes.loginScreen);
  }
}

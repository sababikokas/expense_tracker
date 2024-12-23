

import 'package:expense_tracker/common_functions/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'shared_preference_constants.dart';

// Class to manage shared preferences
class SharedPreferenceHelper {
  // Shared preferences instance
  SharedPreferences? _preferences;

  // Private constructor
  SharedPreferenceHelper._internal(){
    // Initialize the preferences
    init();
  }

  // Singleton instance
  static final SharedPreferenceHelper _singleton =
      SharedPreferenceHelper._internal();

  // Get the singleton instance
  factory SharedPreferenceHelper() => _singleton;

  // Initialize the preferences
  init() async => _preferences = await SharedPreferences.getInstance();

  // Clear all preferences
  Future<bool?> clearPreferenceValues() async {
    return await _preferences?.clear();
  }

  // Set string value
  Future<bool> setStringValue(String key, String? value) async {
    // Set the string value, if null then set the empty string
    return await _preferences?.setString(
            key, value ?? AppStrings.emptyString) ??
        false;
  }

  // Get string value
  String getStringValue(String key) {
    // Get the string value, if null then get the empty string
    return _preferences?.getString(key) ?? AppStrings.emptyString;
  }

  // Set int value
  Future<bool> setIntValue(String key, int? value) async {
    // Set the int value, if null then set -1
    return await _preferences?.setInt(key, value ?? -1) ?? false;
  }

  // Get int value
  int getIntValue(String key) {
    // Get the int value, if null then set -1
    return _preferences?.getInt(key) ?? -1;
  }

  // Set bool value
  Future<bool> setBoolValue(String key, bool? value) async {
    // Set the bool value, if null then set false
    return await _preferences?.setBool(key, value ?? false) ?? false;
  }

  // Get bool value
  bool getBoolValue(String key) {
    // Get the bool value, if null then set false
    return _preferences?.getBool(key) ?? false;
  }

  // Set user login
  Future<bool> setIsUserLogin(bool? value) async {
    // Set the user login, if null then set false
    return await setBoolValue(SharedPreferenceConstants.login, value);
  }

  // Get user login
  bool getIsUserLogin() {
    // Get the user login, if null then set false
    return getBoolValue(SharedPreferenceConstants.login);
  }
}

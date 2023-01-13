import 'package:shared_preferences/shared_preferences.dart';

class SharedprefFunction {
  static String loginStatus = 'loginkey';
  static String userEmail = 'emailKey';

  static Future<bool> saveLogInStatus(bool islogIn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setBool(loginStatus, islogIn);
  }

  static Future<bool> saveUserEmail(String emailId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(userEmail, emailId);
  }

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(loginStatus);
  }

}
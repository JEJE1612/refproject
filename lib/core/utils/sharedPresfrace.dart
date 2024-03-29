import 'package:shared_preferences/shared_preferences.dart';

class CacheHealper {
  static SharedPreferences? sharedPreferences;
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> SavedData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences?.setString(key, value);
    if (value is int) return await sharedPreferences?.setInt(key, value);
    if (value is bool) return await sharedPreferences?.setBool(key, value);
    return await sharedPreferences?.setDouble(key, value);
  }

  static dynamic getData(
    String s, {
    required String key,
  }) {
    return sharedPreferences
        ?.get(key); // Return the value obtained from SharedPreferences
  }

  static Future<bool?> killToken({required String key}) async {
    return await sharedPreferences?.remove(key);
  }
}

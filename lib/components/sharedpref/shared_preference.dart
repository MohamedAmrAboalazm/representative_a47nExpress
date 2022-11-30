import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedCashHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> removeValue({@required String? key}) {
    return sharedPreferences!.remove(key!);
  }

  static dynamic getValue({@required String? key}) => sharedPreferences!.get(key!);

  static Future<bool> setValue(
      {@required String? key, @required dynamic value}) async {
    if (value is bool) return await sharedPreferences!.setBool(key!, value);
    if (value is String) return await sharedPreferences!.setString(key!, value);
    if (value is int)
      return await sharedPreferences!.setInt(key!, value);
    if (value is List<String>)
      return await sharedPreferences!.setStringList(key!, value);
    else
      return await sharedPreferences!.setDouble(key!, value);
  }
}
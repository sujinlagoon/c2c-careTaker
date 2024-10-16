import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Views_/Auth_screen/Sigin_screen/signIn_view.dart';

class SharedPref {
  saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    debugPrint('Token saved: $token');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    debugPrint('Token retrieved: $token');
    return token;
  }

  saveId(String ID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', ID);
    debugPrint('id saved: $ID');
  }

  Future<String?> getId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('id');
    debugPrint('id retrieved: $token');
    return token;
  }

  Future<void> setRegisterComplete(bool isComplete) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('isDetailsComplete', isComplete);
  }

  Future<bool> getRegisterComplete() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('isDetailsComplete') ?? false;
  }

  Future<void> logout() async {
    // Clear shared preferences
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('token');
    await pref.remove('isDetailsComplete');
    Get.deleteAll();
    Get.offAll(MobileEmail());
  }
}

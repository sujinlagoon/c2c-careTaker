import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  // Store token in shared preferences
  Future<void> setToken(String? token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (token != null) {
      preferences.setString('token', token);
    }
  }

  // Retrieve token from shared preferences
  Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
  }

  // Store Caretaker ID in shared preferences
  Future<void> setCareTakerId(String? id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (id != null) {
      preferences.setString('id', id);
      debugPrint("careTakerIdSaved: $id");
    }
  }

  // Retrieve Caretaker ID from shared preferences
  Future<String?> getCareTakerId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('id');
  }

  Future<void>logout()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
  }
}

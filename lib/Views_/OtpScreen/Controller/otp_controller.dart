import 'dart:convert';

import 'package:care2caretaker/api_urls/url.dart';
import 'package:care2caretaker/sharedPref/sharedPref.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Profile/profile_view.dart';

class OtpController extends GetxController {
  TextEditingController otpTEC = TextEditingController();

  checkOtp(String ?mobilnum) async {
    try {
      var res = await http.post(Uri.parse(URls().checkOtp), body: {
        "mobilenum":mobilnum,
        "otp":otpTEC.text,
      });
      if(res.statusCode==200){
        var json = jsonDecode(res.body);
        debugPrint("check otp body : $json");
        var token = json['token'];
        await SharedPref().setToken(token);
        debugPrint("otp check After Store Token $token");
        Get.to(()=> ProfileView());
      }else{
        debugPrint("otp check Not Successful");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

import 'dart:convert';

import 'package:care2caretaker/api_urls/url.dart';
import 'package:care2caretaker/reuse_widgets/customToast.dart';
import 'package:care2caretaker/sharedPref/sharedPref.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../OtpScreen/otp_screen.dart';

class LoginController extends GetxController {
  TextEditingController phoneCT = TextEditingController();
  FocusNode focusNode = FocusNode();

  signInSignUpApi() async {
    //try {
      var res = await http.post(Uri.parse(URls().loginorsignup), body: {
        "mobilenum": phoneCT.text,
      });
      if (res.statusCode == 200) {
        var resDecode = jsonDecode(res.body);
        debugPrint("signInSignUp$resDecode");
        var otp = resDecode['otp'];
        showCustomToast(message: "your otp is $otp");
        int  careTakerId = resDecode['patient']['id'];
        SharedPref().setCareTakerId(careTakerId.toString());
        debugPrint("Successfully Send otp");
        Get.to(() => OtpScreen(PhoneNumber: phoneCT.text,));
      } else {
        debugPrint("not Successfully Send otp");
      }
  /*  } catch (e) {
      debugPrint(e.toString());
    }*/
  }
}

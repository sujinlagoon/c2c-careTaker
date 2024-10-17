

import 'package:care2caretaker/api_urls/url.dart';
import 'package:care2caretaker/reuse_widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

import '../../../sharedPref/sharedPref.dart';
import '../modal/view_all_caretkers_modal.dart';

class HomeController extends GetxController {
  List<CaretakerInfo> viewAllCareTakers = [];
  AllCareTakers ?allCareTakers;

  viewAllCareTakersApi() async {
   try {
    var token = await SharedPref().getToken();
    var result = await http.get(
      Uri.parse(URls().viewAllCareTakers),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    if (result.statusCode == 200) {
      allCareTakers = allCareTakersFromJson(result.body);
      viewAllCareTakers.addAll(allCareTakers!.data!.map((e)=>e.caretakerInfo!).toList());
      viewAllCareTakers.forEach((e){});
      update();
    }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    viewAllCareTakersApi();
    super.onInit();
  }
}

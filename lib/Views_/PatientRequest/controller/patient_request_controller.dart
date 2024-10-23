import 'dart:convert';
import 'package:care2caretaker/api_urls/url.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../sharedPref/sharedPref.dart';
import '../modal/patientRequest_modal.dart';

class PatientRequestController extends GetxController {
  List<Datum> caretakersList = [];
  CareTakersList? careTakersListResponse;

  loadRequests() async {
    String? token = await SharedPref().getToken();
    if (token == null) {
      print('Token not found');
      return;
    }

    try {
      var res = await http.get(
        Uri.parse(URls().viewRequests),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        careTakersListResponse = careTakersListFromJson(res.body);
        caretakersList.assignAll(careTakersListResponse!.data ?? []);
        print("careTakerList ${caretakersList}");
        update();
      } else {
        print(
            "Failed to fetch caretakers data. Status Code: ${res.statusCode}");
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  acceptRejectRequestApi(
      {int? appointmentId, int? patientId, String? serviceStatus}) async {
    try {
      String? token = await SharedPref().getToken();
      final Map<String, dynamic> bodyData = {
        "appointment_id": appointmentId,
        "patient_id": patientId,
        "service_status": serviceStatus,
      };
      var res = await http.put(
        Uri.parse(URls().acceptRejectPatientRequest),
        body: jsonEncode(bodyData),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        final jsonResponse = jsonDecode(res.body);
        if (jsonResponse['success']) {
          debugPrint('Request $serviceStatus successfully');
          Get.back();
        } else {
          debugPrint('Failed: ${jsonResponse['message']}');
        }
      } else {
        debugPrint('Error: ${res.statusCode}');
      }
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    loadRequests();
    super.onInit();
  }
}

//

/*{
"success": true,
"status": 200,
"type": "success",
"data": {
"id": 1,
"patient_id": 3,
"caretaker_id": 1,
"appointment_date": "2024-10-25",
"appointment_start_time": "14:00:00",
"appointment_end_time": "15:00:00",
"service_status": "rejected",
"payment_status": "pending",
"created_at": "2024-10-21T08:30:53.000000Z",
"updated_at": "2024-10-22T15:49:42.000000Z"
}
}*/

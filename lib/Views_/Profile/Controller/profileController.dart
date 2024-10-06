import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../api_urls/url.dart';
import '../../../modals/profilr_info_modal.dart';
import '../../../reuse_widgets/customToast.dart';
import '../../../sharedPref/sharedPref.dart';
import '../../HomeView/home_view.dart';

class ProfileController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController medicalLicenseController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController yearOfExperienceController = TextEditingController();
  TextEditingController primaryContactController = TextEditingController();
  TextEditingController secondaryContactController = TextEditingController();

  DateTime? dob;
  bool isLoading = false;
  CaretakerInfo? profileInfo;

  Future<void> selectDob(BuildContext context) async {
    DateTime? pickDob = await showDatePicker(
        context: context,
        initialDate: dob ?? DateTime.now(),
        firstDate: DateTime(1000),
        lastDate: DateTime(2101));
    if (pickDob != null && pickDob != dob) {
      dob = pickDob;
      dobController.text = DateFormat('yyyy-MM-dd').format(dob!);
      int age = calculateAge(dob!);
      ageController.text = age.toString();
      update();
    }
  }

  // calculate age when select the dob

  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  insertCaretakerProfileDetails() async {
    try {
      var careTakerId = await SharedPref().getCareTakerId();
      var token = await SharedPref().getToken();
      Map<String, dynamic> caretakerData = {
        "caretaker_id": int.parse(careTakerId!),
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "sex": sexController.text,
        "age": int.parse(ageController.text),
        "dob": dobController.text,
        "medical_license": medicalLicenseController.text,
        "location": locationController.text,
        "nationality": nationalityController.text,
        "address": addressController.text,
        "uploaded_documents": "sasasasasasasasasa",
        "year_of_experiences": yearOfExperienceController.text,
        "primary_contact_number": primaryContactController.text,
        "secondary_contact_number": secondaryContactController.text
      };

      var res = await http.post(
        Uri.parse(URls().profileDetailsInsert),
        body: jsonEncode(caretakerData),
        headers: {
          "Content-Type": "application/json",
          "Accept": 'application/json',
          "Authorization": "Bearer $token",
        },
      );
      if (res.statusCode == 200) {
        debugPrint(res.body);
        Get.to(() => HomeView());
        debugPrint("Successfully Insert care Taker Details");
      } else {
        debugPrint("Not Successfully Insert care Taker Details");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  updateCaretakerProfileDetails() async {
    try {
      var careTakerId = await SharedPref().getCareTakerId();
      var token = await SharedPref().getToken();
      Map<String, dynamic> caretakerData = {
        "caretaker_id":int.parse(careTakerId!),
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "sex": sexController.text,
        "age": int.parse(ageController.text),
        "dob": dobController.text,
        "medical_license": medicalLicenseController.text,
        "location": locationController.text,
        "nationality": nationalityController.text,
        "address": addressController.text,
        "uploaded_documents": "sasasasasasasasasa",
        "year_of_experiences": yearOfExperienceController.text,
        "primary_contact_number": primaryContactController.text,
        "secondary_contact_number": secondaryContactController.text
      };

      var res = await http.put(
        Uri.parse(URls().profileDetailsEdit),
        body: jsonEncode(caretakerData),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (res.statusCode == 200) {
        Get.to(() => HomeView());
        debugPrint("Successfully update care Taker Details");
      } else {
        debugPrint("Not Successfully update care Taker Details");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  fetchCareTakerDetails() async {
    try {
      var token = await SharedPref().getToken();
      var res = await http.get(
        Uri.parse(URls().careTakerInfo),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      debugPrint("Response status: ${res.statusCode}");
      debugPrint("Response body: ${res.body}");

      if (res.statusCode == 200) {
        var decodeJson = jsonDecode(res.body);
        if (decodeJson['data'] != null) {
          profileInfo = Data.fromJson(decodeJson['data']).caretakerInfo;
          if (profileInfo != null) {
            print(profileInfo!.firstName);
            firstNameController.text = profileInfo!.firstName ?? '';
            lastNameController.text = profileInfo!.lastName ?? '';
            sexController.text = profileInfo!.sex ?? '';
            dobController.text = DateFormat('yyyy-MM-dd').format(profileInfo!.dob!);
            print(profileInfo!.dob);
            locationController.text = profileInfo!.location??'';
            ageController.text = profileInfo!.age.toString();
            nationalityController.text = profileInfo!.location??'' ;
            medicalLicenseController.text = profileInfo!.medicalLicense??"";
            yearOfExperienceController.text= profileInfo!.yearOfExperiences??'';
            addressController.text= profileInfo!.address??'';
            primaryContactController.text = profileInfo!.primaryContactNumber??'';
            secondaryContactController.text = profileInfo!.secondaryContactNumber??'';
            update();
          }
        } else {
          debugPrint("Data is null or not in expected format");
        }
      } else {
        debugPrint("Error fetching data: ${res.statusCode} - ${res.body}");
      }
    } catch (e) {
      debugPrint("Exception: ${e.toString()}");
    }
  }

  Future<void> getCurrentLocation() async {
    isLoading = true;
    update();
    // try {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      showCustomToast(message: "Please Enable location");
      isLoading = false;
      update();
      return;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showCustomToast(message: 'Location permission denied.');
        isLoading = false;
        update();
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showCustomToast(message: "Location permissions are permanently denied");
      isLoading = false;
      update();
    }
    Position position = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    Placemark place = placemarks[0];
    String address = "${place.locality}, ${place.postalCode}, ${place.country}";
    locationController.text = address;
    update();
    showCustomToast(message: 'Location updated successfully!');
    /*   } catch (e) {
      print(e);
    }*/
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchCareTakerDetails();
    super.onInit();
  }
}

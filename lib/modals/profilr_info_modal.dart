// To parse this JSON data, do
//
//     final profileList = profileListFromJson(jsonString);

import 'dart:convert';

ProfileList profileListFromJson(String str) =>
    ProfileList.fromJson(json.decode(str));

String profileListToJson(ProfileList data) => json.encode(data.toJson());

class ProfileList {
  bool? success;
  int? status;
  String? type;
  Data? data;
  String? profilePath;

  ProfileList({
    this.success,
    this.status,
    this.type,
    this.data,
    this.profilePath,
  });

  factory ProfileList.fromJson(Map<String, dynamic> json) => ProfileList(
        success: json["success"],
        status: json["status"],
        type: json["type"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        profilePath: json['profile_path'],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "type": type,
        "data": data?.toJson(),
        'profile_path': profilePath,
      };
}

class Data {
  int? id;
  String? mobilenum;
  String? otp;
  int? otpverified;
  String? profileImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  CaretakerInfo? caretakerInfo;

  Data({
    this.id,
    this.mobilenum,
    this.otp,
    this.otpverified,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
    this.caretakerInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        mobilenum: json["mobilenum"],
        otp: json["otp"],
        profileImage: json['profile_image_url'],
        otpverified: json["otpverified"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        caretakerInfo: json["caretaker_info"] == null
            ? null
            : CaretakerInfo.fromJson(json["caretaker_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mobilenum": mobilenum,
        "otp": otp,
        "otpverified": otpverified,
        'profile_image_url': profileImage,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "caretaker_info": caretakerInfo?.toJson(),
      };
}

class CaretakerInfo {
  int? id;
  int? caretakerId;
  String? firstName;
  String? lastName;
  String? sex;
  int? age;
  DateTime? dob;
  String? email;
  String? medicalLicense;
  String? location;
  String? nationality;
  String? address;
  String? serviceCharge;
  String? totalPatientsAttended;
  String? uploadedDocuments;
  String? yearOfExperiences;
  String? primaryContactNumber;
  String? secondaryContactNumber;
  DateTime? createdAt;
  DateTime? updatedAt;

  CaretakerInfo({
    this.id,
    this.caretakerId,
    this.firstName,
    this.lastName,
    this.sex,
    this.email,
    this.age,
    this.dob,
    this.medicalLicense,
    this.location,
    this.nationality,
    this.address,
    this.serviceCharge,
    this.totalPatientsAttended,
    this.uploadedDocuments,
    this.yearOfExperiences,
    this.primaryContactNumber,
    this.secondaryContactNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory CaretakerInfo.fromJson(Map<String, dynamic> json) => CaretakerInfo(
        id: json["id"],
        caretakerId: json["caretaker_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        sex: json["sex"],
        age: json["age"],
        email: json['email'],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        medicalLicense: json["medical_license"],
        location: json["location"],
        nationality: json["nationality"],
        address: json["address"],
        uploadedDocuments: json["uploaded_documents"],
        yearOfExperiences: json["year_of_experiences"],
        primaryContactNumber: json["primary_contact_number"],
        secondaryContactNumber: json["secondary_contact_number"],
        serviceCharge: json["service_charge"],
        totalPatientsAttended: json["total_patients_attended"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caretaker_id": caretakerId,
        "first_name": firstName,
        "last_name": lastName,
        "sex": sex,
        "age": age,
        'email': email,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "medical_license": medicalLicense,
        "location": location,
        "nationality": nationality,
        "address": address,
        "uploaded_documents": uploadedDocuments,
        "year_of_experiences": yearOfExperiences,
        "primary_contact_number": primaryContactNumber,
        "secondary_contact_number": secondaryContactNumber,
        "service_charge": serviceCharge,
        "total_patients_attended": totalPatientsAttended,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

import 'package:care2caretaker/Views_/Profile/Controller/profileController.dart';
import 'package:care2caretaker/reuse_widgets/AppColors.dart';
import 'package:care2caretaker/reuse_widgets/appBar.dart';
import 'package:care2caretaker/reuse_widgets/image_background.dart';
import 'package:care2caretaker/reuse_widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';

import '../primaryInformation/primaryinformationView.dart';
import 'controller/patient_request_controller.dart';

class PatientrequestView extends StatelessWidget {
  const PatientrequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppBar(
        title: "Request From Patients",
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.r),
        child: SingleChildScrollView(
          child: CustomPatientRequest(),
        ),
      ),
    );
  }
}

class CustomPatientRequest extends StatelessWidget {
  CustomPatientRequest({super.key});

  PatientRequestController controller = Get.put(PatientRequestController());
  ProfileController contro = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientRequestController>(builder: (v) {
      if (v.caretakersList.isEmpty) {
        return Center(child: ShimmerLoaderShimmer());
      }
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: v.caretakersList.length,
            itemBuilder: (BuildContext context, int index) {
              print(v.caretakersList.length);
              var res = v.caretakersList[index];
              var path = v.careTakersListResponse!.profilePath;
              var data = res.patient!.patientInfo;
              if (data == null) {
                return const Center(child: Text('No patient data available'));
              }
              print('-----${data.firstName}');
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Stack(
                    children: [
                      // Blue container (background)
                      InkWell(
                        onTap: () {
                          Get.to(() => Primaryinformationview(
                              age: data.age,
                              sex: data.sex,
                              firstName: data.firstName,
                              lastName: data.lastName,
                              nationality: data.nationality,
                              appointmentId: res.id,
                              patientId: res.patientId,
                              imgUrl: '${path}${res.patient!.profileImageUrl}'));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "View Request",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // White container (overlay)
                      Positioned(
                        bottom: 31.h,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.24,
                          width: MediaQuery.of(context).size.width * 0.96,
                          decoration: BoxDecoration(
                            color: const Color(0xffF6F4F4),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: GetBuilder<PatientRequestController>(
                              builder: (v) {
                            return carTakerList(context, controller,
                                imageUrl:
                                    '${path}${res.patient!.profileImageUrl}',
                                doctorName: '${data.firstName}');
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }
}

Widget carTakerList(BuildContext context, PatientRequestController controllerd,
    {String? name,
    String? doctorName,
    String? doctorDesignation,
    String? doctorState,
    String? imageUrl}) {
  return Container(
    padding: EdgeInsets.all(10.r),
    height: MediaQuery.of(context).size.height * 0.14,
    // Adjusted height
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(
        color: Colors.white,
      ),
    ),
    child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.10,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundImage: NetworkImage(imageUrl ?? ''),
              ),
              SizedBox(width: 10.w),
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          doctorName ?? '',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 5.w),
                        // Add spacing between text and icon
                        Image.asset(
                          "assets/images/verified_tick.png",
                          fit: BoxFit.cover,
                          height: 17.h,
                        ),
                      ],
                    ),
                    /*  Text(
                      doctorDesignation ?? '',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),*/
                    Text(
                      doctorState ?? '',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.female_outlined,
                  size: 33.sp,
                  color: Colors.pinkAccent,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 0.2,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.09, // Adjusted height
          width: MediaQuery.of(context).size.width,
          //color:Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spa,
            children: [
              Circleso(context, icon: IconlyBold.user_2, name: "25yr Old"),
              kWidth50,
              Circleso(context, icon: IconlyBold.work, name: "Engineer"),
            ],
          ),
        )
      ],
    ),
  );
}

Widget Circleso(BuildContext context, {IconData? icon, String? name}) {
  return Column(
    children: [
      CircleAvatar(
        radius: 24.r,
        backgroundColor: AppColors.primaryColor,
        child: Icon(icon, color: Colors.white),
      ),
      SizedBox(height: 6.h),
      Text(
        name ?? '',
        style: TextStyle(
          color: Colors.black,
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
        ),
      )
    ],
  );
}

class ShimmerLoaderShimmer extends StatelessWidget {
  const ShimmerLoaderShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 20.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 150.0,
                          height: 20.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 150.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                }),
          )),
    );
  }
}

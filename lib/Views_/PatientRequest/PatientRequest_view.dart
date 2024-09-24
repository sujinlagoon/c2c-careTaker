import 'package:care2caretaker/reuse_widgets/AppColors.dart';
import 'package:care2caretaker/reuse_widgets/appBar.dart';
import 'package:care2caretaker/reuse_widgets/image_background.dart';
import 'package:care2caretaker/reuse_widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconly/iconly.dart';

import '../primaryInformation/primaryinformationView.dart';

class PatientrequestView extends StatelessWidget {
  const PatientrequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppBar(
        title: "Patient Request",
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.r),
        child:  Column(
          children: [
            InkWell(
                onTap:(){

                  Get.to(()=>Primaryinformationview());
                },child: CustomPatientRequest()),
          ],
        ),
      ),
    );
  }
}

class CustomPatientRequest extends StatelessWidget {
  const CustomPatientRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          // Blue container (background)
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Accept Request",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
              child: carTakerList(context,
                  imageUrl: 'assets/images/female-nurse-hospital 1.png',
                  doctorState: "US",
                  doctorName: "Albretha"),
            ),
          ),
        ],
      ),
    );
  }
}

Widget carTakerList(BuildContext context,
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
                backgroundImage: AssetImage(imageUrl ?? ''),
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

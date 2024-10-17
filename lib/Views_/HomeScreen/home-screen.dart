import 'dart:ui';

import 'package:care2caretaker/Views_/HomeScreen/controller/home_controller.dart';
import 'package:care2caretaker/Views_/Profile/Controller/profileController.dart';
import 'package:care2caretaker/modals/profilr_info_modal.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';

import '../../reuse_widgets/AppColors.dart';
import '../../reuse_widgets/Custom_AppoinMents.dart';
import '../../reuse_widgets/appBar.dart';
import '../../reuse_widgets/customLabel.dart';
import '../../reuse_widgets/sizes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomeController hm = Get.put(HomeController());
  ProfileController hc = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (v) {
      if (v.fetchLoading) {
        return Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: HomePageSkeleton(),
        );
      }

      var data = hc.profileList!.data!.caretakerInfo;
      var full = (hc.profileList!.profilePath)! + (hc.profileList!.data!.profileImage!);
      return Scaffold(
        appBar: HomeAppBar(
          username: data!.firstName!,
          subtitle: 'How is your Health?',
          avatarUrl: full,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Splash.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomLabel(
                          text: "Upcoming Schedules",
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomLabel(
                        text: "See all",
                        fontSize: 15.sp,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  kHeight15,
                  Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        gradient: new LinearGradient(
                            colors: [
                              Color(0xff52AAFC),
                              Color(0xff41A2FD),
                            ],
                            stops: [
                              0.9,
                              1.6
                            ],
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            tileMode: TileMode.repeated)),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  kHeight25,
                                  Text(
                                    "Miss.Alexa Nova",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp),
                                  ),
                                  kHeight10,
                                  Text(
                                    "Physiotherapist",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.sp),
                                  ),
                                  kHeight10,
                                  ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 3, sigmaY: 3),
                                      child: Container(
                                        padding: EdgeInsets.all(3.r),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.white.withOpacity(0.1),
                                              Colors.white.withOpacity(0.1),
                                            ],
                                            /*begin: AlignmentDirectional.topStart,
                                            end: AlignmentDirectional.bottomEnd,*/
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.r)),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              IconlyLight.calendar,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              "Aug 5  9:00AM",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Flexible(
                            flex: 5,
                            child: Padding(
                              padding: EdgeInsets.only(top: 18.h),
                              child: Image.asset(
                                fit: BoxFit.cover,
                                "assets/images/female-nurse-hospital 1.png",
                              ),
                            )),
                      ],
                    ),
                  ),
                  kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomLabel(
                          text: "Top CareTakers",
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomLabel(
                        text: "See all",
                        fontSize: 15.sp,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  kHeight10,
                  GetBuilder<HomeController>(builder: (v) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: v.viewAllCareTakers.length,
                        itemBuilder: (BuildContext context, index) {
                          var data = v.viewAllCareTakers[index];
                          var fullName =
                              '${data.firstName ?? ''} ${data.lastName ?? ''}'
                                  .trim();
                          return CustomCareTakers(
                            name: fullName,
                            hospital: "Ak hospital",
                            initial: 2,
                            imageUrl: "assets/images/Rectangle 4481.png",
                          );
                        });
                  }),
                  kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomLabel(
                          text: "Upcomming Appointments",
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomLabel(
                        text: "See all",
                        fontSize: 15.sp,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  kHeight10,
                  AppointmentsContainer(
                    appointmentDate: "Sun Aug 08",
                    appointmentTime: '10:00-11:00 AM',
                    doctorDesignation: "Ortho",
                    doctorName: "Sheeba",
                    imageUrl: 'assets/images/profile.jpg',
                  ),
                  kHeight30,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

// custom TopCareTaker
}

// Custom Stateless Widget
class CustomCareTakers extends StatelessWidget {
  final String? name;
  final String? hospital;
  final String? imageUrl;
  final double initial;
  final VoidCallback? onPressed;

  // Constructor with named parameters
  CustomCareTakers({
    this.name,
    this.imageUrl,
    this.hospital,
    this.initial = 3.0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Colors.grey,
          width: 0.2,
        ),
      ),
      padding: EdgeInsets.all(6.r),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 68.w,
            color: AppColors.secondaryColor,
            child: Image.asset(imageUrl ?? ''),
          ),
          kWidth10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Nurse : ${hospital ?? ''}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              ),
              RatingBar(
                size: 23.sp,
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                onRatingChanged: (value) => debugPrint('$value'),
                initialRating: initial,
                maxRating: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomePageSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 150,
            height: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(height: 10),
            _buildSectionTitleSkeleton(),
            SizedBox(height: 15),
            _buildCardSkeleton(context),
            SizedBox(height: 10),
            _buildSectionTitleSkeleton(),
            SizedBox(height: 10),
            Expanded(child: _buildListSkeleton()),
            SizedBox(height: 10),
            _buildSectionTitleSkeleton(),
            SizedBox(height: 10),
            _buildAppointmentSkeleton(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitleSkeleton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 200,
            height: 20,
            color: Colors.white,
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 50,
            height: 15,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildCardSkeleton(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.17,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildListSkeleton() {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 80,
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 10,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: 150,
                          height: 10,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppointmentSkeleton() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
      ),
    );
  }
}

import 'package:care2caretaker/Views_/HomeView/Controller/bottomNav_controller.dart';
import 'package:care2caretaker/reuse_widgets/appBar.dart';
import 'package:care2caretaker/reuse_widgets/customButton.dart';
import 'package:care2caretaker/reuse_widgets/customLabel.dart';
import 'package:care2caretaker/reuse_widgets/image_background.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:readmore/readmore.dart';

import '../../reuse_widgets/AppColors.dart';
import '../../reuse_widgets/sizes.dart';
import '../PatientRequest/controller/patient_request_controller.dart';

class Primaryinformationview extends StatefulWidget {
  String? firstName;
  String? lastName;
  String? sex;
  int? age;
  String? nationality;
  String? imgUrl;
  int? appointmentId;
  int? patientId;

  Primaryinformationview(
      {super.key,
      this.firstName,
      this.lastName,
      this.sex,
      this.age,
      this.imgUrl,
      this.patientId,
      this.appointmentId,
      this.nationality});

  @override
  State<Primaryinformationview> createState() => _PrimaryinformationviewState();
}

class _PrimaryinformationviewState extends State<Primaryinformationview> {
  String? selectedValue;
  final BottomNavController bn = Get.put(BottomNavController());
  final PatientRequestController controller =
      Get.put(PatientRequestController());

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        bottomNavBar: GetBuilder<PatientRequestController>(builder: (request) {
          return Container(
            height: 80.h, // Adjust height as needed
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Reject",
                    color: Colors.red.withOpacity(0.9),
                    onPressed: () {
                      request.acceptRejectRequestApi(
                          appointmentId: widget.appointmentId,
                          patientId: widget.patientId,
                          serviceStatus: "rejected");
                      request.update();
                      debugPrint('Request Rejected');
                    },
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: "Accept",
                    color: Colors.green.withOpacity(0.9),
                    onPressed: () {
                      request.acceptRejectRequestApi(
                          appointmentId: widget.appointmentId,
                          patientId: widget.patientId,
                          serviceStatus: "approved");
                      request.update();
                      debugPrint('Request Accepted');
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          );
        }),
        appBar: CustomAppBar(
          title: "Primary Information",
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                carTakerList(context,
                    doctorName: '${widget.firstName}${widget.lastName}',
                    doctorState: widget.nationality,
                    imageUrl: widget.imgUrl),
                kHeight15,
                Container(
                  height: 35.h,
                  width: 150.h,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(23.r)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.r, vertical: 5.r),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.message_outlined,
                            size: 15.sp,
                          ),
                        ),
                        kWidth5,
                        Text(
                          "Contact Patient",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                kHeight15,
                CustomLabel(text: "About"),
                kHeight5,
                ReadMoreText(
                    style: TextStyle(),
                    trimLines: 2,
                    lessStyle: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                    moreStyle: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                    trimMode: TrimMode.Line,
                    "It seems like you've entered readmore text nwithout completing the request. Could you please provide more details or clarify your query so I can assist you better?"),
                Divider(
                  thickness: 0.2,
                ),
                DocsCustom(
                  radiusSize: 26,
                  heading: "Experience Certificates",
                  message: "Add your career info",
                  icons: EneftyIcons.hospital_bold,
                  iconColor: Colors.orange,
                ),
                Divider(
                  thickness: 0.2,
                ),
                kHeight5,
                CustomLabel(text: "Personal Details"),
                kHeight10,
                Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        savedDetails(context,
                            details: "BreakFast", timing: "8:00AM"),
                        kWidth5,
                        savedDetails(context,
                            details: "lunch", timing: "12:00PM"),
                        kWidth5,
                        savedDetails(context,
                            details: "Snacks", timing: "04:00PM"),
                        kWidth5,
                        savedDetails(context,
                            details: "Dinner", timing: "07:00PM"),
                      ],
                    ),
                  ),
                ),
                kHeight5,
                CustomLabel(text: "Vital Signs"),
                kHeight10,
                Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        savedDetails(context,
                            details: "Temperature", timing: "98.6\u2109F"),
                        kWidth5,
                        savedDetails(context, details: "Pulse", timing: "80"),
                        kWidth5,
                        savedDetails(context,
                            details: "Respiration", timing: "12-14"),
                        kWidth5,
                      ],
                    ),
                  ),
                ),
                kHeight5,
                CustomLabel(text: "Blood Sugar Level"),
                kHeight10,
                Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        savedDetails(context,
                            details: "Morning", timing: "70mg"),
                        kWidth5,
                        savedDetails(context, details: "Noon", timing: "70mg"),
                        kWidth5,
                        savedDetails(context,
                            details: "Evening", timing: "70mg"),
                        kWidth5,
                      ],
                    ),
                  ),
                ),
                kHeight10,
              ],
            ),
          ),
        ));
  }

  Widget savedDetails(BuildContext context, {String? details, String? timing}) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.all(8.r),
      decoration: const BoxDecoration(
        color: Color(0xffF5F5F5),
      ),
      child: Row(
        children: [
          Text(details ?? ''),
          kWidth5,
          const Text(':'),
          kWidth5,
          Text(timing ?? '')
        ],
      ),
    );
  }

  Widget carTakerList(BuildContext context,
      {String? name,
      String? doctorName,
      String? doctorDesignation,
      String? doctorState,
      String? imageUrl}) {
    return Container(
      padding: EdgeInsets.all(10.r),
      height: MediaQuery.of(context).size.height * 0.24,
      // Adjusted height
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.r),
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
            height:
                MediaQuery.of(context).size.height * 0.09, // Adjusted height
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
}

class DocsCustom extends StatelessWidget {
  final String? heading;
  final String? message;
  final IconData? icons;
  final Color? circleColor;
  final Color? iconColor;
  final VoidCallback? onTap;
  final double? radiusSize;

  DocsCustom({
    super.key,
    this.heading,
    this.message,
    this.icons,
    this.onTap,
    this.circleColor,
    this.iconColor,
    this.radiusSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // Ensures the Row shrinks to fit its children
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              backgroundColor: circleColor ?? Colors.grey.withOpacity(0.1),
              radius: radiusSize ?? 22,
              child: Icon(
                icons,
                color: iconColor ?? Colors.black,
              ),
            ),
          ),
          kWidth10,
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    heading ?? "Alis Dia",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    message ?? "sujnc901@gmail.com",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14.sp,
              ))
        ],
      ),
    );
  }
}

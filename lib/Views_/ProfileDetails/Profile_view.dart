import 'package:care2caretaker/Views_/Document_Upload/document_uploadView.dart';
import 'package:care2caretaker/Views_/patient_history/patients_history.dart';
import 'package:care2caretaker/reuse_widgets/AppColors.dart';
import 'package:care2caretaker/reuse_widgets/appBar.dart';
import 'package:care2caretaker/reuse_widgets/customLabel.dart';
import 'package:care2caretaker/reuse_widgets/image_background.dart';
import 'package:care2caretaker/reuse_widgets/sizes.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconly/iconly.dart';

import 'Information_view.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppBar(
        title: "Profile Details",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.notification),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kHeight10,
              Container(
                height: 80.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        radius: 20,
                        child: Image.asset("assets/images/Rectangle 4482.png"),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                "Notification",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "This is a notification message.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          // Handle edit action
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              kHeight30,
              CustomLabel(text: "General"),
              kHeight10,
              ProfileDetailsCustom(
                icons: IconlyBold.profile,
                iconColor: Color(0xff246AFD),
                heading: "Account Information",
                message: "change Your Account Information ",
                callback: () {
                  Get.to(() => AccountInformation());
                },
              ),
              Divider(),
              kHeight10,
              ProfileDetailsCustom(
                icons: Icons.medical_information,
                iconColor: Colors.red,
                heading: "Patient History",
                message: "View Your Patients",
                callback: (){
                  Get.to(()=>PatientsHistory());
                },
              ),
              Divider(),
              kHeight10,
              ProfileDetailsCustom(
                icons: EneftyIcons.wallet_remove_bold,
                iconColor: Colors.green,
                heading: "Insurance Details",
                message: "Add your Insurance Details",
              ),
              Divider(),
              kHeight10,
              ProfileDetailsCustom(
                icons: Icons.picture_as_pdf,
                iconColor: Colors.redAccent,
                heading: "Documents",
                message: "Upload or view Documents",
                callback: () {
                  Get.to(() => DocumentUploadView());
                },
              ),
              Divider(),
              kHeight10,
              ProfileDetailsCustom(
                icons: EneftyIcons.buildings_bold,
                iconColor: Colors.amberAccent,
                heading: "Medical Records",
                message: "History about the your medical records",
              ),
              Divider(),
              kHeight10,
              ProfileDetailsCustom(
                icons: IconlyBold.location,
                iconColor: Color(0xff076F88),
                heading: "My Address",
                message: "Add Your Address",
              ),
              Divider(),
              kHeight10,
              ProfileDetailsCustom(
                icons: EneftyIcons.logout_bold,
                iconColor: Color(0xff002574),
                heading: "Logout",
                message: "",
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetailsCustom extends StatelessWidget {
  final String? heading;
  final String? message;
  final IconData? icons;
  final Color? circleColor;
  final Color? iconColor;
  VoidCallback? callback;
  double? radiusSize;

  ProfileDetailsCustom({
    super.key,
    this.heading,
    this.message,
    this.icons,
    this.callback,
    this.circleColor,
    this.iconColor,
    this.radiusSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.1),
              radius: radiusSize ?? 20,
              child: Icon(
                icons,
                color: iconColor,
              ),
            ),
          ),
          kWidth10,
          Expanded(
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
            onPressed: callback,
            icon: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.black,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}

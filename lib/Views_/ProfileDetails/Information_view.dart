import 'dart:ui';

import 'package:care2caretaker/reuse_widgets/AppColors.dart';
import 'package:care2caretaker/reuse_widgets/appBar.dart';
import 'package:care2caretaker/reuse_widgets/custom_textfield.dart';
import 'package:care2caretaker/reuse_widgets/image_background.dart';
import 'package:care2caretaker/reuse_widgets/sizes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class AccountInformation extends StatelessWidget {
  const AccountInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppBar(
        title: 'Profile Information',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              "Done",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CircleAvatar(
                      radius: 20,
                      child: Image.asset("assets/images/Rectangle 4482.png"),
                    ),
                  ),
                  kWidth10,
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                          "Remove Photo",
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
                  kWidth10,
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Change Photo',
                        style: TextStyle(
                          color: Colors.blue, // Adjust color if needed
                          fontSize: 14.sp, // Adjust font size if needed
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              kHeight20,
              customTextField(
                context,
                labelText: "Full Name",
              ),
              kHeight15,
              Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: customTextField(context, labelText: "Sex")),
                  kWidth20,
                  Flexible(
                    flex: 5,
                    child: customTextField(context, labelText: "Age"),
                  ),
                ],
              ),
              kHeight15,
              customTextField(
                context,
                labelText: "Date of Birth",
              ),
              kHeight15,
              customTextField(
                context,
                labelText: "Medical License",
              ),
              kHeight15,
              Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: customTextField(context, labelText: "Location")),
                  kWidth15,
                  Flexible(
                      child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      color: AppColors.primaryColor,
                      child: const Icon(
                        Icons.add_location_alt,
                        color: Colors.white,
                      ),
                    ),
                  )),
                ],
              ),
              kHeight15,
              customTextField(
                context,
                labelText: "Nationality",
              ),
              kHeight15,
              customTextField(
                context,
                maxLines: 3,
                labelText: "Nationality",
              ),
              kHeight15,
              DottedBorder(
                color: AppColors.primaryColor,
                strokeWidth: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          //Get.to(() => DocumentUploadView());
                        },
                        icon: Icon(EneftyIcons.attach_circle_outline),
                      ),
                      Text(
                        "Add Attachment",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              kHeight15,
            ],
          ),
        ),
      ),
    );
  }
}

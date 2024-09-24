import 'package:dotted_border/dotted_border.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconly/iconly.dart';
import '../../reuse_widgets/AppColors.dart';
import '../../reuse_widgets/appBar.dart';
import '../../reuse_widgets/custom_textfield.dart';
import '../../reuse_widgets/image_background.dart';
import '../../reuse_widgets/sizes.dart';
import '../HomeView/home_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        appBar: CustomAppBar(title: "Profile", actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton(
              onPressed: () {
                Get.to(() => HomeView());
              },
              icon: const Icon(
                IconlyLight.tick_square,
              ),
              color: AppColors.primaryColor,
            ),
          ),
        ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5.h),
                customTextField(
                  context,
                  labelText: "Full Name",
                ),
                SizedBox(height: 15.h),
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
                kHeight20,
                customTextField(
                  context,
                  labelText: "Date of Birth",
                ),
                kHeight20,
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
                kHeight20,
                customTextField(
                  context,
                  labelText: "Nationality",
                ),
                kHeight20,
                customTextField(
                  context,
                  labelText: "Medical License",
                ),
                kHeight20,
                customTextField(
                  context,
                  labelText: "Experience",
                ),
                kHeight20,
                DottedBorder(
                    color: Colors.grey,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          kHeight5,
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            radius: 22,
                            child: Icon(
                              EneftyIcons.document_upload_outline,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                // Get.to(() => AddressView());
                              },
                              child: Text(
                                "Click to upload",
                                style: TextStyle(color: AppColors.primaryColor),
                              )),
                          Text("Max File size")
                        ],
                      ),
                    )),
                kHeight20,
                customTextField(
                  context,
                  maxLines: 3,
                  labelText: "Address",
                ),
                kHeight20,
                customTextField(
                  context,
                  labelText: "Primary Contact Number",
                ),
                kHeight20,
                customTextField(
                  context,
                  labelText: "Secondary Contact",
                ),
                kHeight20,
              ],
            ),
          ),
        ));
  }
}

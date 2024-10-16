import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:care2caretaker/Views_/Profile/Controller/profileController.dart';
import 'package:care2caretaker/reuse_widgets/AppColors.dart';
import 'package:care2caretaker/reuse_widgets/appBar.dart';
import 'package:care2caretaker/reuse_widgets/custom_textfield.dart';
import 'package:care2caretaker/reuse_widgets/image_background.dart';
import 'package:care2caretaker/reuse_widgets/sizes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

class AccountInformation extends StatefulWidget {
  AccountInformation({super.key});

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (f) {
        if (controller.fetchLoading) {
          return Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white, // Set the background color you want
            child: SkeletonLoader(),
          );
        }

        /*if (controller.profileList?.data?.caretakerInfo == null && controller .profileList==null) {
          return Center(child: Text("No data available or failed to fetch"));
        }*/

        var data = controller.profileList!.data!.caretakerInfo!;
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
                  GetBuilder<ProfileController>(builder: (v) {
                    String fullImageUrl = (v.profileList?.profilePath ?? '') +
                        (v.profileList?.data?.profileImage ?? '');
                    debugPrint(fullImageUrl);
                    return Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: CircleAvatar(
                            radius: 24.r,
                            backgroundColor: Colors.grey.shade200,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: fullImageUrl,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Image.asset('assets/images/remove_photo.png'),
                                fit: BoxFit.cover,
                                width: 46.r,
                                height: 50.r,
                              ),
                            ),
                          ),
                        ),
                        kWidth10,
                        GetBuilder<ProfileController>(
                            init: ProfileController(),
                            builder: (v) {
                              return Container(
                                height: MediaQuery.of(context).size.height * 0.10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${data!.firstName}  ${data.lastName}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    GetBuilder<ProfileController>(
                                      builder: (z) {
                                        bool isLoading = false ;
                                        return GestureDetector(
                                          onTap: () {
                                            z.selectImage = null;
                                            z.profileList!.data!.profileImage = 'default-profile-img.png';
                                            z.update();
                                            debugPrint("Photo removed");
                                          },
                                          child: Text(
                                            "Remove Photo",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: fullImageUrl.endsWith(
                                                      'default-profile-img.png')
                                                  ? Colors.black54
                                                  : Colors.blue,
                                            ),
                                          ),
                                        );
                                      }
                                    ),
                                  ],
                                ),
                              );
                            }),
                        kWidth10,
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height * 0.20,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.white,
                                      child: Column(
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                v.pickImage(
                                                    ImageSource.camera, context);
                                              },
                                              style: ButtonStyle(
                                                  overlayColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.transparent)),
                                              child: AutoSizeText('Camera')),
                                          TextButton(
                                              onPressed: () {
                                                v.pickImage(
                                                    ImageSource.gallery, context);
                                              },
                                              style: ButtonStyle(
                                                  overlayColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.transparent)),
                                              child: AutoSizeText('Gallery')),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Change Photo',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  kHeight20,
                  customTextField(
                    context,
                    controller: TextEditingController(
                        text: '${controller.firstNameController.text} '
                            '${controller.lastNameController.text}'),
                    labelText: "Full Name",
                  ),
                  kHeight15,
                  Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: customTextField(context,
                              labelText: "Sex",
                              controller: controller.sexController)),
                      kWidth20,
                      Flexible(
                        flex: 5,
                        child: customTextField(
                            controller: controller.ageController,
                            context,
                            labelText: "Age"),
                      ),
                    ],
                  ),
                  kHeight15,
                  customTextField(
                    context,
                    controller: controller.dobController,
                    labelText: "Date of Birth",
                  ),
                  kHeight15,
                  customTextField(
                    context,
                    controller: controller.medicalLicenseController,
                    labelText: "Medical License",
                  ),
                  kHeight15,
                  Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: customTextField(context,
                              controller: controller.locationController,
                              labelText: "Location")),
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
                    controller: controller.nationalityController,
                    labelText: "Nationality",
                  ),
                  kHeight15,
                  customTextField(
                    context,
                    maxLines: 3,
                    controller: controller.addressController,
                    labelText: "Address",
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
    );
  }
}

class SkeletonLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Skeleton for the profile image and name
                  Row(
                    children: [
                      // Circular Avatar Skeleton
                      Container(
                        width: 46.r,
                        height: 46.r,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(23.r),
                        ),
                      ),
                      SizedBox(width: 10),
                      // Name Skeleton
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120.w,
                            height: 16.h,
                            color: Colors.grey[300],
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            width: 80.w,
                            height: 14.h,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      // Skeleton for Change Photo button
                      Container(
                        width: 80.w,
                        height: 20.h,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  // Skeleton for each text field
                  _buildSkeletonTextField(),
                  SizedBox(height: 15.h),
                  _buildSkeletonTextField(),
                  SizedBox(height: 15.h),
                  _buildSkeletonTextField(),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Expanded(child: _buildSkeletonTextField()), // Sex field
                      SizedBox(width: 20.w),
                      Expanded(child: _buildSkeletonTextField()), // Age field
                    ],
                  ),
                  SizedBox(height: 15.h),
                  _buildSkeletonTextField(),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Expanded(child: _buildSkeletonTextField()), // Location field
                      SizedBox(width: 15.w),
                      Container(
                        height: 40.h,
                        width: 40.w,
                        color: Colors.grey[300], // Location icon skeleton
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  _buildSkeletonTextField(),
                  SizedBox(height: 15.h),
                  // Skeleton for the Address field
                  _buildSkeletonTextField(height: 60.h), // Multiline address field
                  SizedBox(height: 15.h),
                  DottedBorder(
                    color: Colors.grey[300]!,
                    strokeWidth: 1,
                    child: Container(
                      height: 80.h,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.attach_file, color: Colors.grey[300]),
                          SizedBox(height: 5.h),
                          Container(
                            width: 100.w,
                            height: 20.h,
                            color: Colors.grey[300], // Skeleton for "Add Attachment"
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildSkeletonTextField({
    double height = 20.0,
    double width = double.infinity,
    Color color = const Color(0xFFE0E0E0),
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(vertical: 8.0),
  }) {
    return Container(
      width: width,
      height: height,
      color: color,
      margin: margin,
    );
  }

}


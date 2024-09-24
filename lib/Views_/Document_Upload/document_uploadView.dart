
import 'package:care2caretaker/reuse_widgets/AppColors.dart';
import 'package:care2caretaker/reuse_widgets/appBar.dart';
import 'package:care2caretaker/reuse_widgets/customLabel.dart';
import 'package:care2caretaker/reuse_widgets/image_background.dart';
import 'package:care2caretaker/reuse_widgets/sizes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class DocumentUploadView extends StatefulWidget {
  DocumentUploadView({super.key});

  @override
  State<DocumentUploadView> createState() => _DocumentUploadViewState();
}

class _DocumentUploadViewState extends State<DocumentUploadView> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        appBar: CustomAppBar(
          title: 'Upload Documents',
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              DocsCustom(
                radiusSize: 26,
                heading: "Experience Certificates",
                message: "Add your career info",
                icons: EneftyIcons.hospital_bold,
                iconColor: Colors.orange,
                isSelected: selectedValue == 'option1',
                value: 'option1',
                onTap: () {
                  setState(() {
                    selectedValue = 'option1';
                  });
                },
              ),
              Divider(
                thickness: 0.2,
              ),
              DocsCustom(
                radiusSize: 26,
                heading: "Medical records",
                message: "History about your medical records",
                icons: EneftyIcons.ram_bold,
                iconColor: Colors.green,
                isSelected: selectedValue == 'option2',
                value: 'option2',
                onTap: () {
                  setState(() {
                    selectedValue = 'option2';
                  });
                },
              ),
              Divider(
                thickness: 0.2,
              ),
              kHeight5,
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
                              //Get.to(() => AddressView());
                            },
                            child: Text(
                              "Click to upload",
                              style: TextStyle(color: AppColors.primaryColor),
                            )),
                        Text("Max File size")
                      ],
                    ),
                  )),
              kHeight15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomLabel(
                      text: "Upload Documents ",
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomLabel(
                    text: "02 Items",
                    fontSize: 15.sp,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              kHeight15,
              Upload(
                radiusSize: 24.r,
                heading: "Experience Certificate",
                message: "05th Aug 2024",
              ),
              Upload(
                radiusSize: 24.r,
                heading: 'Medical Records',
                message: '05th Aug 2024',
              )
            ],
          ),
        ));
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
  final bool isSelected;
  final String value;

  DocsCustom({
    super.key,
    this.heading,
    this.message,
    this.icons,
    this.onTap,
    this.circleColor,
    this.iconColor,
    this.radiusSize,
    required this.isSelected,
    required this.value,
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
          Radio<String>(
            value: value,
            groupValue: isSelected ? value : null,
            onChanged: (String? newValue) {
              if (onTap != null) {
                onTap!();
              }
            },
          ),
        ],
      ),
    );
  }
}

class Upload extends StatelessWidget {
  final String? heading;
  final String? message;
  final IconData? icons;
  final Color? circleColor;
  final Color? iconColor;
  VoidCallback? callback;
  double? radiusSize;

  Upload({
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
              child: Container(
                  padding: EdgeInsets.all(9.r),
                  height: 48.h,
                  width: 48.w,
                  child: Image.asset("assets/images/pdf-2616 1.png"))),
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
                      fontSize: 14.sp,
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
          CircleAvatar(
            backgroundColor: AppColors.primaryColor.withOpacity(0.1),
            radius: 20,
            child: Icon(
              EneftyIcons.document_upload_outline,
              color: iconColor,
            ),
          ),
          kWidth15,
          CircleAvatar(
            backgroundColor: Colors.red.withOpacity(0.1),
            radius: 20,
            child: Icon(
              EneftyIcons.trash_bold,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}

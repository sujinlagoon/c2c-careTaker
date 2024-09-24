import 'package:care2caretaker/Views_/Receipt/receipt_view.dart';
import 'package:care2caretaker/Views_/schedule/schedule_view.dart';
import 'package:care2caretaker/reuse_widgets/appBar.dart';
import 'package:care2caretaker/reuse_widgets/image_background.dart';
import 'package:care2caretaker/reuse_widgets/sizes.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/nav2/get_nav_config.dart';

class PatientsHistory extends StatefulWidget {
  const PatientsHistory({super.key});

  @override
  State<PatientsHistory> createState() => _PatientsHistoryState();
}

class _PatientsHistoryState extends State<PatientsHistory> {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        appBar: CustomAppBar(
          title: "Patient History",
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month))
          ],
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(EneftyIcons.search_normal_outline),
                  hintText: "Search..",
                  contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 0.2,
                  )),
                  border: OutlineInputBorder(),
                ),
              ),
              kHeight10,
              WaitingPatients(
                name: 'Sujin Kumar ',
                date: '09 AUG 2024',
                imgurl: "assets/images/Rectangle 4481.png",
                time: "Monday 8:00AM - 9:00AM",
                onTapButton: () {
                  Get.to(() => const ReceiptView());
                },
              ),
              kHeight10,
              WaitingPatients(
                name: 'Anlin Jude',
                date: '09 AUG 2024',
                imgurl: "assets/images/Rectangle 4482.png",
                time: "Monday 8:00AM - 9:00AM",
              ),
              kHeight10,
              WaitingPatients(
                name: 'Akash Asokan ',
                date: '09 AUG 2024',
                imgurl: "assets/images/Rectangle 4486.png",
                time: "Monday 8:00AM - 9:00AM",
              ),
              kHeight10,
              WaitingPatients(
                name: 'Tim Cook',
                date: '09 AUG 2024',
                imgurl: "assets/images/profile.jpg",
                time: "Monday 8:00AM - 9:00AM",
              ),
              kHeight10,
            ],
          ).paddingSymmetric(horizontal: 10.w),
        ));
  }
}

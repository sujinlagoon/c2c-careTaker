import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:care2caretaker/Views_/Chat_/ChatListScreen/chat_list_screen.dart';
import 'package:care2caretaker/Views_/ProfileDetails/Profile_view.dart';
import 'package:care2caretaker/Views_/schedule/schedule_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../HomeScreen/controller/home-screen.dart';
import '../../PatientRequest/PatientRequest_view.dart';

class BottomNavController extends GetxController {
  int currentIndex = 0;
  final List<Widget> screens = [
    HomePage(),
    PatientrequestView(),
    ScheduleView(),
    ChatListScreen(),
    ProfileDetails()
  ];
  List<TabItem> items = [
    TabItem(
      icon: IconlyBold.home,
    ),
    TabItem(
      icon: IconlyBold.calendar,
    ),
    TabItem(
      icon: IconlyBold.user_2,
    ),
    TabItem(
      icon: Icons.chat_rounded,
    ),
    TabItem(
      icon: IconlyBold.profile,
    ),
  ];
}

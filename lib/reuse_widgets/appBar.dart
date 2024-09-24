
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconly/iconly.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions; // Accept a list of actions
  final Widget? leading;
  final PreferredSizeWidget? bottom;

  CustomAppBar({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: leading ?? const SizedBox(),
      title: Text(
        title ?? '',
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
      ),
      bottom: bottom,
      centerTitle: true,
      actions: actions ?? [const SizedBox()], // Use the list of actions
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    kToolbarHeight + (bottom?.preferredSize.height ?? 0.0),
  );
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String username;
  final String subtitle;
  final String avatarUrl; // You can also use AssetImage for local images
  final List<Widget>? actions;

  HomeAppBar({
    required this.username,
    required this.subtitle,
    required this.avatarUrl,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100.0), // Adjust height as needed
      child: AppBar(
        backgroundColor: Colors.white,
        // Adjust to match your design
        elevation: 0,
        // Remove shadow for a flat design
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
          child: CircleAvatar(
            radius: 20.0, // Adjust size as needed
            backgroundImage: AssetImage(
                avatarUrl), // Replace with AssetImage for local images
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $username',
              style: TextStyle(
                color: Colors.black, // Adjust to match your design
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey, // Adjust to match your design
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        actions: actions ??
            [
              IconButton(
                icon: Icon(IconlyLight.search, color: Colors.black),
                // Adjust icon color
                onPressed: () {
                  // Handle search action
                },
              ),
              IconButton(
                icon: Icon(IconlyLight.notification, color: Colors.black),
                // Adjust icon color
                onPressed: () {
                  //Get.to(()=>NotificationView());
                },
              ),
              SizedBox(width: 16.w), // Add some space at the end
            ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}



import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:numpad/numpad.dart';

import '../../../reuse_widgets/customButton.dart';
import '../../../reuse_widgets/custom_textfield.dart';
import '../../../reuse_widgets/image_background.dart';
import '../../../reuse_widgets/sizes.dart';
import '../../OtpScreen/otp_screen.dart';
import 'controller/login_controller.dart';

class MobileEmail extends StatelessWidget {
  const MobileEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        children: [
          Expanded(flex: 2, child: Image.asset("assets/images/ctoc onboarding.png")),
          kHeight40,
          Flexible(
              //flex: 4,
              child: Column(
            children: [
              CustomButton(
                icon: Icons.phone_iphone_outlined,
                text: 'Continue With Mobile',
                onPressed: () {
                  Get.  to(() => LoginScreen());
                },
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: SizedBox(
                  height: 20.h,
                  //color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: const Text("or continue"),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                      kHeight30,
                    ],
                  ),
                ),
              ),
              kHeight20,
              InkWell(
                onTap: () {},
                child: Center(
                    child: SvgPicture.asset(
                  "assets/images/svg/signin_with_google.svg",
                  height: 30.h,
                )),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginController lc = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 6,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      "assets/images/svg/logo.svg",
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: AutoSizeText(
                        "Enter your mobile number",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 22.sp, fontWeight: FontWeight.w700),
                      )),
                  SizedBox(height: 20.h),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        "We will send you a verification code",
                        textAlign: TextAlign.center,
                        maxLines: null,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600),
                      )),
                  SizedBox(height: 20.h),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 22.r),
                    child: customTextField(
                      context,
                      prefix: CountryCodePicker(
                        onChanged: print,
                        initialSelection: 'US',
                        favorite: ['+91', 'FR'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                       flagDecoration: BoxDecoration(
                      shape: BoxShape.circle
                       ),
                      ),
                      controller: lc.phoneCT,
                      textStyle: TextStyle(
                        fontSize: 17.sp,
                      ),
                      labelText: 'Phone',
                      readOnly: true,
                    ),
                  ),
                  SizedBox(height: 48.h),
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.8,
                    text: "Continue",
                    onPressed: () {
                      Get.to(() => OtpScreen());
                    },
                  ),
                ],
              )),
          Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(16.r),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: NumPad(
                    backgroundColor: Colors.grey.shade100,
                    buttonSize: 12,
                    mainAxisSpacing: 12,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 32.sp,
                    ),
                    numItemDecoration: const BoxDecoration(),
                    onTap: (val) {
                      if (val == 99) {
                        if (lc.phoneCT.text.isEmpty) {
                          return;
                        }
                        lc.phoneCT.text = lc.phoneCT.text
                            .substring(0, lc.phoneCT.text.length - 1);
                        return;
                      }
                      if (lc.phoneCT.text.length == 10) {
                        return;
                      }
                      lc.phoneCT.text = lc.phoneCT.text + val.toString();
                      print(lc.phoneCT.text);
                      lc.update();
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }

  //
  InputDecoration inputDecoration() {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 10.h),
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent)),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent)),
    );
  }
}

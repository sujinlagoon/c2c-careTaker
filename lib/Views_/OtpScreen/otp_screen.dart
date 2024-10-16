import 'package:auto_size_text/auto_size_text.dart';
import 'package:care2caretaker/Views_/Profile/Controller/profileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../reuse_widgets/AppColors.dart';
import '../../reuse_widgets/customButton.dart';
import '../Profile/profile_view.dart';
import 'Controller/otp_controller.dart';

class OtpScreen extends StatefulWidget {
  String phone;

  OtpScreen({super.key, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  OtpController vc = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
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
                        "Enter your 4 Digits otp",
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
                  SizedBox(
                    height: 40.h,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: PinCodeTextField(
                      readOnly: true,
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        inactiveColor: Colors.grey.shade600,
                        inactiveFillColor: Colors.white,
                        borderWidth: 0.sp,
                        errorBorderColor: Colors.red,
                        fieldOuterPadding:
                            EdgeInsets.symmetric(horizontal: 2.w),
                        activeBorderWidth: 0,
                        inactiveBorderWidth: 0,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 40.h,
                        fieldWidth: 45.w,
                        activeFillColor: Colors.grey.shade200,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.white,
                      enableActiveFill: true,
                      controller: vc.otpTEC,
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                      appContext: context,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Resend code",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  GetBuilder<OtpController>(builder: (b) {
                    return CustomButton(
                      isLoading: b.isLoading,
                      width: MediaQuery.of(context).size.width * 0.8,
                      text: "Continue",
                      onPressed: b.isLoading
                          ? null
                          : () async {
                              b.checkOtp(widget.phone);
                              // await ProfileController().fetchCareTakerDetails();
                            },
                    );
                  }),
                  SizedBox(height: 8.h),
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
                  child: NumericKeyboard(
                      onKeyboardTap: (val) {
                        if (val == 99) {
                          if (vc.otpTEC.text.isEmpty) {
                            return;
                          }
                          vc.otpTEC.text = vc.otpTEC.text
                              .substring(0, vc.otpTEC.text.length - 1);
                          return;
                        }
                        vc.otpTEC.text = vc.otpTEC.text + val.toString();
                        debugPrint(vc.otpTEC.text);
                      },
                      textStyle: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      rightButtonFn: () {
                        if (vc.otpTEC.text.isNotEmpty) {
                          vc.otpTEC.text = vc.otpTEC.text
                              .substring(0, vc.otpTEC.text.length - 1);
                          vc.update();
                        }
                      },
                      rightButtonLongPressFn: () {
                        vc.otpTEC.clear();
                        vc.update();
                      },
                      rightIcon: Icon(
                        Icons.backspace,
                        color: Colors.black,
                      ),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween),
                ),
              ))
        ],
      ),
    ));
  }
}

import 'package:care2caretaker/Notification/controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Views_/SplashScreen/splash_screen.dart';
import 'firebase_options.dart';





void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(NotificationController());
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
        builder: (context,w) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.native,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff15ADD2),),
              fontFamily: GoogleFonts.kumbhSans().fontFamily,
              applyElevationOverlayColor: false,
              useMaterial3: true,
              textTheme: TextTheme(
                bodyMedium: TextStyle(color: Color(0xff222222)),

              ),
            ),
            home: const SplashScreen(),
          );
    }
    );
  }
}


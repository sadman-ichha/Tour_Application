import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shelter/const/app_string.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/views/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  Future chooseScreen() async {
    var userId = box.read('uid');
    if (userId == null) {
      Get.toNamed(onboarding);
    } else {
      Get.toNamed(login);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () => chooseScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo/app-logo.png'),
            Text(
              AppStrings.appName,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0.sp,
              ),
            ),
          ],
        )),
      ),
    );
  }
}

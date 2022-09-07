// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/business_logics/auth.dart';
import 'package:shelter/const/app_colors.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/styles/style.dart';
import 'package:shelter/ui/widgets/violet_button.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w, top: 80.0.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create\nYour Account",
                  style: TextStyle(
                    fontSize: 36.0.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.violetColor,
                  ),
                ),
                SizedBox(height: 12.0.h),
                Text(
                  "Create your account and start your\njourney",
                  style: TextStyle(
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 80.0.h),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: AppStyle.textFieldDecoration("E-mail Address"),
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: AppStyle.textFieldDecoration('Enter Password'),
                ),
                SizedBox(height: 80.0.h),
                VioletButton(
                    'Create Account',
                    () => Auth().registration(
                        _emailController.text, _passwordController.text)),
                SizedBox(height: 17.0.h),
                Center(child: Text("--OR--")),
                SizedBox(height: 17.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/google.png',
                          width: 24.0.w,
                          height: 24.0.h,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/facebook.png',
                          width: 24.0.w,
                          height: 24.0.h,
                        )),
                  ],
                ),
                SizedBox(height: 58.0.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already an user? ',
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Log In',
                          style: TextStyle(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.violetColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(login),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

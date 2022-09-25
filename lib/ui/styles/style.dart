import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static TextStyle myTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.0.sp,
  );

  static InputDecoration textFieldDecoration(hintText) => InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black),
      );

  progressDialog(context) => showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: Container(
            height: 100.0.h,
            child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 3.0.h),
                Text("Processing"),
              ],
            ),
          ),
        );
      });
}

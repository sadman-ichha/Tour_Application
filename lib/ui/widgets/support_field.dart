// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget supportField(String title, value) {
  TextEditingController _supportDataController =
      TextEditingController(text: value);

  return Column(
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
        ),
      ),
      TextField(
        controller: _supportDataController,
        readOnly: true,
        style: TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            width: 1.8.w,
            color: Colors.green,
          )),
        ),
      ),
    ],
  );
}

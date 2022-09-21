import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextField(String title, {maxLine}) {
  return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
      ),
      Container(
        decoration: BoxDecoration(
          color: Color(0xFFC4C4C4),
          borderRadius: BorderRadius.all(
            Radius.circular(7.r),
          ),
      ),
      child: 
      TextField(
          maxLines: maxLine,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 20.0),
          ),
      ),
      ),
    ],
  );
}

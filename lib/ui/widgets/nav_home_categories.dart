import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shelter/const/app_colors.dart';

Widget navHomeCategories(String categoryName, onClick) {
  return Padding(
    padding: EdgeInsets.only(left:28.0.w, right: 28.0.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryName,
          style: TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            "See All",
            style: TextStyle(
                fontSize: 14.0.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.violetColor),
          ),
        ),
      ],
    ),
  );
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget drawerItems(String itemsName, onClick) {
  return InkWell(
    onTap: onClick,
    child: Text(
      itemsName,
      style: TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.w400),
    ),
  );
}

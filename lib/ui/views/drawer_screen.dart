import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shelter/ui/widgets/drawer_items.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 50.0.h, left: 20.0.w, bottom: 36.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Shelter",
                  style: TextStyle(
                      fontSize: 32.0.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              Text("Travel Agency",
                  style: TextStyle(
                      fontSize: 15.0.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black)),
              SizedBox(height: 32.0.h),
              drawerItems('Support', () {}),
              SizedBox(height: 8.0.h),
              drawerItems('Privacy', () {}),
              SizedBox(height: 8.0.h),
              drawerItems('FAQ', () {}),
              SizedBox(height: 8.0.h),
              drawerItems('Rate US', () {}),
              SizedBox(height: 8.0.h),
              drawerItems('How to use', () {}),
              Expanded(child: SizedBox()),
              InkWell(
                onTap: () {},
                child: Text(
                  'Settings',
                  style:
                      TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

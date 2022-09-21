import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/ui/views/bottom_nav_controller/nav_controller.dart';
import 'package:shelter/ui/views/drawer_screen.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  Future _exitDialog(context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text('Are You Sure to Close')),
            content: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 35.0.w),
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text('No'),
                  ),
                ),
                SizedBox(width: 50.0.w),
                ElevatedButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: Text('Yes'),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _exitDialog(context);
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
        
          body: Stack(children: [
            DrawerScreen(),
            BottomNavControllerScreen(),
          ]),
        ),
      ),
    );
  }
}

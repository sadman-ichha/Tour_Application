import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shelter/ui/theme/app_theme.dart';
import 'package:shelter/ui/widgets/drawer_items.dart';

import '../../route/route.dart';

class Setting extends StatelessWidget {
  RxBool _darkMode = false.obs;

  GetStorage? isDark;
  final box = GetStorage();

  Future _logOut(context) async {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              title: Text("Are you sure to logout?"),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () => Get.back(), child: Text("No")),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut().then((value) =>
                            Fluttertoast.showToast(msg: "Logout Successfull."));
                        await box.remove('uid');
                        Get.toNamed(splash);
                      },
                      child: Text("Yes")),
                ],
              ));
        });
  }

  Future _changeLanguage(context) async {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Select your language!"),
            content: Container(
              height: 150.h,
              child: Column(
                children: [
                  TextButton(
                      onPressed: () => Get.updateLocale(Locale('bn', 'BD'))
                          .then((value) => Get.back()),
                      child: Text("Bangla",
                          style: TextStyle(
                            fontSize: 17.0.sp,
                            fontWeight: FontWeight.w300,
                          ))),
                  TextButton(
                      onPressed: () => Get.updateLocale(Locale("en", "US")).then((value) => Get.back()),
                      child: Text("English",
                          style: TextStyle(
                            fontSize: 17.0.sp,
                            fontWeight: FontWeight.w300,
                          ))),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Settings",
              style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w400,
              )),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 33.0.w, right: 33.0.w, top: 30.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "darkMode".tr,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                  ),
                  Obx(
                    () => Switch(
                        value: _darkMode.value,
                        onChanged: (bool values) {
                          _darkMode.value = values;

                          Get.changeTheme(
                            _darkMode.value == false
                                ? AppTheme().lightTheme(context)
                                : AppTheme().darkTheme(context),
                          );
                        }),
                  )
                ],
              ),
              drawerItems("profile".tr, () => Get.toNamed(userprofile)),
              SizedBox(height: 11.0.h),
              drawerItems("language".tr, () => _changeLanguage(context)),
              SizedBox(height: 11.0.h),
              drawerItems("logout".tr, () => _logOut(context)),
            ],
          ),
        ),
      ),
    );
  }
}

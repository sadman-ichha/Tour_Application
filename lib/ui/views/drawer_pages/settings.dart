import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/ui/widgets/drawer_items.dart';

class Setting extends StatelessWidget {
  RxBool _darkMode = false.obs;

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
                  ElevatedButton(onPressed: () {}, child: Text("Yes")),
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
                    onPressed: () {},
                    child: Text("Bangla",
                    
                    
                    )),
                  TextButton(
                    onPressed: () {},
                    child: Text("English"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  "Dark Mode",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                ),
                Obx(
                  () => Switch(
                      value: _darkMode.value,
                      onChanged: (bool values) {
                        _darkMode.value = values;
                      }),
                )
              ],
            ),
            drawerItems("Profile", () {}),
            SizedBox(height: 11.0.h),
            drawerItems("Languages", () =>_changeLanguage(context)),
            SizedBox(height: 11.0.h),
            drawerItems("LogOut", () => _logOut(context)),
          ],
        ),
      ),
    );
  }
}

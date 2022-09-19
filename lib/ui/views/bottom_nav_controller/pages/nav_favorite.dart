// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavFavorite extends StatelessWidget {
  // RxBool _isCheckbox = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w),
        child: ListView.builder(
            itemCount: 12,
            itemBuilder: (_, index) {
              return Card(
                elevation: 3,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 110.0.h,
                            child: Image.asset(
                              "assets/images/debtakhum.jpeg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 31.0.w),
                        Expanded(
                            flex: 1,
                            child: navFavText("Title", "Description", "Cost")),
                        // Obx(
                        //   () => Checkbox(
                        //       value: _isCheckbox.value,
                        //       onChanged: (bool? values) {
                        //         _isCheckbox.value = values!;
                        //       }),
                        // ),

                        Positioned(
                          child: CircleAvatar(
                            backgroundColor: Colors.white12,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.close_outlined),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

Widget navFavText(String title, String description, cost) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 17.0.sp, fontWeight: FontWeight.w500),
      ),
      Text(
        description,
        style: TextStyle(fontSize: 17.0.sp, fontWeight: FontWeight.w500),
      ),
      Text(
        cost,
        style: TextStyle(fontSize: 17.0.sp, fontWeight: FontWeight.w600),
      ),
    ],
  );
}

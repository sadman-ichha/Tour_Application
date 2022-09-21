import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/widgets/custom_text_field.dart';
import 'package:shelter/ui/widgets/violet_button.dart';

class NavAdd extends StatelessWidget {
  const NavAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 25.0.w,right: 25.0.w,top: 10.0.h),
          child: Column(
            
            children: [
              Text("Fill out the form and start the journey",
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.w300,
                  )),
              SizedBox(height: 20.h),
              customTextField("Owner Name" ),
              customTextField("Description"),
              customTextField("Cost"),
              customTextField("Facilities",maxLine: 3),
              customTextField("Destination"),
               SizedBox(height: 30.h),
              VioletButton('Next', ()=> Get.toNamed(navaddlaststep)),
            ],
          ),
        ),
      ),
    );
  }
}

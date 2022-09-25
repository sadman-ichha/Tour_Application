import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/widgets/custom_text_field.dart';
import 'package:shelter/ui/widgets/violet_button.dart';

class NavAdd extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _costController = TextEditingController();
  TextEditingController _facilityController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 10.0.h),
          child: Column(
            children: [
              Text("Fill out the form and start the journey",
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.w300,
                  )),
              SizedBox(height: 20.h),
              customTextField("Owner Name", _nameController),
              customTextField("Description",_descriptionController),
              customTextField("Cost",_costController),
              customTextField("Facilities",_facilityController, maxLine: 3),
              customTextField("Destination",_destinationController),
              SizedBox(height: 30.h),
              VioletButton('Next', () => Get.toNamed(navaddlaststep)),
            ],
          ),
        ),
      ),
    );
  }
}

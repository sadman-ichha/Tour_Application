import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shelter/ui/widgets/custom_text_field.dart';

class NavAddLastStep extends StatelessWidget {
  const NavAddLastStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 10.0.h),
          child: Column(
            children: [
              Text("Fill out the form and start the journey",
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.w300,
                  )),
              SizedBox(height: 20.h),
              customTextField("Phone Number"),
              customTextField('Destination Date & Time'),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Choose Images',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Container(
                height: 100.h,
                decoration: BoxDecoration(
                  color: Color(0xFFE9EBED),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                ),
                child: ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

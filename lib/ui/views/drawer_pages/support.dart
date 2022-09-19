import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shelter/ui/widgets/support_field.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       appBar: AppBar(
          title: Text("Support",style: TextStyle(
            fontSize: 24.0.sp, fontWeight: FontWeight.w400,
          ),),
        
       ),
       body: Padding(
         padding:  EdgeInsets.only(left: 25.0.w,right: 20.0.w,top: 20.0.h),
         child: Column(
          children: [
            Text('If you have any problems , please contact us . We are at your service all the time.',style: TextStyle(
              fontSize: 20.0.sp, fontWeight: FontWeight.w300,
            ),),
            SizedBox(height: 20.0.h),
            supportField("Phone Number", "01749784788" ),
            SizedBox(height: 26.0.h),
            supportField("Email Address", "sadmanichha@gmail.com"),
            SizedBox(height: 26.0.h),
            supportField("Facebook", "https://www.facebook.com/sadmanichha/",),
            SizedBox(height: 26.0.h),
          ],
         ),
       ),
      ),
    );
  }
}
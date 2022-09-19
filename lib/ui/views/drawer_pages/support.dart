import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shelter/ui/widgets/support_field.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text("Support",style: TextStyle(
          fontSize: 24.0.sp, fontWeight: FontWeight.w400,
        ),),
      
     ),
     body: Column(
      children: [
        Text('If you have any problems , please contact us . We are at your service all the time.',style: TextStyle(
          fontSize: 20.0.sp, fontWeight: FontWeight.w300,
        ),),
        supportField("Phone Number", "01749784788"),
        supportField("Email Address", "sadmanichha@gmail.com"),
        supportField("Facebook", "https://www.facebook.com/sadmanichha/"),
      ],
     ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget supportField(String title,value) {

TextEditingController _supportDataController = TextEditingController(text: value);

  return Column(
    children: [
      Text(title,style: TextStyle(
          fontSize: 20.sp,
        ),),
        TextField(
          controller: _supportDataController,
          readOnly: true,
        ),
    ],
  );
}

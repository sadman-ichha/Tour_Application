
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget detailsHeadingDescription(String title,String description) {
  return Padding(
    padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 20.0.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.w600),
        ),
       
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            description,
            style: TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.w300),
          ),
        ),
        SizedBox(height: 14.0.h),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/const/app_colors.dart';

class VioletButton extends StatelessWidget {
  
  String title;
  final Function onAction;
  VioletButton(this.title, this.onAction);

  RxBool _value = false.obs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _value.value = true;
        onAction();
      },
      child: Obx(
        () => Container(
          height: 42.0.h,
          decoration: BoxDecoration(
            color: AppColors.violetColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
          ),
          child: _value == false
              ? Center(
                  child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0.sp,
                      fontWeight: FontWeight.w500),
                ))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Please Wait",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 5.0.w),
                    Transform.scale(
                      scale: 0.4,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/const/app_colors.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/styles/style.dart';
import 'package:shelter/ui/views/privacy_policy.dart';
import 'package:shelter/ui/widgets/violet_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UserFormScreen extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  Rx<TextEditingController> _dobController = TextEditingController().obs;

  Widget FormField(controller, keytype, hint) {
    return TextFormField(
      controller: controller,
      keyboardType: keytype,
      decoration: AppStyle.textFieldDecoration(hint),
    );
  }

  final currentDate = DateTime.now();

  _selectedDate(BuildContext context) async {
    final showDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1980),
      lastDate: DateTime(2035),
    );

    if (showDate != null && showDate != currentDate) {
      _dobController.value.text =
          "${showDate.day}-${showDate.month}-${showDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w, top: 40.0.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tell Us More About You.",
                  style: TextStyle(
                    fontSize: 31.0.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.violetColor,
                  ),
                ),
                SizedBox(height: 8.0.h),
                Text(
                  "We will not share your information outside this application.",
                  style: TextStyle(
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 50.0.h),
                FormField(_nameController, TextInputType.name, 'Full Name'),
                FormField(
                    _phoneNumController, TextInputType.phone, 'Phone Number'),
                FormField(_addressController, TextInputType.text, 'Address'),
                Obx(
                  () => TextFormField(
                    controller: _dobController.value,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Date of Birth',
                      hintStyle: TextStyle(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      suffixIcon: IconButton(
                          onPressed: () => _selectedDate(context),
                          icon: Image.asset(
                            'assets/icons/calendar.png',
                            width: 22.0.w,
                            height: 22.0.h,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 30.0.h),
                ToggleSwitch(
                  totalSwitches: 2,
                  labels: ['Male', 'Female'],
                  customTextStyles: [
                    TextStyle(fontSize: 13.0.sp, fontWeight: FontWeight.w400)
                  ],
                  initialLabelIndex: 0,
                  activeBgColor: [Color(0xFFFC4646)],
                  minWidth: 79.0.w,
                  minHeight: 29.0.h,
                  cornerRadius: 3.0.r,
                  onToggle: (_) {
                    print('switched to: $_');
                  },
                ),
                SizedBox(height: 128.0.h),
                VioletButton('Submit', () => Get.toNamed(privacypolicy)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

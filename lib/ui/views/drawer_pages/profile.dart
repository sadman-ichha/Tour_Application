import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../business_logics/form.dart';
import '../../../const/app_colors.dart';
import '../../styles/style.dart';
import '../../widgets/violet_button.dart';

class ProfileScreen extends StatelessWidget {
  String gender = 'Male';
  String? dob;
  Rx<DateTime> currentDate = DateTime.now().obs;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  Rx<TextEditingController> _dobController = TextEditingController().obs;

  Widget formField(controller, keytype, hint) {
    return TextFormField(
      controller: controller,
      keyboardType: keytype,
      decoration: AppStyle.textFieldDecoration(hint),
    );
  }

  _selectedDate(BuildContext context) async {
    final showDate = await showDatePicker(
      context: context,
      initialDate: currentDate.value,
      firstDate: DateTime(1990),
      lastDate: DateTime(2035),
    );

    if (showDate != null && showDate != currentDate) {
      dob = "${showDate.day}-${showDate.month}-${showDate.year}";
      _dobController.value.text = dob!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Profile",
              style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w400,
              )),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w, top: 26.0.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                formField(_nameController, TextInputType.name, 'Full Name'),
                formField(
                    _phoneNumController, TextInputType.phone, 'Phone Number'),
                formField(_addressController, TextInputType.text, 'Address'),
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
                  onToggle: (index) {
                    if (index == 0) {
                      gender = 'Male';
                    } else {
                      gender = 'Female';
                    }
                  },
                ),
                SizedBox(height: 128.0.h),
                VioletButton(
                    'Submit',
                    () => UsersInfo().sendFormDataToDB(
                        _nameController.text,
                        int.parse(_phoneNumController.text),
                        _addressController.text,
                        dob!,
                        gender)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

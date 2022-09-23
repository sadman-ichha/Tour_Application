import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../business_logics/form.dart';
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

  setUserData(userData, context) {
    _nameController.text = userData['name'];
    _phoneNumController.text = userData["phone"].toString();
    _addressController.text = userData["address"];
    _dobController.value.text = userData["dob"];
    gender = "gender";

    return Padding(
      padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w, top: 26.0.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            formField(_nameController, TextInputType.name, 'Full Name'),
            formField(_phoneNumController, TextInputType.phone, 'Phone Number'),
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
            VioletButton('Update', () => updateData()),
          ],
        ),
      ),
    );
  }

  updateData() async {
    try {
      CollectionReference registerData =
          FirebaseFirestore.instance.collection("users-form-data");
      final user = FirebaseAuth.instance.currentUser!.email;
      registerData
          .doc(user)
          .update({
            'name': _nameController.text,
            'phone': _phoneNumController.text,
            'address': _addressController.text,
            'dob': _dobController.value.text,
            'gender': gender,
          })
          .whenComplete(
              () => Fluttertoast.showToast(msg: "Update Successfully"))
          .then((value) => Get.back());
    } catch (e) {
      Fluttertoast.showToast(msg: "Something is wrong");
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
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users-form-data")
                .doc(FirebaseAuth.instance.currentUser!.email)
                .snapshots(),
            builder: (BuildContext userData, AsyncSnapshot snapshot) {
              var userData = snapshot.data;

              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              } else {
                return setUserData(userData, context);
              }
            }),
      ),
    );
  }
}

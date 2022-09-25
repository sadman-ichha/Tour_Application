import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/violet_button.dart';

class NavAddLastStep extends StatefulWidget {
  @override
  State<NavAddLastStep> createState() => _NavAddLastStepState();
}

class _NavAddLastStepState extends State<NavAddLastStep> {
  TextEditingController _phoneController = TextEditingController();
  Rx<TextEditingController> _dateTimeController = TextEditingController().obs;
  Future multipleImagePicker() async {
    images = await _picker.pickMultiImage();
    setState(() {});
  }

  final ImagePicker _picker = ImagePicker();

  List<XFile>? images;

  Rx<DateTime> currentDate = DateTime.now().obs;
  String? dob;

  _selectedDate(context) async {
    final showDate = await showDatePicker(
      context: context,
      initialDate: currentDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (showDate != null && showDate != currentDate) {
      dob = "${showDate.day}-${showDate.month}-${showDate.year}";
      _dateTimeController.value.text = dob!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 10.0.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Fill out the form and start the journey",
                    style: TextStyle(
                      fontSize: 24.0.sp,
                      fontWeight: FontWeight.w300,
                    )),
                SizedBox(height: 20.h),
                customTextField("Phone Number", _phoneController),
                
                Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Destination Date & Time',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18.sp),
                      ),
                      Container( 
                        decoration: BoxDecoration(
                          color: Color(0xFFC4C4C4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7.r),
                          ),
                        ),
                        child: TextField(
                          controller: _dateTimeController.value,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            
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
                    ],
                  );
                }),
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
                  height: 152.h,
                  width: 375.0.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFE9EBED),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.r),
                    ),
                  ),
                  child: IconButton(
                      onPressed: () => multipleImagePicker(),
                      icon: Icon(Icons.add_a_photo)),
                ),
                Container(
                  height: 200.0.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images?.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Container(
                              width: 150.0.w,
                              child: images?.length == null
                                  ? null
                                  : Image.file(
                                      File(images![index].path),
                                      fit: BoxFit.cover,
                                    )),
                        );
                      }),
                ),
                SizedBox(height: 80.0.h),
                VioletButton("Upload", () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

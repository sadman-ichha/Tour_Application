import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shelter/const/app_colors.dart';
import 'package:shelter/ui/styles/style.dart';

class OnBoardingScreen extends StatelessWidget {
  List<String> _lottiefiles = [
    'assets/files/welcome.json',
    'assets/files/categories.json',
    'assets/files/support.json',
  ];

  List<String> _title = [
    'Welcome',
    'Categories',
    'Support',
  ];

  List<String> _description = [
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
  ];

  RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(right: 21.0.w, left: 32.0.w, bottom: 55.0.w),
        child: Column(
          children: [
            Obx(
              () => Expanded(
                  flex: 2,
                  child: Lottie.asset(_lottiefiles[_currentIndex.toInt()])),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBackgroundColors,
                  borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(4.0, 4.0),
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 5.0,
                      offset: Offset(-4.0, -4.0),
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 41.0.w, left: 30.0.w, bottom: 30.0.w, top: 30.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          _title[_currentIndex.toInt()],
                          style: AppStyle.myTextStyle,
                        ),
                      ),
                      Obx(
                        () => Text(
                          _description[_currentIndex.toInt()],
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 20.0.sp),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => DotsIndicator(
                              dotsCount: _lottiefiles.length,
                              position: _currentIndex.toDouble(),
                              decorator: DotsDecorator(
                                activeSize: Size(14.0.w, 14.0.h),
                                color: Color(0xFF737077),
                                activeColor: Colors.black,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (_currentIndex == 2) {
                                print("Closed");
                              }else{
                                _currentIndex + 1;
                              }
                            },
                            child: Container(
                              child: Icon(Icons.arrow_right),
                              height: 37.0.h,
                              width: 37.0.w,
                              decoration: BoxDecoration(
                                color: AppColors.scaffoldBackgroundColors,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10.0,
                                    offset: Offset(4.0, 4.0),
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 5.0,
                                    offset: Offset(-4.0, -4.0),
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/widgets/nav_home_categories.dart';

import '../search_screen.dart';

class NavHome extends StatelessWidget {
  final RxInt _currentIndex = 0.obs;

  final List _carouselImages = [
    'assets/images/cover-one.jpeg',
    'assets/images/cover-two.jpeg',
    'assets/images/cover-three.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 3.5,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 155.0.h,
                  onPageChanged: (currentIndex, customPageChangedReason) {
                    _currentIndex.value = currentIndex;
                  },
                ),
                items: _carouselImages.map((images) {
                  return Container(
                    margin: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage(images),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 5.h),
            Obx(
              () => DotsIndicator(
                dotsCount: _carouselImages.length,
                position: _currentIndex.value.toDouble(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 53.w, right: 52.w, top: 10.h, bottom: 10.h),
              child: InkWell(
                onTap: () => Get.toNamed(search),
                child: Container(
                  height: 45.0.h,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search_outlined,
                          size: 27.0.w,
                        ),
                        SizedBox(width: 15.0.w),
                        Text(
                          'Search for your next tour',
                          style: TextStyle(
                              fontSize: 15.0.sp, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 61.0.h),
            navHomeCategories('For You', () {}),
            SizedBox(height: 21.0.h),
            forYou(),
            
          ],
        ),
      ),
    );
  }
}

Widget forYou() {
  return Container(
    height: 180.0.h,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (_, index) {
          return Padding(
            padding:  EdgeInsets.only(right: 12.w),
            child: Container(
              width: 100.w,
                height: 180.h,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
              ),
              ),
            ),
          );
        }),
  );
}

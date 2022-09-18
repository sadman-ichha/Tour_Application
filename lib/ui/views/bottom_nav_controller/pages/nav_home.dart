import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/widgets/nav_home_categories.dart';
import '../search_screen.dart';
import '../see_all.dart';

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
        body: SingleChildScrollView(
          child: Column(
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
              SizedBox(height: 40.0.h),
              navHomeCategories('For You', ()=> Get.toNamed(seeall)),
              SizedBox(height: 3.0.h),
              forYou(),
              SizedBox(height: 16.h),
              navHomeCategories('Recently Added', () {}),
              SizedBox(height: 3.0.h),
              recentlyAdded(),
              SizedBox(height: 16.h),
              navHomeCategories('Top Places', () {}),
              SizedBox(height: 5.0.h),
              topPlaces(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget forYou() {
  return Container(
    height: 170.0.h,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: InkWell(
              onTap: ()=> Get.toNamed(detailsscreen),
              child: Container(
                width: 100.w,
                height: 180.h,
                decoration: BoxDecoration(
                  color: Color(0xFFC4C4C4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.0.r),
                          topRight: Radius.circular(7.0.r)),
                      child: Image.asset(
                        'assets/images/debtakhum.jpeg',
                        height: 115.0.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      'Title',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    Text(
                      'Cost',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
  );
}

Widget recentlyAdded() {
  return Container(
    height: 170.0.h,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 100.w,
                height: 180.h,
                decoration: BoxDecoration(
                  color: Color(0xFFC4C4C4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.0.r),
                          topRight: Radius.circular(7.0.r)),
                      child: Image.asset(
                        'assets/images/debtakhum.jpeg',
                        height: 115.0.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      'Title',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    Text(
                      'Cost',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
  );
}

Widget topPlaces() {
  return Container(
    height: 80.0.h,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (_, index) {
          return Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: Color(0xFFC4C4C4),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/debtakhum.jpeg'),
                  fit: BoxFit.cover),
            ),
          );
        }),
  );
}

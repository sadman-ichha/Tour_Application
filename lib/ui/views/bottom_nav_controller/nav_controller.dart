// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/const/app_colors.dart';
import 'package:shelter/ui/views/bottom_nav_controller/pages/nav_add.dart';
import 'package:shelter/ui/views/bottom_nav_controller/pages/nav_favorite.dart';
import 'package:shelter/ui/views/bottom_nav_controller/pages/nav_home.dart';

class BottomNavControllerScreen extends StatelessWidget {
  
  RxInt _currentIndex = 0.obs;

  RxBool _drawer = false.obs;

  final _pages = [
    NavHome(),
    NavAdd(),
    NavFavorite(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
          duration: Duration(milliseconds: 400),
          top: _drawer.value == false ? 0 : 100.0.h,
          bottom: _drawer.value == false ? 0 : 100.0.h,
          left: _drawer.value == false ? 0 : 200.0.w,
          right: _drawer.value == false ? 0 : -100.0.w,
          child: Container(
            decoration: BoxDecoration(),
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Shelter'),
                  leading: _drawer.value == false
                      ? IconButton(
                          onPressed: () => _drawer.value = true,
                          icon: Icon(
                            Icons.menu_outlined,
                            color: Colors.black,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            _drawer.value = false;
                          },
                          icon: Icon(
                            Icons.close_outlined,
                            color: Colors.black,
                          ),
                        ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  onTap: (values) => _currentIndex.value = values,
                  currentIndex: _currentIndex.value,
                  unselectedItemColor: Colors.black54,
                  selectedItemColor: AppColors.violetColor,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add_outlined), label: 'Add'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_outlined), label: 'Favorite'),
                  ],
                ),
                body: _pages[_currentIndex.value],
              ),
            ),
          ),
        ));
  }
}

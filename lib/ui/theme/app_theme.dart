// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shelter/const/app_colors.dart';

class AppTheme {
  ThemeData lightTheme(context) => ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          titleTextStyle: TextStyle(
              fontSize: 20.0.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        colorScheme: ColorScheme.light(),
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColors,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.black),
        ),
      );

  ThemeData darkTheme(context) {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            fontSize: 40.0.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      colorScheme: ColorScheme.dark(),
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
          )),
          
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.blue),
        trackColor:
            MaterialStateProperty.all(Color.fromARGB(255, 146, 171, 214)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white30,
        selectedItemColor: AppColors.violetColor,
      ),
    );
  }
}

import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shelter/const/app_colors.dart';
import 'package:shelter/const/app_string.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  Future<FirebaseApp> _initialize = Firebase.initializeApp(
    name: "Shelter",
    options: FirebaseOptions(
        apiKey: "AIzaSyCbBjH1urN-fOEk9yFn9d8zdZVV0iouu34",
        appId: '1:443932616909:android:4a941e1345313d3ff76184',
        messagingSenderId: '443932616909',
        projectId: "shelter-b78eb"),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialize,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: (context, child) {
        return GetMaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.white,
              centerTitle: true,
              elevation: 0.0,
              titleTextStyle: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColors,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme.apply(),
            ),
          ),
          initialRoute: splash,
          getPages: getPages,
          home: SplashScreen(),
        );
      },
    );
  }
}

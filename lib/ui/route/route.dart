import 'package:get/get.dart';
import 'package:shelter/ui/views/onBoarding_screen.dart';
import 'package:shelter/ui/views/splash_screen.dart';

const String splash = "/splash-screen";
const String onboarding = "/onboarding-screen";

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(name: onboarding, page: () => OnBoardingScreen()),
];

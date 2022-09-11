import 'package:get/get.dart';
import 'package:shelter/ui/views/auth/log-in-screen.dart';
import 'package:shelter/ui/views/auth/sign_up_screen.dart';
import 'package:shelter/ui/views/bottom_nav_controller/main_home_screen.dart';
import 'package:shelter/ui/views/onBoarding_screen.dart';
import 'package:shelter/ui/views/privacy_policy.dart';
import 'package:shelter/ui/views/splash_screen.dart';
import 'package:shelter/ui/views/user_form.dart';

const String splash = "/splash-screen";
const String onboarding = "/onboarding-screen";
const String signup = "/signup-screen";
const String login = "/login-screen";
const String userform = "/userform-screen";
const String privacypolicy = '/privacypolicy-screen';
const String mainhome = '/mainhome-screen';

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: onboarding,
    page: () => OnBoardingScreen(),
  ),
  GetPage(
    name: signup,
    page: () => SignUpScreen(),
  ),
  GetPage(
    name: login,
    page: () => LogInScreen(),
  ),
  GetPage(
    name: userform,
    page: () => UserFormScreen(),
  ),
  GetPage(
    name: privacypolicy,
    page: () => PrivecyPolicyScreen(),
  ),
  GetPage(
    name: mainhome,
    page: () => MainHomeScreen(),
  ),
];

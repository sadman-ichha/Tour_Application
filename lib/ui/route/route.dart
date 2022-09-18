import 'package:get/get.dart';
import 'package:shelter/ui/views/auth/log-in-screen.dart';
import 'package:shelter/ui/views/auth/sign_up_screen.dart';
import 'package:shelter/ui/views/bottom_nav_controller/search_screen.dart';
import 'package:shelter/ui/views/bottom_nav_controller/see_all.dart';
import 'package:shelter/ui/views/drawer_pages/faq.dart';
import 'package:shelter/ui/views/drawer_pages/how_to_use.dart';
import 'package:shelter/ui/views/drawer_pages/privacy.dart';
import 'package:shelter/ui/views/drawer_pages/settings.dart';
import 'package:shelter/ui/views/drawer_pages/support.dart';
import 'package:shelter/ui/views/onBoarding_screen.dart';
import 'package:shelter/ui/views/privacy_policy.dart';
import 'package:shelter/ui/views/splash_screen.dart';
import '../views/bottom_nav_controller/pages/details_screen.dart';
import '../views/drawer_pages/settings.dart';
import 'package:shelter/ui/views/user_form.dart';
import '../views/bottom_nav_controller/nav_controller.dart';
import '../views/main_home_screen.dart';

const String splash = "/splash-screen";
const String onboarding = "/onboarding-screen";
const String signup = "/sign-up-screen";
const String login = "/log-in-screen";
const String userform = "/user-form-screen";
const String privacypolicy = '/privacy-policy-screen';
const String mainhome = '/main-home-screen';
const String bottomnavcontroller = '/bottom-nav-controller-screen';
const String support = '/support-screen';
const String privacy = '/privacy-screen';
const String faq = '/faq-screen';
const String howtouse = '/how-to-use-screen';
const String setting = '/settings-screen';
const String search = '/search-screen';
const String detailsscreen = '/details-screen';
const String seeall = '/see-all-screen';

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
    page: () => PrivacyPolicyScreen(),
  ),
  GetPage(
    name: mainhome,
    page: () => MainHomeScreen(),
  ),
  GetPage(
    name: bottomnavcontroller,
    page: () => BottomNavControllerScreen(),
  ),
  GetPage(name: support, page: () => Support()),
  GetPage(name: privacy, page: () => Privacy()),
  GetPage(name: faq, page: () => Faq()),
  GetPage(name: howtouse, page: () => HowToUse()),
  GetPage(name: setting, page: () => Setting()),
  GetPage(name: search, page: () => SearchScreen()),
  GetPage(name: detailsscreen, page: () => DetailsScreen()),
  GetPage(name: seeall, page: () => SeeAll()),
];

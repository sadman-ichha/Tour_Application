import 'package:flutter/material.dart';
import 'package:shelter/ui/views/bottom_nav_controller/nav_controller.dart';
import 'package:shelter/ui/views/drawer_screen.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        DrawerScreen(),
        BottomNavControllerScreen(),
        
      ]),
    );
  }
}
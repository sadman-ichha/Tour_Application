import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shelter/ui/widgets/violet_button.dart';


class PrivecyPolicyScreen extends StatelessWidget {
  const PrivecyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

         body: Padding(
           padding:  EdgeInsets.only(bottom: 72.0,left: 5.0,right: 5.0),
           child: Column( 
        children: [
            Expanded(child: Container(
              color: Colors.blue,
            ),
            
            ),
            SizedBox(height: 46.0.h),
            VioletButton('Agree', (){})
        ],
       ),
         ),
      ),
    );
  }
}
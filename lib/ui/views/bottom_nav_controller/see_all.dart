import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('See All')),
      body: GridView.builder(
        itemCount: 20,
          // ignore: prefer_const_constructors
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (_, index) {
            
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(7.0.r),
                ),
              ),
              child: ClipRRect(
                borderRadius : BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                child: Image.asset(
                  'assets/images/debtakhum.jpeg',
                  fit: BoxFit.cover,
                  height: 115.0.h,
                ),
              ),
            );
          }),
    );
  }
}

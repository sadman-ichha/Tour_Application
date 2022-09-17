import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              EdgeInsets.only(left: 53.w, right: 52.w, top: 10.h, bottom: 10.h),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  
                  hintText: "Search for your next tour",
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search_outlined),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

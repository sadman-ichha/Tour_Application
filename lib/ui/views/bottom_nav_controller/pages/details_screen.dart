import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/details_heading_description.dart';

class DetailsScreen extends StatelessWidget {
  RxInt _currentIndex = 0.obs;
  final List _carouselImages = [
    'assets/images/cover-one.jpeg',
    'assets/images/cover-two.jpeg',
    'assets/images/cover-three.jpeg',
  ];

  String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  String facilities =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  String destination =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details',
            style: TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.w400)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.black,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 3.5,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 300.h,
                        onPageChanged: (currentIndex, customPageChangedReason) {
                          _currentIndex.value = currentIndex;
                        },
                      ),
                      items: _carouselImages.map((image) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                                image: AssetImage(image), fit: BoxFit.cover),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  detailsHeadingDescription('Description', description),
                  detailsHeadingDescription('Facilities', facilities),
                  detailsHeadingDescription('Destination', destination),
                  detailsHeadingDescription(
                      "Destination Date & Time", destination),
                  detailsHeadingDescription("Cost", '3000 Taka'),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Owner Name',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.sp)),
                    Row(
                
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.call_outlined)),
                            SizedBox(width: 8.0.w),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.message_outlined)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

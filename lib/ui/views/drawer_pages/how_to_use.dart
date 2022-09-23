import 'package:better_player/better_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HowToUse extends StatelessWidget {
  const HowToUse({Key? key}) : super(key: key);

  Future getVideo() async {
    var firestore = FirebaseFirestore.instance;
    final querySnapshot =
        firestore.collection("how_to_use").doc("00002222").get();
    return querySnapshot;
  }

  videoView(video) {
    return BetterPlayer.network(
      video["url"],
      betterPlayerConfiguration: BetterPlayerConfiguration(
        autoPlay: true,
        placeholderOnTop: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("How to use",
            style: TextStyle(
              fontSize: 24.0.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
      body: FutureBuilder(
          future: getVideo(),
          builder: (BuildContext video, AsyncSnapshot snapshot) {
            var video = snapshot.data;
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: CircularProgressIndicator());
            } else {
              return videoView(video);
            }
          }),
    );
  }
}

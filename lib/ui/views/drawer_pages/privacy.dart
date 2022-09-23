import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Privacy extends StatelessWidget {
  RxBool _loaded = false.obs;
  // PdfViewerController? _pdfViewerController;

  Future getData() async {
    var fireStore = FirebaseFirestore.instance;
    final querySnapshot =
        await fireStore.collection("privacy").doc("00001111").get();
    return querySnapshot;
  }

 showPrivacy(data) {
    return SfPdfViewer.network(
      data['url'],
      onDocumentLoaded: (PdfDocumentLoadedDetails details) {
        _loaded.value = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Privacy",
              style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w400,
              )),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (BuildContext data, AsyncSnapshot snapshot) {
              var data = snapshot.data;
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              } else {
                return showPrivacy(data);
              }
            }),
      ),
    );
  }
}

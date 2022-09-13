import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/widgets/violet_button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final RxBool _loaded = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(bottom: 72.0, left: 5.0, right: 5.0),
          child: Column(
            children: [
              Expanded(
                child: SfPdfViewer.network(
                  'https://firebasestorage.googleapis.com/v0/b/shelter-b78eb.appspot.com/o/privacy-policy%2Fprivacy-policy.pdf?alt=media&token=48f4b994-98f3-43e6-8c5e-e23aba308c16',
                  onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                    _loaded.value = true;
                  },
                ),
              ),
              SizedBox(height: 46.0.h),
              Obx(
                () => _loaded == true
                    ? VioletButton(
                        'Agree',
                        () => Get.toNamed(mainhome),
                      )
                    : CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

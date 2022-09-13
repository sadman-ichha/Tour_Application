import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shelter/ui/route/route.dart';
import 'package:shelter/ui/views/privacy_policy.dart';

class UsersInfo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  sendFormDataToDB(
    String name,
    int phone,
    String address,
    String dob,
    String gender,
    
  ) async {
    try {
      CollectionReference _usersInfo =
          FirebaseFirestore.instance.collection('users-from-data');
      _usersInfo.doc(_auth.currentUser!.email).set({
        'Name': name,
        'Phone': phone,
        'Address': address,
        'Dob': dob,
        'Gender': gender,
      }).whenComplete(() {
        Fluttertoast.showToast(msg: 'Added Successfully');
        Get.toNamed(privacypolicy);
      });
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error $e');
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shelter/ui/route/route.dart';

class Auth {
  final box = GetStorage();

  Future registration(String emailAddress, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);

      var authCredential = userCredential.user;

      if (authCredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: "Registration Successful");
        box.write('uid', authCredential.uid);
        Get.toNamed(userform);
      } else {
        print('SignUp Failed');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error is: $e");
    }
  }

  Future login(String emailAddress, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);

      var authCredential = userCredential.user;

      if (authCredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: "Login Successful");
        box.write('uid', authCredential.uid);
        Get.toNamed(mainhome);
      } else {
        print('SignUp Failed');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error is: $e");
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/pages.dart';

class LoginController extends GetxController {
  var email = TextEditingController().obs;
  var pass = TextEditingController().obs;

  void loginUser(email, pass) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      Get.snackbar("Operation Successful", "User Logged!");
      Get.offAllNamed(Routes.DASHBOARD);
    }).catchError((error) {
      var a = error.code;
      var b = error.message;
      Get.snackbar("Issue", "Login terminated,$b!, give a try later");
    });
  }
}

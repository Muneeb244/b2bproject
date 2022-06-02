import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/order.dart';
import '../models/user.dart';
import '../routes/pages.dart';

class SignUpController extends GetxController {
  var name = TextEditingController().obs;
  var email = TextEditingController().obs;
  var pass = TextEditingController().obs;
  void createUser(email, pass) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) async {
      var loggedUser = FirebaseAuth.instance.currentUser!;
      Users user = Users(
          name: name.value.text,
          email: loggedUser.email ?? "",
          phone: loggedUser.phoneNumber ?? "",
          address1: "",
          address2: "",
          zipCode: "",
          myOrders: <Order>[]);
      var userJson = user.toJson();
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(loggedUser.uid)
          .set(userJson);
      Get.snackbar("Operation Succesfull", "User created!!");
      Get.offAllNamed(Routes.DASHBOARD);
    }).catchError((error) {
      var a = error.code;
      var b = error.message;
      Get.snackbar("Attention", "Signup rejected,$b!, try again later");
    });
  }
}

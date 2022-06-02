import 'package:b2bproject/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingController extends GetxController {
  var address1 = TextEditingController().obs;
  var address2 = TextEditingController().obs;
  var phone = TextEditingController().obs;
  var postCode = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 0), () async {
      await getShippings();
    });
  }

  Future<void> getShippings() async {
    var user = await getMyData();
    address1.value.text = user.address1!;
    address2.value.text = user.address2!;
    phone.value.text = user.phone!;
    postCode.value.text = user.zipCode!;
    update();
  }

  Future<void> setMyData(Map<String, dynamic> json) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .set(json, SetOptions(merge: true));
  }

  Future<Users> getMyData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    var use =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();

    var a = use.data()!;
    print(a);
    var user = Users.fromJson(a);
    return user;
  }
}

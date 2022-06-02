import 'package:b2bproject/models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  Future<List<Order>> getMyOrders() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var ord =
        FirebaseFirestore.instance.collection('Users').doc(uid).snapshots();
    List<Order> orders = <Order>[];
    ord.listen((event) async {
      var a = event.data()!['myOrders'];
      for (var element in a) {
        orders.add(Order.fromJson(element));
      }
    });
    return orders;
    // event((DocumentSnapshot<Map<String, dynamic>> doc) {
    // signalsAll.add(SignalItem.fromDocument(doc));
    // });
    // signals();
  }
}

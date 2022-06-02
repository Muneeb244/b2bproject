import 'package:b2bproject/controller/payment.dart';
import 'package:b2bproject/elements/widgets/index.dart';
import 'package:b2bproject/models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.dart';
import '../models/user.dart';
import '../routes/pages.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var datas = Get.arguments;
    final PaymentController controller =
        Get.put(PaymentController(), tag: 'payController');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar("Checkout", context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              top: 20.0,
              left: 20,
            ),
            child: Row(
              children: const [
                Text(
                  "Pay in full.",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            top: 5.0,
                            left: 20,
                          ),
                          child: Row(
                            children: const [
                              Text(
                                "Credit or Debit Card",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      bottom: 10,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "Visa, Mastercard, Amex, Discover, UnionPay",
                          style: TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              top: 5.0,
              left: 20,
              bottom: 10,
            ),
            child: Row(
              children: const [
                Text(
                  "Enter your card information:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 0.0, left: 20),
            child: SizedBox(
              width: double.maxFinite,
              child: TextField(
                controller: controller.creditNumber.value,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Credit/Debit Card Number",
                  filled: true,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20.0, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                    child: TextField(
                  controller: controller.expiry.value,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "MM/YY",
                    filled: true,
                  ),
                )),
                const SizedBox(
                  width: 20.0,
                ),
                Flexible(
                    child: TextField(
                  controller: controller.cvc.value,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  maxLength: 3,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "CVV",
                    filled: true,
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              top: 20.0,
              left: 20,
              bottom: 10,
            ),
            child: Row(
              children: const [
                Text(
                  "By placing order. you agree to our terms and conditions",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: () async {
                if (controller.creditNumber.value.text.isEmpty) {
                  Get.snackbar(
                      "Error", "Credit/Debit Card Number field is empty!!");
                  return;
                }
                if (controller.expiry.value.text.isEmpty) {
                  Get.snackbar("Error", "Date field is empty!!");
                  return;
                }
                if (controller.cvc.value.text.isEmpty) {
                  Get.snackbar("Error", "CVV field is empty!!");
                  return;
                }

                var a = await FirebaseFirestore.instance
                    .collection('helpers')
                    .doc('X4clWNaX9JObCAECruAj')
                    .get();
                var data = a.data()!;
                var x = data['orderID'];

                DateTime now = DateTime.now();
                var order = Order(
                    id: x,
                    product: Product.fromJson(datas[1]),
                    date: "${now.day}-${now.month}-${now.year}",
                    status: 'Paid');
                var orders = order.toJson();
                var usery = FirebaseAuth.instance.currentUser!;
                await FirebaseFirestore.instance
                    .collection('helpers')
                    .doc('X4clWNaX9JObCAECruAj')
                    .update({'orderID': FieldValue.increment(1)});
                await FirebaseFirestore.instance
                    .collection('Users')
                    .doc(usery.uid)
                    .set({
                  'myOrders': FieldValue.arrayUnion([orders])
                }, SetOptions(merge: true));

                var clientOrder = orders;
                Users addressUser = Users.fromJson(datas[0]);

                clientOrder['address'] =
                    addressUser.address1! + addressUser.address2!;
                clientOrder['phone'] = addressUser.phone;
                clientOrder['email'] = usery.email;
                await FirebaseFirestore.instance
                    .collection('orders')
                    .add(clientOrder);

                Get.snackbar("Success", "Order is placed!");
                Get.offAllNamed(Routes.DASHBOARD);
                // controller.loginUser(
                //     controller.email.value.text, controller.pass.value.text);
              },
              child: Container(
                alignment: Alignment.center,
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Place Order",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: navigation(),
    );
  }
}

import 'package:b2bproject/controller/shipping.dart';
import 'package:b2bproject/elements/widgets/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/pages.dart';

class ShippingPage extends StatelessWidget {
  const ShippingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    final ShippingController controller =
        Get.put(ShippingController(), tag: 'shipController');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar("Shipping Details",context),
      body: Column(
        children: [
          Obx(() {
            return Padding(
              padding: const EdgeInsets.only(right: 20, top: 20.0, left: 20),
              child: SizedBox(
                width: double.maxFinite,
                child: TextField(
                  controller: controller.address1.value,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Address line 1",
                    filled: true,
                  ),
                ),
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20.0, left: 20),
            child: SizedBox(
              width: double.maxFinite,
              child: TextField(
                controller: controller.address2.value,
                keyboardType: TextInputType.streetAddress,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Address line 2",
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
                  controller: controller.phone.value,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Phone",
                    filled: true,
                  ),
                )),
                const SizedBox(
                  width: 20.0,
                ),
                Flexible(
                    child: TextField(
                  controller: controller.postCode.value,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "ZipCode/PostCode",
                    filled: true,
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: () async {
                if (controller.address1.value.text.isEmpty) {
                  Get.snackbar("Error", "Address1 field is empty!!");
                  return;
                }
                if (controller.address2.value.text.isEmpty) {
                  Get.snackbar("Error", "Address2 field is empty!!");
                  return;
                }
                if (controller.phone.value.text.isEmpty) {
                  Get.snackbar("Error", "Phone field is empty!!");
                  return;
                }
                if (controller.postCode.value.text.isEmpty) {
                  Get.snackbar("Error", "PostCode field is empty!!");
                  return;
                }

                var user = await controller.getMyData();

                user.address1 = controller.address1.value.text;
                user.address2 = controller.address2.value.text;
                user.phone = controller.phone.value.text;
                user.zipCode = controller.postCode.value.text;
                user.email = FirebaseAuth.instance.currentUser!.email;
                user.name = FirebaseAuth.instance.currentUser!.displayName;
                await controller.setMyData(user.toJson());
                Get.toNamed(Routes.PAYMENT,
                    arguments: [user.toJson(), data[0]]);
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
                  "Checkout",
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

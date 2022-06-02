import 'package:b2bproject/elements/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/pages.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar('Landing Page', context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BasicButton(
              fn: () {
                Get.toNamed(Routes.CATALOG);
              },
              title: "Explore Catalouge"),
          BasicButton(
              fn: () {
                Get.toNamed(Routes.ORDERS);
              },
              title: "Orders"),
          BasicButton(fn: () {}, title: "Chatbot"),
          BasicButton(fn: () {}, title: "Settings"),
        ],
      ),
      bottomNavigationBar: navigation(),
    );
  }
}

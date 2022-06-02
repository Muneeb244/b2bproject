import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../elements/widgets/index.dart';
import '../routes/pages.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar("B2B Supply Chain", context),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 400,
                height: 400,
                child: logo(),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.LOGINUSER);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  alignment: Alignment.center,
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: navigation(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/signup.dart';
import '../elements/widgets/index.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController controller =
        Get.put(SignUpController(), tag: 'signUpController');

    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: appBar("Sign Up",context),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        scale: 2,
                      ),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          width: 350,
                          child: TextField(
                            autocorrect: false,
                            controller: controller.name.value,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "name",
                              fillColor: Colors.black12,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          width: 350,
                          child: TextField(
                            controller: controller.email.value,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "email",
                              fillColor: Colors.black12,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: SizedBox(
                          width: 350,
                          child: TextField(
                            controller: controller.pass.value,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "password",
                              fillColor: Colors.black12,
                              filled: true,
                            ),
                            obscureText: true,
                            obscuringCharacter: "*",
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (controller.name.value.text.isEmpty) {
                            Get.snackbar("Error", "Name entry is empty!!");
                            return;
                          }
                          if (controller.email.value.text.isEmpty) {
                            Get.snackbar("Error", "Email entry is empty!!");
                            return;
                          }
                          if (controller.pass.value.text.isEmpty) {
                            Get.snackbar("Error", "Password entry is empty!!");
                            return;
                          }
                          controller.createUser(controller.email.value.text,
                              controller.pass.value.text);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 350,
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
                            "SignUp",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                            alignment: Alignment.center,
                            width: 350,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    "Already a member?",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: const Text(
                                      "Sign In",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  )
                                ])),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: navigation());
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/pages.dart';

AppBar appBar(String name, BuildContext context) {
  return AppBar(
    leading: IconButton(
        icon: const Icon(Icons.density_small_outlined),
        onPressed: () {
          Get.back();
        }),
    actions: [
      name != "B2B Supply Chain"
          ? IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                if (FirebaseAuth.instance.currentUser != null) {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                                color: Colors.white,
                                child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                await FirebaseAuth.instance
                                                    .signOut();
                                                Get.offAllNamed(
                                                    Routes.LOGINUSER);
                                              },
                                              child: Container(
                                                  color: Colors.blue,
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(20),
                                                    child: Text(
                                                      'Logout',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ],
                                    )))));
                      });
                }
              })
          : Container(),
    ],
    title: Text(
      name,
      style: const TextStyle(fontStyle: FontStyle.italic),
    ),
    centerTitle: false,
  );
}

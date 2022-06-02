import 'package:b2bproject/elements/widgets/index.dart';
import 'package:b2bproject/models/order.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/orders.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrdersController controller =
        Get.put(OrdersController(), tag: 'ordController');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar('My Orders', context),
      body: FutureBuilder(
          future: controller.getMyOrders(),
          builder: ((context, AsyncSnapshot<List<Order>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              List<Order>? orders = snapshot.data;
              if (orders!.isEmpty) {
                return const Center(child: Text('No Orders History'));
              }

              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: orders.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        child: SizedBox(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Status: ${orders[index].status}",
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Order Date: ${orders[index].date}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Order ID: ${orders[index].id}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              orders[index].product!.thumbnail!,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.fitWidth,
                                          placeholder: (context, url) => Center(
                                              child: CircularProgressIndicator(
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            "${orders[index].product!.title}",
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "\$${orders[index].product!.price}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }
            return const Center(child: Text("No Data"));
          })),
      bottomNavigationBar: navigation(),
    );
  }
}

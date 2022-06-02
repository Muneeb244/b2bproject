import 'package:b2bproject/controller/products.dart';
import 'package:b2bproject/elements/widgets/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.dart';
import '../routes/pages.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsController controller =
        Get.put(ProductsController(), tag: 'proController');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar('Explore catalouge', context),
      body: Center(
        child: FutureBuilder(
            future: controller.getProducts(),
            builder: ((context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                List<Product>? products = snapshot.data;
                if (products!.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CarouselSlider(
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.height),
                  items: products.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                          color: Colors.white,
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Center(
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: <Widget>[
                                                    Column(
                                                      children: [
                                                        CachedNetworkImage(
                                                          imageUrl:
                                                              i.thumbnail!,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.34,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                          filterQuality:
                                                              FilterQuality
                                                                  .high,
                                                          fit: BoxFit.fitWidth,
                                                          placeholder: (context, url) => Center(
                                                              child: CircularProgressIndicator(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor)),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              const Icon(
                                                                  Icons.error),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(i.title!,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                "\$${i.price!}",
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        24,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Get.toNamed(
                                                                    Routes
                                                                        .SHIPPING,
                                                                    arguments: [
                                                                      i.toJson()
                                                                    ]);
                                                              },
                                                              child: Container(
                                                                  color: Colors
                                                                      .blue,
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            20),
                                                                    child: Text(
                                                                      'Checkout',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  )),
                                                            )
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child: Text(i.desc!,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                        )
                                                      ],
                                                    )
                                                  ])))));
                                });
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 20),
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: i.thumbnail!,
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    child: Text(
                                      '${i.title}',
                                      style: const TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )),
                        );
                      },
                    );
                  }).toList(),
                );
              }
              return const Center(child: CircularProgressIndicator());
            })),
      ),
      bottomNavigationBar: navigation(),
    );
  }
}

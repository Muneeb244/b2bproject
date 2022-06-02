import 'package:b2bproject/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  Future<List<Product>> getProducts() async {
    var pro = await FirebaseFirestore.instance.collection('products').get();
    List<Product> products = <Product>[];
    for (var element in pro.docs) {
      var data = element.data();
      products.add(Product.fromJson(data));
    }
    return products;
  }
}

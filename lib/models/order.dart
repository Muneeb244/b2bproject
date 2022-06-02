import 'product.dart';

class Order {
  int? id;
  String? status;
  String? date;
  Product? product;

  Order({this.id, this.product, this.date, this.status});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    status = json['status'] ?? '';
    date = json['createdDate'] ?? '';
    product = Product.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product'] = this.product!.toJson();
    data['status'] = this.status;
    data['createdDate'] = this.date;
    return data;
  }
}

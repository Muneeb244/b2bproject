import 'order.dart';

class Users {
  String? name;
  String? email;
  String? phone;
  String? zipCode;
  String? address1;
  String? address2;
  List<Order>? myOrders;

  Users(
      {this.name,
      this.email,
      this.phone,
      this.address1,
      this.address2,
      this.zipCode,
      this.myOrders});

  Users.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    phone = json['phone'] ?? '';
    address1 = json['address1'] ?? '';
    address2 = json['address2'] ?? '';
    zipCode = json['zipCode'] ?? '';
    if (json['myOrders'] != null) {
      myOrders = <Order>[];
      json['myOrders'].forEach((v) {
        myOrders!.add(Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['zipCode'] = this.zipCode;

    if (myOrders != null) {
      var alpha = <Map<String, dynamic>>[];
      myOrders!.forEach((v) {
        // myOrders!.add(Order.fromJson(v));
        alpha.add(v.toJson());
      });
      data['myOrders'] = alpha;
    }

    return data;
  }
}

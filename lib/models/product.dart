class Product {
  int? id;
  double? price;
  String? desc;
  String? thumbnail;
  String? title;

  Product(this.id, this.price, this.thumbnail, this.title, this.desc);
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    desc = json['description'] ?? '';
    price = json['price'].toDouble() ?? 0.0;
    thumbnail = json['thumbnail'] ?? '';
    title = json['title'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['description'] = this.desc;
    data['thumbnail'] = this.thumbnail;
    data['title'] = this.title;
    return data;
  }
}

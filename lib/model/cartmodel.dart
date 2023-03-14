class CartModel {
  String? status;
  List<Data>? data;
  int? code;

  CartModel({this.status, this.data, this.code});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? nameAr;
  String? name;
  String? image;
  dynamic? priec;
  int? id;
  int? userId;
  int? productsId;
  int? count;
  String? colorCart;
  String? sizeCart;
  dynamic totalProductes(){
  var x = count! * priec ;
  return x ;
  }

  Data(
      {this.nameAr,
        this.name,
        this.image,
        this.priec,
        this.id,
        this.userId,
        this.productsId,
        this.count,
        this.colorCart,
        this.sizeCart});

  Data.fromJson(Map<String, dynamic> json) {
    nameAr = json['name_ar'];
    name = json['name'];
    image = json['image'];
    priec = json['priec'];
    id = json['id'];
    userId = json['user_id'];
    productsId = json['products_id'];
    count = json['cart_count'];
    colorCart = json['color_cart'];
    sizeCart = json['size_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_ar'] = this.nameAr;
    data['name'] = this.name;
    data['image'] = this.image;
    data['priec'] = this.priec;
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['products_id'] = this.productsId;
    data['count'] = this.count;
    data['color_cart'] = this.colorCart;
    data['size_cart'] = this.sizeCart;
    return data;
  }
}

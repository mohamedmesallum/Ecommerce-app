class ModelOrders {
  String? status;
  List<Data>? data;
  int? code;

  ModelOrders({this.status, this.data, this.code});

  ModelOrders.fromJson(Map<String, dynamic> json) {
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
  int? idOrders;
  int? idUser;
  int? idAddres;
  dynamic? totalPrice;
  int? status;
  dynamic? createTiem;
  String? deliveryTime;
  String? colorCart;
  String? sizeCart;
  int? cartCount;
  int? id;
  String? nameAr;
  String? name;
  String? image;
 dynamic? priec;

  Data(
      {this.idOrders,
        this.idUser,
        this.idAddres,
        this.totalPrice,
        this.status,
        this.createTiem,
        this.deliveryTime,
        this.colorCart,
        this.sizeCart,
        this.cartCount,
        this.id,
        this.nameAr,
        this.name,
        this.image,
        this.priec});

  Data.fromJson(Map<String, dynamic> json) {
    idOrders = json['id_orders'];
    idUser = json['id_user'];
    idAddres = json['id_addres'];
    totalPrice = json['totalPrice'];
    status = json['status'];
    createTiem = json['create_tiem'];
    deliveryTime = json['DeliveryTime'];
    colorCart = json['color_cart'];
    sizeCart = json['size_cart'];
    cartCount = json['cart_count'];
    id = json['id'];
    nameAr = json['name_ar'];
    name = json['name'];
    image = json['image'];
    priec = json['priec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_orders'] = this.idOrders;
    data['id_user'] = this.idUser;
    data['id_addres'] = this.idAddres;
    data['totalPrice'] = this.totalPrice;
    data['status'] = this.status;
    data['create_tiem'] = this.createTiem;
    data['DeliveryTime'] = this.deliveryTime;
    data['color_cart'] = this.colorCart;
    data['size_cart'] = this.sizeCart;
    data['cart_count'] = this.cartCount;
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name'] = this.name;
    data['image'] = this.image;
    data['priec'] = this.priec;
    return data;
  }
}
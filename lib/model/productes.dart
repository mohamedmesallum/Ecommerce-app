class Product {
  List<Products>? data;
  List<Color>? color;
  List<Siez>? size;
  List<Review>? review;

  Product({this.data, this.color, this.size, this.review});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Products>[];
      json['data'].forEach((v) {
        data!.add(new Products.fromJson(v));
      });
    }
    if (json['color'] != null) {
      color = <Color>[];
      json['color'].forEach((v) {
        color!.add(new Color.fromJson(v));
      });
    }
    if (json['siez'] != null) {
      size = <Siez>[];
      json['siez'].forEach((v) {
        size!.add(new Siez.fromJson(v));
      });
    }
    if (json["review"] != null) {
      review = <Review>[];
      json["review"].forEach((v) {
        review!.add(new Review.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.color != null) {
      data['color'] = this.color!.map((v) => v.toJson()).toList();
    }
    if (this.size != null) {
      data['siez'] = this.size!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? nameAr;
  String? name;
  String? descriptionAr;
  String? description;
  String? image;
 dynamic? priec;
  dynamic? oldpriec;
  int? discount;
  int? count;
  int? hidden;
  int? inFoviret;
  int? inCart;
  String? createTiem;
  int? categoriesId;

  Products(
      {this.id,
      this.nameAr,
      this.name,
      this.descriptionAr,
      this.description,
      this.image,
      this.priec,
      this.oldpriec,
      this.discount,
      this.count,
      this.hidden,
      this.inFoviret,
      this.inCart,
      this.createTiem,
      this.categoriesId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    name = json['name'];
    descriptionAr = json['description_ar'];
    description = json['description'];
    image = json['image'];
    priec = json['priec'];
    oldpriec = json['oldpriec'];
    discount = json['discount'];
    count = json['count'];
    hidden = json['hidden'];
    inFoviret = json['in_foviret'];
    inCart = json['in_cart'];
    createTiem = json['create_tiem'];
    categoriesId = json['categories_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name'] = this.name;
    data['description_ar'] = this.descriptionAr;
    data['description'] = this.description;
    data['image'] = this.image;
    data['priec'] = this.priec;
    data['oldpriec'] = this.oldpriec;
    data['discount'] = this.discount;
    data['count'] = this.count;
    data['hidden'] = this.hidden;
    data['in_foviret'] = this.inFoviret;
    data['in_cart'] = this.inCart;
    data['create_tiem'] = this.createTiem;
    data['categories_id'] = this.categoriesId;
    return data;
  }
}

class Color {
  int? id;
  int? white;
  int? yellow;
  int? blue;
  int? red;
  int? green;
  int? black;
  int? brown;
  int? azure;
  int? silver;
  int? purple;
  int? gray;
  int? orange;

  Color(
      {this.id,
      this.white,
      this.yellow,
      this.blue,
      this.red,
      this.green,
      this.black,
      this.brown,
      this.azure,
      this.silver,
      this.purple,
      this.gray,
      this.orange});

  Color.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    white = json['White'];
    yellow = json['Yellow'];
    blue = json['Blue'];
    red = json['Red'];
    green = json['Green'];
    black = json['Black'];
    brown = json['Brown'];
    azure = json['Azure'];
    silver = json['Silver'];
    purple = json['Purple'];
    gray = json['Gray'];
    orange = json['Orange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['White'] = this.white;
    data['Yellow'] = this.yellow;
    data['Blue'] = this.blue;
    data['Red'] = this.red;
    data['Green'] = this.green;
    data['Black'] = this.black;
    data['Brown'] = this.brown;
    data['Azure'] = this.azure;
    data['Silver'] = this.silver;
    data['Purple'] = this.purple;
    data['Gray'] = this.gray;
    data['Orange'] = this.orange;
    return data;
  }
}

class Siez {
  int? small;
  int? medium;
  int? large;
  int? xLarge;
  int? xxLarge;
  int? id;

  Siez(
      {this.small,
      this.medium,
      this.large,
      this.xLarge,
      this.xxLarge,
      this.id});

  Siez.fromJson(Map<String, dynamic> json) {
    small = json['Small'];
    medium = json['medium'];
    large = json['Large'];
    xLarge = json['xLarge'];
    xxLarge = json['xxLarge'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Small'] = this.small;
    data['medium'] = this.medium;
    data['Large'] = this.large;
    data['xLarge'] = this.xLarge;
    data['xxLarge'] = this.xxLarge;
    data['id'] = this.id;
    return data;
  }
}
class Review {
  int? id;
  int? idProducts;
  int? idUser;
  int? rate;
  String? comment;
  String? createTiem;
  String? username;
  String? image;

  Review({this.id,
    this.idProducts,
    this.idUser,
    this.rate,
    this.comment,
    this.createTiem,
    this.username,
    this.image});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProducts = json['id_products'];
    idUser = json['id_user'];
    rate = json['rate'];
    comment = json['comment'];
    createTiem = json['create_tiem'];
    username = json['username'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_products'] = this.idProducts;
    data['id_user'] = this.idUser;
    data['rate'] = this.rate;
    data['comment'] = this.comment;
    data['create_tiem'] = this.createTiem;
    data['username'] = this.username;
    data['image'] = this.image;
    return data;
  }
}
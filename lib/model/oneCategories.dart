class Prodectes {
  String? massege;
  List<Data>? data;

  Prodectes({this.massege, this.data});

  Prodectes.fromJson(Map<String, dynamic> json) {
    massege = json['Massege'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Massege'] = this.massege;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
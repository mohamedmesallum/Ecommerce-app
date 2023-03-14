class FavCartModel {
  String? status;
  List<Data>? data;
  int? code;

  FavCartModel({this.status, this.data, this.code});

  FavCartModel.fromJson(Map<String, dynamic> json) {
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
  String? descriptionAr;
  String? description;
  String? image;
  dynamic? priec;
  dynamic? oldpriec;
  int? discount;
  int? count;
  int? productsId;

  Data(
      {this.nameAr,
        this.name,
        this.descriptionAr,
        this.description,
        this.image,
        this.priec,
        this.oldpriec,
        this.discount,
        this.count,
        this.productsId});

  Data.fromJson(Map<String, dynamic> json) {
    nameAr = json['name_ar'];
    name = json['name'];
    descriptionAr = json['description_ar'];
    description = json['description'];
    image = json['image'];
    priec = json['priec'];
    oldpriec = json['oldpriec'];
    discount = json['discount'];
    count = json['count'];
    productsId = json['products_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_ar'] = this.nameAr;
    data['name'] = this.name;
    data['description_ar'] = this.descriptionAr;
    data['description'] = this.description;
    data['image'] = this.image;
    data['priec'] = this.priec;
    data['oldpriec'] = this.oldpriec;
    data['discount'] = this.discount;
    data['count'] = this.count;
    data['products_id'] = this.productsId;
    return data;
  }
}

class Home {
  String? status;
  List<Categories>? categories;
  List<Discount>? discount;
  List<Newprodectes>? newprodectes;
  List<Newprodectes>? latestfashions;
  int? code;
 // List<Categories>?  getcategories()=>this.categories;
  Home(
      {this.status,
        this.categories,
        this.discount,
        this.newprodectes,
        this.latestfashions,
        this.code});

  Home.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['discount'] != null) {
      discount = <Discount>[];
      json['discount'].forEach((v) {
        discount!.add(new Discount.fromJson(v));
      });
    }
    if (json['Newprodectes'] != null) {
      newprodectes = <Newprodectes>[];
      json['Newprodectes'].forEach((v) {
        newprodectes!.add(new Newprodectes.fromJson(v));
      });
    }
    if (json['latestfashions'] != null) {
      latestfashions = <Newprodectes>[];
      json['latestfashions'].forEach((v) {
        latestfashions!.add(new Newprodectes.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.discount != null) {
      data['discount'] = this.discount!.map((v) => v.toJson()).toList();
    }
    if (this.newprodectes != null) {
      data['Newprodectes'] = this.newprodectes!.map((v) => v.toJson()).toList();
    }
    if (this.latestfashions != null) {
      data['latestfashions'] =
          this.latestfashions!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? image;
  String? nameAr;
int getId(){
    return id!;
  }

  Categories({this.id, this.name, this.image, this.nameAr,});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['name_ar'] = this.nameAr;
    return data;
  }
}

class Discount {
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

  Discount(
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

  Discount.fromJson(Map<String, dynamic> json) {
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

class Newprodectes {
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

  Newprodectes(
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

  Newprodectes.fromJson(Map<String, dynamic> json) {
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



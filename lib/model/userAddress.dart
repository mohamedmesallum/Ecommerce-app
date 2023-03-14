class userAddress {

  List<Data>? data;


  userAddress({this.data});

  userAddress.fromJson(Map<String, dynamic> json) {

    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Data {
  int? userId;
  int? adsressId;
  String? nameAddress;
  String? addressDetails;
  int? phoneAddress;
  dynamic? latitude;
 dynamic? longitude;

  Data(
      {this.userId,
        this.adsressId,
        this.nameAddress,
        this.addressDetails,
        this.phoneAddress,
        this.latitude,
        this.longitude});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    adsressId = json['adsress_id'];
    nameAddress = json['name_address'];
    addressDetails = json['address_details'];
    phoneAddress = json['phone_address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['adsress_id'] = this.adsressId;
    data['name_address'] = this.nameAddress;
    data['address_details'] = this.addressDetails;
    data['phone_address'] = this.phoneAddress;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
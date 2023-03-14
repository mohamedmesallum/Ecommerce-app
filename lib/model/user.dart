class UserData {

  Data? data;



  UserData({this.data});

  UserData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

}

class Data {
  int? id;
  String? username;
  String? email;
  String? passwerd;
  int? verifyCode;
  int? approve;
  String? phone;
  String? creationTime;
  String? image;

  Data(
      {this.id,
        this.username,
        this.email,
        this.passwerd,
        this.verifyCode,
        this.approve,
        this.phone,
        this.creationTime,
        this.image,
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    passwerd = json['passwerd'];
    verifyCode = json['verfiycode'];
    approve = json['approve'];
    phone = json['phone'];
    creationTime = json['creationTime'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['passwerd'] = this.passwerd;
    data['verfiycode'] = this.verifyCode;
    data['approve'] = this.approve;
    data['phone'] = this.phone;
    data['creationTime'] = this.creationTime;
    data['image'] = this.image;
    return data;
  }
}
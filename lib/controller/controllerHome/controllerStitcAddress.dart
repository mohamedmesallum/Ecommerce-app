import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerStaticAd extends GetxController{
  int? userId;
  int? addressId;
  String? nameAddress;
  String? addressDetails;
  int? phoneAddress;
  dynamic latitude;
  dynamic longitude;
  var controllerNameA = TextEditingController();
  var controllerDetailsA = TextEditingController();
  var controllerPhoneA = TextEditingController();



  arguments (){
 userId=Get.arguments['iduser'];
 addressId=Get.arguments['idaddress'];
 nameAddress=Get.arguments['name'];
addressDetails=Get.arguments['Details'];
phoneAddress=Get.arguments['phone'];
latitude=Get.arguments['latitude'];
longitude=Get.arguments['longitude'];
controllerNameA.text=nameAddress!;
controllerPhoneA.text=phoneAddress!.toString();
 controllerDetailsA.text=addressDetails!;
update();
}


}
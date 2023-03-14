import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercea/controller/controllerGoogelMap/controllergeolocator.dart';
import 'package:ecommercea/controller/login/controllerLogin.dart';
import 'package:ecommercea/core/function/hindlinData.dart';
import 'package:ecommercea/core/myclass/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../core/data/remot/home/address.dart';
import '../../model/userAddress.dart';
import '../../widget/erorrDailog.dart';

abstract class AddressController extends GetxController{
  getAddress();
  addAddress();
  deleteAddress({required String idAddress,required BuildContext context});
  updateAddress({required Map data , required BuildContext context});
}
class Controlleraddres extends AddressController{
  ControllerLogin c =Get.find();
  ControllerGeolocator g = Get.find();
  FunctionAddress functionAddress = FunctionAddress(Get.find());
  GlobalKey<FormState> formstetAddAddress = new GlobalKey<FormState>();
  StatusRequest? statusRequest;
  userAddress? address;
  var controllerName = TextEditingController();
  var controllerDetails = TextEditingController();
  var controllerPhone = TextEditingController();
  bool addressBool=false;

  @override
  addAddress() async{
    var formdata = formstetAddAddress.currentState;
    update();
    if(formdata!.validate()){
      try{
        statusRequest = StatusRequest.loading;
        update();
        var resbons = await functionAddress.addAddress(Data: {
'iduser':c.user.data!.id.toString(),
  'name':controllerName.text,
  'details':controllerDetails.text,
  'phone':controllerPhone.text,
  'latitude':'${g.userLatitude}',
  'longitude':'${g.userLongitude}'
        });
        statusRequest = handlingData(resbons);
        if(StatusRequest.success==statusRequest){
          if(resbons['code']==200){
            await  getAddress();
            Get.offNamed(pageAddress);
            print('تم اضافه العنوان بنجاح ');
            update();
          }else{
            print('erorr code != 200');
            update();
          }
          update();
        }else{
          print(statusRequest);
          print('erorr statusRequest != success ');
          update();
          return statusRequest;
        }
        update();
      }catch(e){
        print('erorr catch add Address');
        print(e.toString());
        update();
        return StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getAddress()async {
    try{
      statusRequest = StatusRequest.loading;
      update();
      var resbons = await functionAddress.getAddress(id: c.user.data!.id.toString());
      statusRequest=handlingData(resbons);
      if(StatusRequest.success == statusRequest){
        if(resbons['code']==200){
          address=userAddress.fromJson(resbons);
          print('تم جلب العنوان بنجاح');
          addressBool =true;
          update();
        }else{
          update();
          addressBool =false;
          print('لا يوجد عنوان ');
        }
        update();
      }else{
        update();
        print(statusRequest);
        print(' statusRequest ! = succes  222222222222222222222222222222222222222222222');
        return statusRequest;
      }
      update();
    }catch(e){

      print('catch erorr get address 3333333333333333333333333333333 ');
      print(e.toString());
      update();
      return StatusRequest.failure;

    }
    update();
  }

  @override
  void onInit() {
  getAddress();
    super.onInit();
  }

  @override
  deleteAddress({required String idAddress,required BuildContext context})async {
    try{
      var resbons = await functionAddress.deleteAddress(Data: {
        'iduser':c.user.data!.id.toString(),
        'idaddress':idAddress,
      });
      statusRequest=handlingData(resbons);
      if(StatusRequest.success==statusRequest){
        if(resbons['code']==200){
          print('تم حذف العنوان بنجااااااااااااااااااااااح');
        await getAddress();
        update();
        }else{
          DialogErorr(context: context,titel:'An error occurred, please try again',dialogType:DialogType.INFO);
          update();
        }
        update();
      }else{
        DialogErorr(context: context,titel:'An error occurred, please try again',dialogType:DialogType.INFO);
        update();
      }
      update();
    }catch(e){
      DialogErorr(context: context,titel:'An error occurred, please try again',dialogType:DialogType.INFO);
      print('erorr catch Delete address ');
      print(e.toString());
      update();
    }
update();
  }

  @override
  updateAddress({required Map data, required BuildContext context})async {
    var formdata = formstetAddAddress.currentState;
    update();
    if(formdata!.validate()){
      try{
        statusRequest = StatusRequest.loading;
        update();
        var resbons = await functionAddress.updateAddress(Data: data);
        statusRequest = handlingData(resbons);
        if(StatusRequest.success==statusRequest){
          if(resbons['code']==200){
            await  getAddress();
            Get.offNamed(pageAddress);
            print('تم تعديل العنوان بنجاح ');
            update();
          }else{
            print('erorr code != 200');
            update();
          }
          update();
        }else{
          print(statusRequest);
          print('erorr statusRequest != success ');
          update();
          return statusRequest;
        }
        update();
      }catch(e){
        print('erorr catch updet Address');
        print(e.toString());
        update();
        return StatusRequest.failure;
      }
    }
    update();
  }
}
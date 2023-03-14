import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercea/controller/controllerFirebase/controllerFireStor.dart';
import 'package:ecommercea/core/data/remot/login/login.dart';
import 'package:ecommercea/core/function/hindlinData.dart';
import 'package:ecommercea/core/function/methodGPUD.dart';
import 'package:ecommercea/core/myclass/statusRequest.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../model/user.dart';
import '../../widget/erorrDailog.dart';
import '../controllerFirebase/login.dart';

abstract class LoginController extends GetxController{

Future addImageUser({required File file,required BuildContext context});


}
class ControllerLogin extends LoginController{
late   auth.UserCredential userCredentialID;

FunctionLoin functionLoin= FunctionLoin(Get.put(Method()));

StatusRequest? statusRequest;
late UserData user;


  @override
  Future addImageUser({required File file,required BuildContext context})async{
try{
  var resbons = await functionLoin.addImagesUser(file: file,data: {
    'iduser':'${user.data!.id}',
  });
  statusRequest=handlingData(resbons);
  if(statusRequest==StatusRequest.success){
    if(resbons['code']==200){
      user.data!.image=resbons["image"];
      update();
    }else{
      print(statusRequest);
      DialogErorr(context:context,titel:' حدث حطاّ ما الرجاء اعاده المحاوله2 ',dialogType: DialogType.ERROR,);
    }
    update();
  }else{
    print(statusRequest);
    DialogErorr(context:context,titel:' حدث حطاّ ما الرجاء اعاده المحاوله1 ',dialogType: DialogType.ERROR,);
  }
  update();
}catch(e){
  print(e.toString());
  print(statusRequest);
  DialogErorr(context:context,titel:' حدث حطاّ ما الرجاء اعاده المحاوله3 ',dialogType: DialogType.ERROR,);

}
  }

}
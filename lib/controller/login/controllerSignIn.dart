import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercea/controller/login/controllerLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../core/data/remot/login/login.dart';
import '../../core/function/hindlinData.dart';
import '../../core/function/methodGPUD.dart';
import '../../core/myclass/statusRequest.dart';
import '../../core/serviese/servises.dart';
import '../../model/user.dart';
import '../../widget/erorrDailog.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../controllerFirebase/login.dart';

abstract class SignInController extends GetxController{
 Future signIn(BuildContext context);
}
class ControllerSignIn extends SignInController{
  ControllerLogin controllerLogin = Get.put(ControllerLogin());
  StatusRequest?statusRequest;
  GlobalKey<FormState> formSignIn=  GlobalKey<FormState>();
  FunctionLoin functionLoin= FunctionLoin(Get.put(Method()));
  MyServises s = Get.find();
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();
  ControllerLoginFirebase controllerFLogin = Get.find();

  @override
  signIn(BuildContext context)async {
   try{
     var formData = formSignIn.currentState;
     if(formData!.validate()){
       try{
         statusRequest = StatusRequest.loading;
         update();
         var resbons = await functionLoin.signIn(Data: {
           'email':controllerEmail.text,
           'passwerd':controllerPassword.text,
         });
         await Future.delayed(Duration(seconds: 5));
         statusRequest=handlingData(resbons);
         update();
         if(resbons["code"]==200){
          controllerLogin.user=UserData.fromJson(resbons);
           controllerLogin.userCredentialID= await controllerFLogin.signInFirebase(email:controllerEmail.text, password:controllerPassword.text);
           if(controllerLogin.userCredentialID.user!.uid != null){
             s.sharedPreferences.setString('tokan','${controllerLogin.userCredentialID.user!.uid}').then((value){
               Get.offAllNamed(homeBottomBar);
              controllerPassword.clear();
              controllerEmail.clear(); } );
           }
         }else{
           DialogErorr(context: context,titel:resbons["Massege"],dialogType:DialogType.INFO);
         }
         update();
       }catch(e){
         DialogErorr(context: context,titel:'حدث خطا ما الرجاء اعاده المحاوله',dialogType:DialogType.INFO);
         print(statusRequest);
         print(e.toString());

       }
     }
     update();
   }catch(e){
     print(e.toString());
   }
   update();
  }

}
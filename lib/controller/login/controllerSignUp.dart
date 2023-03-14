import 'package:awesome_dialog/awesome_dialog.dart';
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
import '../controllerFirebase/controllerFireStor.dart';
import '../controllerFirebase/login.dart';
import 'controllerLogin.dart';

abstract class SignUpController extends GetxController{
  signUp(BuildContext context);
}
class ControllerSignUp extends SignUpController{
  MyServises s = Get.find();
  ControllerLogin controllerLogin = Get.find();
  ControllerFStore controllerFStore = Get.put(ControllerFStore());
  FunctionLoin functionLoin= FunctionLoin(Get.put(Method()));
  GlobalKey<FormState> formSignUp =GlobalKey<FormState>() ;
  ControllerLoginFirebase controllerFLogin = Get.find();
  StatusRequest? statusRequest;
  var controllerEmail = TextEditingController();
  var controllerName = TextEditingController();
  var controllerPhone = TextEditingController();
  var controllerPassword = TextEditingController();
  var controllerConfPassword = TextEditingController();


  @override
  signUp(BuildContext context)async {
    var formData = formSignUp.currentState;
    if(formData!.validate()){
      try{
        statusRequest = StatusRequest.loading;
        update();
        var resbons = await functionLoin.signUp(Data: {
          'username':controllerName.text,
          'email':controllerEmail.text,
          'passwerd':controllerPassword.text,
          'phone':controllerPhone.text,
          'verfiycode':'0'
        });
        //await Future.delayed(Duration(seconds: 5));
        statusRequest=handlingData(resbons);
        update();
        update();
        if(resbons["code"]==200){
          controllerLogin.userCredentialID= await controllerFLogin.signUpFirebase(email: controllerEmail.text, password: controllerPassword.text);
         controllerLogin.user=UserData.fromJson(resbons);
          controllerFStore.setDataUsrt(name: controllerName.text, id: controllerLogin.userCredentialID.user!.uid, email:controllerEmail.text);
          if(controllerLogin.userCredentialID.user!.uid != null){
            s.sharedPreferences.setString('tokan','${controllerLogin.userCredentialID.user!.uid}').then((value){
              update();
              Get.offAllNamed(homeBottomBar);
            });
          }
        }else{
          DialogErorr(context: context,titel:resbons["Massege"],dialogType:DialogType.INFO);
          update();
        }
        update();
      }catch(e){
        DialogErorr(context:context,titel:' حدث حطاّ ما الرجاء اعاده المحاوله',dialogType: DialogType.ERROR,);
        print(e.toString());
        update();
      }
    }
    update();

  }

}
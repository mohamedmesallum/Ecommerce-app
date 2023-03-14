import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercea/controller/login/controllerLogin.dart';
import 'package:ecommercea/core/myclass/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/remot/home/products.dart';
import '../../../core/function/hindlinData.dart';
import '../../../widget/erorrDailog.dart';

abstract class ReviewController extends GetxController{
  addReview({required String idp, required BuildContext context});
}
class ControllerReview extends ReviewController{
  StatusRequest? statusRequest;
  ControllerLogin controllerLogin = Get.find();
  var controllerComment = TextEditingController();
  FunctionProducts functionProducts = FunctionProducts(Get.find());
  GlobalKey<FormState> formstetReview = new GlobalKey<FormState>();
  var rate = 0;


  Map<int,bool> Starts={
  0:false,
  1:false,
  2:false,
  3:false,
  4:false,
};

  changeRate({required int index}){
  if(Starts[index]==false){
    Starts[index]=true;
    rate++;
    update();
  }else {
    Starts[index]=false;
    rate--;
    update();
  }
  update();
  }

  goodRate(){
    Starts.forEach((key, value) {
      Starts[key]=true;
      rate = 5 ;
      update();
    });
  }

  badRate(){
    Starts.forEach((key, value) {
      Starts[key]=false;
      rate = 0 ;
      update();
    });
  }

  @override
   addReview({required String idp , required BuildContext context })async{
   var formdata =   formstetReview.currentState;
   update();
   if(formdata!.validate()){
     try{
       statusRequest=StatusRequest.loading;
       update();
       var resbons = await functionProducts.addReview(Data: {
         'iduser':controllerLogin.user.data!.id.toString(),
         'idproduct':  idp,
         'rate':rate.toString(),
         'comment':controllerComment.text
       });
       statusRequest=handlingData(resbons);
       if(StatusRequest.success==statusRequest){
         if(resbons['code']==200){
           DialogErorr(context: context,titel:'The rating has been sent. Thank you for your interaction with us',dialogType:DialogType.SUCCES);
         controllerComment.clear();
           badRate();
         update();
         }else{
           DialogErorr(context:context,titel:' حدث حطاّ ما الرجاء اعاده المحاوله 1',dialogType: DialogType.ERROR,);
           update();
         }
         update();
       }else{
         DialogErorr(context:context,titel:' حدث حطاّ ما الرجاء اعاده المحاوله 2',dialogType: DialogType.ERROR,);
         update();
       }

     }catch(e){
       DialogErorr(context:context,titel:' 3 حدث حطاّ ما الرجاء اعاده المحاوله',dialogType: DialogType.ERROR,);
       update();
     }
   }

  }

}
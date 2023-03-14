
import 'package:ecommercea/controller/controllerFavorites&Cart/controllerFavorites.dart';
import 'package:ecommercea/core/function/hindlinData.dart';
import 'package:ecommercea/core/myclass/statusRequest.dart';
import 'package:ecommercea/model/home.dart'  as HomeData;
import 'package:get/get.dart';

import '../../core/data/remot/home/homedata.dart';
import '../../model/home.dart';
import '../controllerFavorites&Cart/controllerCart.dart';

abstract class HomeController extends GetxController{
  getDataHome();
}
class ControllerHome extends HomeController{
  ControllerCart cart = Get.put(ControllerCart());
  Controllerfavorites fa = Get.put(Controllerfavorites());
  FunctionHome functionHome =  FunctionHome(Get.find());
 StatusRequest? statusRequest;
int selectIndexBottomBar = 0;
int sliderIndex = 0 ;
HomeData.Home? modelHome ;
  HomeData.Categories test = Categories();





vSlieder({required int index}){
  sliderIndex=index;
  update();
}

selectBottomBar({required int index}){
  selectIndexBottomBar=index;
  update();
}

  @override
  getDataHome() async{
 try{
   statusRequest=StatusRequest.loading;
   update();
   var resbons = await functionHome.getDataHome();
   statusRequest= handlingData(resbons);
   update();
   print(statusRequest);
   if(StatusRequest.success==statusRequest){
     if(resbons["code"]==200){
       modelHome=HomeData.Home.fromJson(resbons);

       update();
     }else{
       statusRequest=StatusRequest.failure;
     }
     update();
   }else{
     return statusRequest;
   }
   update();
 }catch(e){
   print(e.toString());
return StatusRequest.failure;
 }
update();
  }
@override
  void onInit() {
getDataHome();
    super.onInit();
  }
  @override
  void onReady() {
    cart.getCart();
    fa.getFavorites();
    super.onReady();
  }
}
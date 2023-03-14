import 'package:ecommercea/core/myclass/statusRequest.dart';
import 'package:get/get.dart';

import '../../core/data/remot/home/favorites.dart';
import '../../core/function/hindlinData.dart';
import '../../model/FovCart.dart';
import '../login/controllerLogin.dart';

abstract class FavoritesController extends GetxController{
  addAndDeleteFavorites({required int idProduct});
  getFavorites();
  mapAddAndDeleteFov({required int id });
}
class Controllerfavorites extends FavoritesController{
  ControllerLogin controllerLogin = Get.find();
  FunctionFavorites functionFavorites = FunctionFavorites(Get.find());
StatusRequest? statusRequest ;
  FavCartModel?dataFavorites;
  Map<dynamic,bool>favoritesMap ={};
  bool favoritesBool = false;



  @override
  addAndDeleteFavorites({required int idProduct})async {
try{
  var resbons = await functionFavorites.addAndDeleteFov(idUser: controllerLogin.user.data!.id!, idProduct: idProduct);
 statusRequest=handlingData(resbons);
 if(StatusRequest.success==statusRequest){
   if(resbons['code']==200){
     getFavorites();
         update();
   }else{
     update();
   }
 }else{
   update();
 }
 update();
}catch(e){
}
update();
  }

  @override
  getFavorites()async {
 try{
   statusRequest=StatusRequest.loading;
   var resbons = await functionFavorites.getFavorites(id: controllerLogin.user.data!.id!);
   statusRequest = handlingData(resbons);
   if(StatusRequest.success==statusRequest){
     if(resbons['code']==200){
       update();
       dataFavorites=FavCartModel.fromJson(resbons);
       if(dataFavorites!.data!.isNotEmpty){
         dataFavorites!.data!.forEach((element) {
           favoritesMap.addAll({
             element.productsId:true
           });
         });
         favoritesBool=true;
         update();
       }else{
         favoritesBool=false;
         update();
       }
     }else{
       favoritesBool=false;
       update();
     }
     update();
   }else{
     update();
     return statusRequest;
   }
   update();
 }catch(e){
   return StatusRequest.failure;
 }
 update();
  }

  @override
 mapAddAndDeleteFov({required int id})async {
if(favoritesMap[id]==false || favoritesMap[id]==null){
  favoritesMap.addAll({
    id:true,
  });
  update();
}else{
  favoritesMap.remove(id);
  update();
}
update();
  }

}
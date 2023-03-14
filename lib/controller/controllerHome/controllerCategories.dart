import 'package:get/get.dart';

import '../../core/data/remot/home/homedata.dart';
import '../../core/function/hindlinData.dart';
import '../../core/myclass/statusRequest.dart';
import '../../model/oneCategories.dart';

abstract class Getcategories extends GetxController{
  getOneCategories({required int id });
}
class ControllerOneCategories extends  Getcategories{
  FunctionHome functionHome = FunctionHome(Get.find());
  StatusRequest? statusRequest;
  Prodectes? products;
  String? name;
  String? nameAr;
  int? id;
  argoument()async{
    name=Get.arguments['name'];
    id=Get.arguments['id'];
    nameAr=Get.arguments['name_ar'];
    update();
  }

  @override
  getOneCategories({required int id })async {
try{
  statusRequest=StatusRequest.loading;
  update();
  var resbons = await functionHome.getCategories(id: id);
  statusRequest=handlingData(resbons);
  update();
  if(StatusRequest.success==statusRequest){
    if(resbons['code']==200){
      products=Prodectes.fromJson(resbons);
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


}
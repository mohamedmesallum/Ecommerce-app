import 'package:get/get.dart';

import '../../../core/data/remot/home/products.dart';
import '../../../core/function/hindlinData.dart';
import '../../../core/myclass/statusRequest.dart';
import '../../../model/productes.dart';

abstract class Products extends GetxController{
 Future getProducts({required int id });
}
class ControllerProducts extends Products{
  FunctionProducts functionProducts = FunctionProducts(Get.find());
  StatusRequest? statusRequest;
  Product? product;
  @override
Future getProducts({required int id })async {
try{
  statusRequest = StatusRequest.loading;
  update();
  var resbons = await functionProducts.getDataProducts(id:id);
  statusRequest =handlingData(resbons);
  update();
  if(StatusRequest.success==statusRequest){
    if(resbons['code']==200){
      product=Product.fromJson(resbons);
    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }else{
    return statusRequest;
  }
  update();
}catch(e){
  print('catch erorr get data');
  print(e.toString());
  return StatusRequest.failure;
}
update();
  }
}
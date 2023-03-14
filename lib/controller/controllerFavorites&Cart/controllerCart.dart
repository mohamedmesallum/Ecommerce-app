import 'package:ecommercea/controller/login/controllerLogin.dart';
import 'package:get/get.dart';

import '../../core/data/remot/home/cart.dart';
import '../../core/function/hindlinData.dart';
import '../../core/myclass/statusRequest.dart';
import '../../model/cartmodel.dart' as ModelCart ;

abstract class CartController extends GetxController{
  addAndDeleteCart({required String idProduct,required String selectColor,required String selectSize});
  getCart();
  mapCart({required String id, });
}
class ControllerCart extends CartController{
  FunctionCatr functionCart = FunctionCatr(Get.find());
  ControllerLogin controllerLogin = Get.find();
  StatusRequest? statusRequest ;
  ModelCart.CartModel?dataCart;
  Map<dynamic,bool>cartMap ={};
  bool cartBool = false;
  dynamic totalPriceCart;
up(){
  update();
}

  @override
  addAndDeleteCart({required String idProduct,required String selectColor,required String selectSize})async {
    try{
      var resbons = await functionCart.addAndDeleteCart(
          idUser: controllerLogin.user.data!.id.toString(),
          size:selectSize ,
          color: selectColor,
          idProduct: idProduct);
      statusRequest=handlingData(resbons);
      if(StatusRequest.success==statusRequest){
        if(resbons['code']==200){
       getCart();
          update();
        }else{
          update();
        }
      }else{
        print(statusRequest);
        update();
      }
      update();
    }catch(e){
      print(e.toString());
    }
    update();


  }

  @override
  getCart()async {
    try{
      statusRequest=StatusRequest.loading;
      var resbons = await functionCart.getCart(id: controllerLogin.user.data!.id!.toString());
      statusRequest = handlingData(resbons);
      if(StatusRequest.success==statusRequest){
        if(resbons['code']==200){
          update();
          dataCart=ModelCart.CartModel.fromJson(resbons);
          if(dataCart!.data!.isNotEmpty){
            dataCart!.data!.forEach((element) {
              cartMap.addAll({
                element.productsId.toString():true
              });
                     });
            cartBool=true;
            GetTotalCart();
            update();
          }else{
           cartBool=false;
            update();
          }
        }else{
          cartBool=false;
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
  mapCart({required String id}) {
    if (cartMap[id] == false || cartMap[id] == null) {
     cartMap.addAll({
        id: true,
      });
      update();
    } else {
      cartMap.remove(id);
      update();
    }
    update();
  }

  GetTotalCart(){
    totalPriceCart = dataCart!.data!.map((e) => e.priec! * e.count!).reduce((value, element) => value +element ).toDouble();
    update();
    return totalPriceCart;
  }

addCount({required int value,}){
  value++;
  update();
  return value;

}

  minusCount({required int count}){
  count--;
  update();
  }


}

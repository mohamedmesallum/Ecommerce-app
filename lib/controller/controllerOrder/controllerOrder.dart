import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercea/%20routes/namepages.dart';
import 'package:ecommercea/controller/login/controllerLogin.dart';
import 'package:ecommercea/core/myclass/statusRequest.dart';
import 'package:ecommercea/model/modelOrders.dart' as DataOrders;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/data/remot/home/orders.dart';
import '../../core/function/hindlinData.dart';
import '../../model/cartmodel.dart' as ModelCart ;
import '../../widget/erorrDailog.dart';
import '../controllerFavorites&Cart/controllerCart.dart';

abstract class OrderController extends GetxController{
  argument({required dynamic totalPrice});
  selectIdAddress(dynamic val);
  addOrders(BuildContext context);
  getOrders();
}
class ControllerOrder extends OrderController{
  ControllerCart ca =Get.find();
ControllerLogin cl = Get.find();
  final FunctionOrders _functionOrders = FunctionOrders(method: Get.find());
  StatusRequest? statusRequest;
  List<ModelCart.Data>?dataCart;
List<DataOrders.Data>dataOrdersCurrently = [];
  List<DataOrders.Data>dataOrdersComplete = [];
  List<DataOrders.Data>oneOrders=[];
  DataOrders.ModelOrders? modelOrders;
  dynamic idAddress;
  dynamic totalPriceCart;


 getPagerSuccess(BuildContext context){
   if(idAddress!=null){
addOrders(context);
   }else{
     DialogErorr(context:context,titel:'114'.tr,dialogType: DialogType.INFO,);
update();
   }
   update();
 }

  @override
  selectIdAddress(dynamic? val ){
   idAddress=val;
   print('${idAddress}');
   update();
 }

  @override
  argument({required dynamic totalPrice}){
 dataCart=Get.arguments;
 totalPriceCart=totalPrice;
 update();

}

  @override
  addOrders(BuildContext context)async {
  try{
    statusRequest=StatusRequest.loading;
    update();
        var resbons = await _functionOrders.addOrders(data: {
          'idUser':'${cl.user.data!.id}',
          'idAddres':'${idAddress}',
          'total':'${ca.totalPriceCart}',
        });
        statusRequest=handlingData(resbons);
        if(statusRequest==StatusRequest.success){
          if(resbons["code"]==200){
            Get.toNamed(pageSuccessOrder);
            ca.getCart();
            ca.cartMap.clear();
          }else{
            DialogErorr(context:context,titel:' 1 حدث حطاّ ما الرجاء اعاده المحاوله',dialogType: DialogType.ERROR,);
          }
          update();
        }else if(statusRequest==StatusRequest.internetFailure){
          DialogErorr(context: context, titel: 'تحقق من الاتصال بلانترنت وعاود امحاوله', dialogType: DialogType.ERROR);
        }else{
          print(statusRequest);
          DialogErorr(context:context,titel:'  2حدث حطاّ ما الرجاء اعاده المحاوله',dialogType: DialogType.ERROR,);
        }
    update();
  }catch(e){
    DialogErorr(context:context,titel:'3 حدث حطاّ ما الرجاء اعاده المحاوله',dialogType: DialogType.ERROR,);
    print(e.toString());
    update();
  }
  }

  @override
 Future getOrders()async {
   try{
     statusRequest=StatusRequest.loading;
     update();
     var resbons = await _functionOrders.getOrders(idUser: cl.user.data!.id!);
       statusRequest=handlingData(resbons);
       if(statusRequest==StatusRequest.success){
         if(resbons['code']==200){
           modelOrders=DataOrders.ModelOrders.fromJson(resbons);
           modelOrders!.data!.forEach((element) {
             var vervif = dataOrdersCurrently.firstWhereOrNull((e) => e.idOrders==element.idOrders);
             if(vervif==null&&element.status==0) {
               dataOrdersCurrently.add(DataOrders.Data(
                 image: element.image,
                 name: element.name,
                 nameAr: element.nameAr,
                 createTiem: element.createTiem,
                 totalPrice: element.totalPrice,
                 idOrders: element.idOrders,
               ));
             }
             var ve = dataOrdersComplete.firstWhereOrNull((e) => e.idOrders==element.idOrders);
             if(ve==null&&element.status==1) {
               dataOrdersComplete.add(DataOrders.Data(
                 image: element.image,
                 name: element.name,
                 nameAr: element.nameAr,
                 createTiem: element.createTiem,
                 totalPrice: element.totalPrice,
                 idOrders: element.idOrders,
               ));
             }
           });
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

viewOneOrders({required int idOrders}){
  oneOrders.clear();
   modelOrders!.data!.forEach((element) {
     if(element.idOrders==idOrders){
      oneOrders.add(DataOrders.Data(
        idAddres: element.idAddres,
        deliveryTime: element.deliveryTime,
        idUser: element.idUser,
        id: element.id,
        sizeCart: element.sizeCart,
        cartCount: element.cartCount,
        colorCart: element.colorCart,
        image: element.image,
        name: element.name,
        nameAr: element.nameAr,
        status: element.status,
        createTiem: element.createTiem,
        priec: element.priec,
        totalPrice: element.totalPrice,
        idOrders: element.idOrders,
      ));
     }
   });
}

lengthItemOrder({required int idOrders,}){
   var  i = 0 ;
   modelOrders!.data!.forEach((element) {
     if(element.idOrders==idOrders){
   i++;
     }
   });
   return i;
}
}
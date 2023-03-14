import 'package:ecommercea/controller/controllerFavorites&Cart/controllerCart.dart';
import 'package:ecommercea/controller/controllerHome/controllerProducts/controllerProducts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/home/buttomsmol.dart';
import '../../widget/home/size/viewSiezP.dart';
import '../../widget/home/color/widgitColor.dart';

abstract class StitcCart extends GetxController{


}
class ControllerSelectCS extends StitcCart {
  final ControllerProducts _products  =Get.find();
  final ControllerCart cart = Get.find();
  int count = 1;
  String? color;
  String? selectSize;

  bottomAddToCart({required BuildContext context ,required String idP})async{

    if(_products.product!.color!.isNotEmpty||_products.product!.size!.isNotEmpty){
      Get.bottomSheet(
          SizedBox(
              width: MediaQuery.of(context).size.width*0.85,
              height: MediaQuery.of(context).size.height*0.45,

              child: Padding(padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text('Select Color and Size',style: Theme.of(context).textTheme.headline2,),),
                  if(_products.product!.size!.isNotEmpty)
                    ViewSiezPr(),

                    if(_products.product!.color!.isNotEmpty)
                    const ColorsWidgets(),
                    Center(
                      child:   Container(
                        alignment: Alignment.center,
                        child: GetBuilder<ControllerSelectCS>(
                          init:  ControllerSelectCS(),
                          builder: (sc)=>
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      sc.minusCount();
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 25,
                                          color: Colors.grey[200],
                                          child: Icon(Icons.remove,size: 24,),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12,),
                                  Text('${sc.count}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                                  const SizedBox(width: 12,),
                                  InkWell(
                                    onTap: (){
                                      sc.addCount();
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 25,
                                          color: Colors.white70,
                                          child: const Icon(Icons.add,size: 24,),
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                        ),

                      ),
                    ),
                    Center(child:  ButtomSmal(onTap: ()async{
                      if(_products.product!.color!.isNotEmpty&&color!=''){
                        if(_products.product!.size!.isNotEmpty&&selectSize!=''){
                          await cart.mapCart(id: idP);
                          cart.addAndDeleteCart(idProduct: idP ,selectColor: color!,selectSize: selectSize!);
                          Navigator.of(context).pop();
                        }else{
                          Get.snackbar('size', 'message');
                        }

                      }else{
                        Get.snackbar('color', 'message');
                      }

                    }, titel: 'Seve'),)
                  ],
                ),)
          ),
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),

          ) ,
          backgroundColor:Colors.white
      );
    }else{

      await cart.mapCart(id: idP);
     cart.addAndDeleteCart(idProduct: idP ,selectColor: color!,selectSize: selectSize!);
    }
  }

  addCount(){
    count++;
    update();
  }
 selectSeiz(String? value){
   selectSize=value;
   update();
}
 selectColor(String? value){
    color=value;
    update();
}
 minusCount() {
    if (count > 1) {
      count--;
      update();
    }
  }



  @override
  void onInit() {
    count=1;
    color='';
    selectSize='';
    super.onInit();
  }


}


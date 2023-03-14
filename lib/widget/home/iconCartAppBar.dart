import 'package:ecommercea/controller/controllerHome/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controllerFavorites&Cart/controllerCart.dart';

class IconCartAppBar extends StatelessWidget {
  ControllerHome H= Get.find();
  @override
  Widget build(BuildContext context) {
    return        Center(child: Padding(
      padding:const EdgeInsets.symmetric(vertical:0,horizontal: 5),
      child:

      Stack(
        alignment: Alignment.topLeft,
        children: [
          IconButton(icon: const Icon(Icons.badge_outlined,size: 30,),onPressed: (){
          },),
          GetBuilder<ControllerCart>(
              init: ControllerCart(),
              builder: (ca)=>
              ca.cartMap.isNotEmpty?
              Opacity(
                opacity: 1,
                child: CircleAvatar(
                    backgroundColor:Colors.black54,
                    radius: 12,
                    child: Text('${ca.cartMap.length}',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white,fontSize: 16),)),
              ):Text('')
          )
        ],
      ),

    ));
  }
}

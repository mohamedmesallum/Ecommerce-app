
import 'package:ecommercea/controller/controllerFavorites&Cart/controllerCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ routes/namepages.dart';

class FloatButtonCart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerCart>(
      init: ControllerCart(),
      builder: (ca) {

        return
          ca.cartMap.isNotEmpty?
          Stack(
          alignment: Alignment.topRight,
          children: [
            FloatingActionButton(onPressed:(){
              Get.toNamed(pageCart);
            },child:
            Icon(Icons.badge,color: Colors.pink,),
                backgroundColor:Colors.white
            ),
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.pink,
              child:Text('${ca.cartMap.length}',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 16),)
            )
          ],
        ):SizedBox();
      }
    );
  }
}

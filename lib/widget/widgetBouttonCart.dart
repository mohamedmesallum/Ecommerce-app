
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/controller/controllerFavorites&Cart/controllerCart.dart';
import 'package:ecommercea/controller/controllerHome/controllerProducts/controllerProducts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controllerFavorites&Cart/controllerStaticCart.dart';
import 'home/buttomsmol.dart';
import 'home/size/viewSiezP.dart';
import 'home/color/widgitColor.dart';

class AddToCart extends StatelessWidget {
final String idP;
AddToCart({required this.idP,});
ControllerProducts p = Get.find();
ControllerSelectCS cs = Get.put(ControllerSelectCS());

@override
  Widget build(BuildContext context) {
    return  GetBuilder<ControllerCart>(
      init: ControllerCart(),
      builder: (ca) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Center(
                child: InkWell(
                  onTap: () async{
                   await cs.bottomAddToCart(context: context,idP: idP);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Icon((ca.cartMap[idP]==false || ca.cartMap[idP]==null)?
                        Icons.shopping_cart_outlined: Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '51'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.white),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
           IconButton(onPressed: ()async{
             await ca.mapCart(id: idP);
             ca. addAndDeleteCart(idProduct: idP,selectSize: '',selectColor: '' );
           }, icon: Icon((ca.cartMap[idP]==false || ca.cartMap[idP]==null)?null:Icons.remove)),
          ],
        );
      }
    );
  }
}

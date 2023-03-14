import 'package:ecommercea/controller/controllerHome/controllerProducts/controllerProducts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'containerSiez.dart';

class WidgetSize extends StatelessWidget {

  ControllerProducts c = Get.find();
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<ControllerProducts>(
        init: ControllerProducts(),
        builder: (c)=>
            Container(
              // color:  Colors.black26,
              width:  double.infinity,
             // height: 40,
              child:
              SingleChildScrollView(
                padding:EdgeInsets.all(3),
                scrollDirection: Axis.horizontal,
                child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('62'.tr,style:Theme.of(context).textTheme.headline2,),
                      SizedBox(width: 8,),
                      if(c.product!.size![0].small==1)
                        ContainerSiez(name: 'S',),
                      if(c.product!.size![0].medium==1)
                        ContainerSiez(name:'M'),
                      if(c.product!.size![0].large==1)
                        ContainerSiez(name:'L'),
                        if(c.product!.size![0].xLarge==1)
                          ContainerSiez(name:'XL'),
                      if(c.product!.size![0].xxLarge==1)
                        ContainerSiez(name:'XXL'),
                    ],),

              ) ,
            ),

      );


  }
}
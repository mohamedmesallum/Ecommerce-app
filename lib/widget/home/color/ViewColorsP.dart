
import 'package:flutter/material.dart';

import 'package:ecommercea/controller/controllerHome/controllerProducts/controllerProducts.dart';
import 'package:get/get.dart';

import 'columnSelectColor.dart';



class WidgetViewColorsP extends StatelessWidget {


  ControllerProducts c = Get.find();
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ControllerProducts>(
      init: ControllerProducts(),
      builder: (sc)=>
          SizedBox(
            // color:  Colors.black26,
            width:  double.infinity,
            //  height: 40,
            child:
            SingleChildScrollView(
              padding:const EdgeInsets.all(3),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('63'.tr,style:Theme.of(context).textTheme.headline2),
                  const SizedBox(width: 8,),
                  if(c.product!.color![0].white==1)
                  CircleAvatar(
                    radius:10.1 ,backgroundColor: Colors.black,
                    child:   ColorsProducts(color: Colors.white,),
                  ),
                  if(c.product!.color![0].yellow==1)
                    ColorsProducts(color: Colors.yellow,),
                  if(c.product!.color![0].blue==1)
                    ColorsProducts(color: Colors.blue,),
                  if(c.product!.color![0].red==1)
                    ColorsProducts(color: Colors.red,),
                  if(c.product!.color![0].green==1)
                    ColorsProducts(color: Colors.green,),
                  if(c.product!.color![0].black==1)
                    ColorsProducts(color: Colors.black,),
                  if(c.product!.color![0].azure==1)
                    ColorsProducts(color: Colors.blueAccent,),
                  if(c.product!.color![0].brown==1)
                     ColorsProducts(color: Colors.brown),
                  if(c.product!.color![0].silver==1)
                    ColorsProducts(color: Colors.white54,),
                  if(c.product!.color![0].purple==1)
                    ColorsProducts(color: Colors.purple,),
                  if(c.product!.color![0].orange==1)
                    ColorsProducts(color: Colors.orange,),
                  if(c.product!.color![0].gray==1)
                    ColorsProducts(color: Colors.grey,),


                ],),
            ) ,
          ),

    );
  }
}

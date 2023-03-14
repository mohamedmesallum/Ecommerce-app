
import 'package:get/get.dart';

import '../../../model/cartmodel.dart' as Cart;
import 'package:flutter/material.dart';

import 'columnSelectColor.dart';


class SelectColorCart extends StatelessWidget {
final String colorK;

  SelectColorCart({required this.colorK});

  @override
  Widget build(BuildContext context) {
    return
         Container(
           child: SingleChildScrollView(
             physics: BouncingScrollPhysics(),
             scrollDirection: Axis.horizontal,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,

               children: [
                 if(colorK=='white')
                   ColorsProducts( color: Colors.white,),
                 if(colorK=='blue')
                   ColorsProducts(color: Colors.blue,),
                 if(colorK=='green')
                   ColorsProducts(color: Colors.green,),
                 if(colorK=='yellow')
                   ColorsProducts( color: Colors.yellow, ),
                 if(colorK=='purple')
                   ColorsProducts( color: Colors.purple,),
                 if(colorK=='brown')
                   ColorsProducts(color: Colors.brown, ),
                 if(colorK=='red')
                   ColorsProducts(color: Colors.red,),
                 if(colorK=='orange')
                   ColorsProducts( color:Colors.orange,),
                 if(colorK=='silver')
                   ColorsProducts( color: Colors.white30, ),
                 if(colorK=='black')
                   ColorsProducts( color: Colors.black, ),
                 if(colorK=='azure')
                   ColorsProducts( color: Colors.lightBlueAccent,),
                 if(colorK=='gray')
                   ColorsProducts(color: Colors.grey,),
               ],
             ),
           ),
         )
   ;
  }
}

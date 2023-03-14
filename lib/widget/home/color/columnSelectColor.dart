
import 'package:ecommercea/controller/controllerFavorites&Cart/controllerCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorsProducts extends StatelessWidget {

  final Color color;


  ColorsProducts({required this.color,});

  @override
  Widget build(BuildContext context) {
    return      GetBuilder<ControllerCart>(
      init: ControllerCart(),
      builder: (c)=>
       Padding(padding:  const  EdgeInsets.symmetric(horizontal: 2),
         child: CircleAvatar(radius: 10,backgroundColor:color,),)
    );
  }
}

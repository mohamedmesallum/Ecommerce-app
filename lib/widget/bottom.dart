import 'package:ecommercea/core/serviese/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustombButton extends StatelessWidget {
  final String name ;
  final Function() onTap;
  final Color color;
  final Color namecolor;



  CustombButton(this.name,this.onTap,this.color,this.namecolor);
  MyServises s = Get.find();
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap,
      child: Container(

        width: double.infinity,
        padding:const EdgeInsets.only(
            top: 5, bottom:5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30,),
          // border: Border.all(color: Colors., width: 3)
        ),
        child: Text(name,textAlign: TextAlign.center,
          style:TextStyle(fontWeight:FontWeight.w900,fontSize: 19,color:color==Colors.white? Colors.black:Colors.white,)
        ),),
    );
  }
}

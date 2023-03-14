
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/core/myclass/languages/controleerLocale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/bottom.dart';

class WidgetLanguages extends StatelessWidget {
  final Function() onTapEn;
  final Function() onTapAr;
  WidgetLanguages({required this.onTapAr,required this.onTapEn});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: TheColors.dustyRose,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Text('1'.tr,style:const TextStyle(fontFamily:  'Caveat',fontSize: 29,fontWeight: FontWeight.w900,color: Colors.black),),
            const SizedBox(height: 25,),
            Container(
                width: MediaQuery.of(context).size.width*0.50,
                child: CustombButton('2'.tr, onTapEn, Colors.black38, Colors.white,)),
            const SizedBox(height: 15,),
            Container(
                width: MediaQuery.of(context).size.width*0.50,
                child: CustombButton('3'.tr, onTapAr, Colors.black38, Colors.pink,)),
          ],
        ),),
      ),
    );
  }
}
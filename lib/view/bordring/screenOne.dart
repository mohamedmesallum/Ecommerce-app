
import 'package:ecommercea/%20routes/namepages.dart';
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/bottom.dart';

class ScreenOne extends StatelessWidget {
MyServises s = Get.find();
  @override
  Widget build(BuildContext context) {
    return
          Scaffold(
           body: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration:const BoxDecoration(
                      image: DecorationImage(image: AssetImage('images/imagOne.jpg',),fit: BoxFit.fitHeight)
                    )
                    ),
                Padding(
                  padding:  EdgeInsets.only(bottom:MediaQuery.of(context).size.height *0.05 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      SizedBox(
                          //height: 60,
                          width:MediaQuery.of(context).size.width *0.85,
                          child:
                          CustombButton('4'.tr, (){
                            Get.toNamed(sign_In);
                          }, Colors.white, Colors.black),
                        ),
                      const SizedBox(height: 20,),
                      Center(child: InkWell(
                          onTap: (){
                            s.sharedPreferences.remove('Lang');
                          },
                          child: Text('5'.tr,style:Theme.of(context).textTheme.headline4)),)

                    ],
                  ),
                )
              ],
            ),
          );

  }
}

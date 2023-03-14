
import 'package:ecommercea/controller/controllerFavorites&Cart/controllerCart.dart';
import 'package:ecommercea/controller/controllerOrder/controllerOrder.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:ecommercea/core/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../core/color.dart';
import '../../widget/bottom.dart';
import '../../widget/home/widgetPrice.dart';

class SuccessOrder extends StatelessWidget {
ControllerCart ca= Get.put(ControllerCart());
MyServises s = Get.find();

DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TheColors.dustyRose,

      body:Container(
       height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: LayoutBuilder(
          builder: (context,BoxConstraints){
            return Column(

              children: [
                Container(
                  height: BoxConstraints.minHeight*0.45,
                 decoration:BoxDecoration(
                   image: DecorationImage(
                     fit: BoxFit.fill,
                     image: AssetImage('images/done.jpg'),
                   )
                 ) ,
                ),
                SizedBox(height: BoxConstraints.minHeight*0.05,),
         Center(child: Container(child: Text('109'.tr
          , textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline2
         ),)),
                SizedBox(height: BoxConstraints.minHeight*0.05,),
             Padding(padding: EdgeInsets.symmetric(horizontal: 10),
               child:Container(
               width: BoxConstraints.maxWidth*0.90,
               height: BoxConstraints.minHeight*0.25,
            decoration: BoxDecoration(boxShadow: const [
            BoxShadow(color: Colors.white, blurRadius: 40, spreadRadius: 20)
            ], color: Colors.white70, borderRadius: BorderRadius.circular(20)),
                 child: LayoutBuilder(
                   builder: (context,BoxConstraints){
                     return GetBuilder<ControllerOrder>(
                         init: ControllerOrder(),
                         builder:(co){
                       return Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Container(
                             width:BoxConstraints.maxWidth*0.35 ,
                             height: BoxConstraints.minHeight,
                             decoration: BoxDecoration(
                                 image: DecorationImage(
                                   fit: BoxFit.fill,
                                     image: NetworkImage('${urlImages}/${co.dataCart![0].image}')
                                 ),
                                 borderRadius:BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                             ),

                           ),
                        Container(
                          width: BoxConstraints.maxWidth*0.60,
                          height: BoxConstraints.minHeight,
                          child:  Padding(padding: EdgeInsets.all(3),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                co.dataCart!.length>1?
                                Text(s.sharedPreferences.getString('Lang')=='en'?'${co.dataCart![0].name} \n & ${co.dataCart!.length-1}+ ${'99'.tr}':
                                '${co.dataCart![0].nameAr} \n & ${co.dataCart!.length-1}+ ${'99'.tr}'
                                    ,style:Theme.of(context).textTheme.headline2
                              ):  Text(s.sharedPreferences.getString('Lang')=='en'?'${co.dataCart![0].name}':'${co.dataCart![0].nameAr}',style:Theme.of(context).textTheme.headline2,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('100'.tr,style:Theme.of(context).textTheme.headline2),
                                    WidgetPrice(price:'${co.totalPriceCart}' ,)

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('101'.tr,style:Theme.of(context).textTheme.headline2),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('${dateTime.day} / ',style:Theme.of(context).textTheme.headline2,),
                                        Text('${dateTime.month} / ',style:Theme.of(context).textTheme.headline2),
                                        Text('${dateTime.year}',style:Theme.of(context).textTheme.headline2,),
                                      ],
                                    )

                                  ],
                                ),

                              ],
                            ) ,),
                        )
                         ],
                       );
                     });
                   },
                 ),
             ),),
               SizedBox(height: BoxConstraints.minHeight*0.05,),
                Container(
                  width: MediaQuery.of(context).size.width*0.60,
                  child: CustombButton('35'.tr, (){
                    Get.offAllNamed(homeBottomBar);
                  }, Colors.black38,Colors.white),
                )
              ],
            );
          }
        ),
      ) ,
    );
  }
}

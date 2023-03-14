
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/controller/controllerFavorites&Cart/controllerCart.dart';
import 'package:ecommercea/controller/controllerOrder/controllerOrder.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/coustmAppBarBack.dart';
import '../../widget/home/widgetCart&order.dart';
import '../../widget/home/widgetPrice.dart';

class ViewOneOrder extends StatelessWidget {
ControllerOrder co = Get.find();
ControllerCart ca = Get.find();
MyServises s = Get.find();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: TheColors.dustyRose,
      appBar:coustmAppBarBack(titel:'64'.tr ,context: context),
      body: Padding(padding: EdgeInsets.only(top: 10),
        child:  ListView(
          children: [
                  Padding(padding: EdgeInsets.all(8),child:  Container(
                    width: MediaQuery.of(context).size.width*0.90,
                    height: MediaQuery.of(context).size.height*0.20,
                    decoration: BoxDecoration(
                        boxShadow: [ BoxShadow(color: Colors.white, blurRadius: 5, spreadRadius: 0)],
                        color: Colors.white70,borderRadius: BorderRadius.only(topRight:Radius.circular(35),bottomLeft:Radius.circular(35)  )),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('102'.tr,style: Theme.of(context).textTheme.headline2,),
                            Text('103'.tr,style: Theme.of(context).textTheme.headline2,),
                            Text('100'.tr,style: Theme.of(context).textTheme.headline2,),//
                            Text('104'.tr,style: Theme.of(context).textTheme.headline2,),
                            //
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('${co.oneOrders[0].createTiem}',style: Theme.of(context).textTheme.headline2,),
                            Text(co.oneOrders[0].status==0?'96'.tr:'97'.tr,style: Theme.of(context).textTheme.headline2),
                            WidgetPrice(price: '${co.oneOrders[0].totalPrice}',),
                            Text('${co.oneOrders.length}',style: Theme.of(context).textTheme.headline2),
                          ],
                        ),
                      ],),
                  ),),
            Container(
              width: double.infinity,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: co.oneOrders.length,
                  itemBuilder: (context,i){
                    return Column(
                      children: [

                        WidgetCartOrder(
                          SizeK: co.oneOrders[i].sizeCart!,
                          colorK: co.oneOrders[i].colorCart! ,
                            name: s.sharedPreferences.getString('Lang')=='en'? co.oneOrders[i].name!:co.oneOrders[i].nameAr!,
                            idP:  co.oneOrders[i].id!,
                            image: co.oneOrders[i].image!,
                            listData:  co.oneOrders,
                            index: i,
                            widgetCount:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [

                             Text('106'.tr,style:Theme.of(context).textTheme.headline2
                            ,),
                             Text('${co.oneOrders[i].cartCount}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                           ],
                         ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('105'.tr,style: Theme.of(context).textTheme.headline2,),
                                  WidgetPrice(price: '${co.oneOrders[i].priec}',)
                                ],
                              ),
                            ]
                            ,),
                            clear: SizedBox()),


                      ],
                    );
                  }),
            ),



          ],
        ), ),
    );
  }
}

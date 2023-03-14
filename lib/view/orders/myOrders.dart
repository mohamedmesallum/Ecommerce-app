
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/controller/controllerOrder/controllerOrder.dart';
import 'package:ecommercea/view/orders/ordersCurrently.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/coustmAppBarBack.dart';
import '../../widget/home/iconCartAppBar.dart';
import '../../widget/home/widgetCategroyContrinar.dart';
import 'ordersComplete.dart';

class MyOrders extends StatelessWidget {
ControllerOrder co = Get.find();
  @override
  Widget build(BuildContext context) {
    return     DefaultTabController(

        length: 2,
        child:Scaffold(
backgroundColor: TheColors.dustyRose,
          appBar: AppBar(
            actions: [
           Center(child: IconCartAppBar(),),
            ],
            elevation: 0,
        backgroundColor: TheColors.dustyRose,
            foregroundColor: Colors.black,
            title: Text('64'.tr,style:Theme.of(context).textTheme.headline4,),
            //  backgroundColor:
            bottom:
            TabBar(
          // indicatorWeight: 5.0,
           //   overlayColor:MaterialStateProperty.all(Colors.pink),
       indicator: const BoxDecoration(
          color: TheColors.dustyRose
                    ),
              unselectedLabelStyle:const TextStyle(fontWeight: FontWeight.w900,fontSize: 17,fontFamily: 'ElMessiri'),
              unselectedLabelColor:Colors.black12,
              labelStyle:const TextStyle(fontWeight: FontWeight.w900,fontSize: 20,fontFamily: 'ElMessiri'),
              isScrollable:true,
              labelColor:Colors.black,
              tabs: [
                Tab(
                    child:
                    Container(child:Text('96'.tr,
                    ),
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical:3 ),
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey,blurRadius:1,spreadRadius: 0.5)],
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      )
                      ,)
                ),
                Tab(
                    child:
                   Container(child:Text('97'.tr,
                   ),
                   padding: const EdgeInsets.symmetric(horizontal: 15,vertical:3 ),
                   decoration: BoxDecoration(
                     boxShadow: [BoxShadow(color: Colors.grey,blurRadius:1,spreadRadius: 0.5)],
                     color: Colors.grey[100],
                     borderRadius: BorderRadius.circular(20),
                   )
                     ,)
                ),


              ],
            ),


          ),
          body:  TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CurrentlyOrders()
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:CompleteOrders(),

              ),

            ],),

        )
    );
  }
}

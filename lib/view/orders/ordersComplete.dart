
import 'package:ecommercea/controller/controllerOrder/controllerOrder.dart';
import 'package:ecommercea/core/function/HindlingDataView.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/OrdersWidget/OrdersWidget.dart';

class CompleteOrders extends StatelessWidget {
  ControllerOrder co = Get.find();
  MyServises s = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerOrder>(
        init: ControllerOrder(),
        builder: (co){
          return
            co.dataOrdersComplete.isEmpty?Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Icon(Icons.badge_outlined,size: 300,color: Colors.black38,),
                SizedBox(height: 8,),
                Text("110".tr,style:Theme.of(context).textTheme.headline2,textAlign:TextAlign.center ,)

              ],
            ),):
            Center(child: HindlingDataView(statusRequest: co.statusRequest!,
            widget: Padding(padding: EdgeInsets.all(8),
              child:Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder:(context,i)=>SizedBox(height: 15,),
                  itemCount: co.dataOrdersComplete.length,
                  itemBuilder: (context,i){
                    return   WidgetViewOrders(
                      onTap: (){
                        co.viewOneOrders(idOrders: co.dataOrdersComplete[i].idOrders!);
                      },
                      name:s.sharedPreferences.getString('Lang')=='en'? co.dataOrdersComplete[i].name!:co.dataOrdersComplete[i].nameAr!,
                      image: co.dataOrdersComplete[i].image!,
                      date: co.dataOrdersComplete[i].createTiem,
                      totalPrice:co.dataOrdersComplete[i].totalPrice,
                      id: co.dataOrdersComplete[i].idOrders!,
                    );
                  },
                ) ,),
            ), ),);
        });
  }
}
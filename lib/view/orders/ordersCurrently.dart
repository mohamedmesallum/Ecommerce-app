
import 'package:ecommercea/%20routes/namepages.dart';
import 'package:ecommercea/controller/controllerOrder/controllerOrder.dart';
import 'package:ecommercea/core/function/HindlingDataView.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/OrdersWidget/OrdersWidget.dart';

class CurrentlyOrders extends StatelessWidget {
  ControllerOrder co = Get.find();
  MyServises s = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerOrder>(
      init: ControllerOrder(),
        builder: (co){
      return
        co.dataOrdersCurrently.isEmpty?Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Icon(Icons.badge_outlined,size: 300,color: Colors.black38,),
            SizedBox(height: 8,),
            Text("98".tr,style: TextStyle(fontFamily: 'Caveat',fontWeight: FontWeight.w800,fontSize: 22,color: Colors.black,),textAlign:TextAlign.center ,)

          ],
        ),):
        Center(child: HindlingDataView(statusRequest: co.statusRequest!,
          widget: Padding(padding: EdgeInsets.all(8),
            child:Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder:(context,i)=>SizedBox(height: 15,),
                itemCount: co.dataOrdersCurrently.length,
                itemBuilder: (context,i){
                  return   WidgetViewOrders(
                    onTap: (){
                      co.viewOneOrders(idOrders: co.dataOrdersCurrently[i].idOrders!);
                      Get.toNamed(pageOneOrder);

                    },
                    name:s.sharedPreferences.getString('Lang')=='en'? co.dataOrdersCurrently[i].name!:co.dataOrdersCurrently[i].nameAr!,
                    image: co.dataOrdersCurrently[i].image!,
                    date: co.dataOrdersCurrently[i].createTiem,
                    totalPrice:co.dataOrdersCurrently[i].totalPrice,
                    id: co.dataOrdersCurrently[i].idOrders!,
                  );
  },
              ) ,),
          ), ),);
    });
  }
}

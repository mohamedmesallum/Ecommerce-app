
import 'package:ecommercea/controller/controllerHome/controllerProducts/controllerProducts.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:ecommercea/widget/home/size/widgetSiez.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color.dart';
import '../widgetBouttonCart.dart';
import 'color/ViewColorsP.dart';


class ContainerInfoPro extends StatefulWidget {
  const ContainerInfoPro({Key? key}) : super(key: key);

  @override
  State<ContainerInfoPro> createState() => _ContainerInfoProState();
}

class _ContainerInfoProState extends State<ContainerInfoPro> {
  ControllerProducts c = Get.find();
  @override
  MyServises s = Get.find();
  @override
  Widget build(BuildContext context) {
   return GetBuilder<ControllerProducts>(
      init: ControllerProducts(),
      builder: (c)=>
          Center(
            child: Container(
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(color: TheColors.dustyRose, blurRadius: 40, spreadRadius: 20)
              ], color: Colors.white70, borderRadius: BorderRadius.circular(35)),
              width: MediaQuery.of(context).size.width * 0.90,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(s.sharedPreferences.getString('Lang')=='en'?'${c.product!.data![0].name}':'${c.product!.data![0].nameAr}',
                        style: Theme.of(context).textTheme.headline4),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        child: Text(s.sharedPreferences.getString('Lang')=='en'?'${c.product!.data![0].description}':'${c.product!.data![0].descriptionAr}',
                            style: Theme.of(context).textTheme.headline2)),
                    const SizedBox(
                      height: 5,
                    ),
                    GetBuilder<ControllerProducts>(
                        builder:(c)=>
                        c.product!.color!.isEmpty?
                        SizedBox():
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child:  WidgetViewColorsP()

                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    GetBuilder<ControllerProducts>(
                        builder:(c)=>
                        c.product!.color!.isEmpty?
                        SizedBox():
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child:WidgetSize()
                              //WidgetSiez(),
                            ),

                          ],
                        )),
                    const SizedBox(
                      height: 5,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('\$',style: TextStyle(fontWeight: FontWeight.w700,
                                fontSize: 22,color: Colors.black87),),
                            SizedBox(width: 2,),
                            Text('${c.product!.data![0].priec}',style: const TextStyle(fontWeight: FontWeight.w800,
                                fontSize: 22,color:Colors.black),),

                          ],
                        ),

                        // const Spacer(),
                        if(c.product!.data![0].discount != 0)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('\$',style: TextStyle(fontWeight: FontWeight.w700,
                                fontSize: 20,color: Colors.black54,),),
                              SizedBox(width: 2,),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text('${c.product!.data![0].oldpriec}',style:  TextStyle(fontWeight: FontWeight.w800,
                                    fontSize: 20,color:Colors.black54,),),
                                  Column(
                                    children:[
                                      Container(height: 1,width: 20,color: Colors.black,),
                                      const SizedBox(height: 1,),
                                      Container(height: 1,width: 20,color: Colors.black,),
                                    ],
                                  )

                                ],)

                            ],
                          ),


                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    const Divider(
                      thickness: 2,
                      height: 0,
                      color: Colors.black38,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    AddToCart(idP: '${c.product!.data![0].id}',),

                  ],
                ),
              ),
            ),
          ),
    );
  }
}

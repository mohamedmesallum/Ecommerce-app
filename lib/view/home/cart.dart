
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/controller/controllerFavorites&Cart/controllerCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../controller/controllerOrder/controllerOrder.dart';
import '../../widget/bottom.dart';
import '../../widget/home/widgetCart&order.dart';
import '../../widget/home/widgetCart.dart';

class Cart extends StatelessWidget {

  ControllerOrder co = Get.put(ControllerOrder());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:TheColors.dustyRose,


      body: GetBuilder<ControllerCart>(
          init: ControllerCart(),
          builder: (Ca)=>
          Ca.cartBool==false?
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const Icon(Icons.shopping_cart_rounded,size: 300,color: Colors.black38,),
                const  SizedBox(height: 8,),
                Text("113".tr,style: TextStyle(fontFamily: 'Caveat',fontWeight: FontWeight.w900,fontSize: 22,color: Colors.black,),textAlign:TextAlign.center ,)

              ],
            ),
          ):
          Padding(padding: EdgeInsets.only(top: 10),
            child:  ListView(
              children: [

                Container(
                  width: double.infinity,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Ca.dataCart!.data!.length,
                      itemBuilder: (context,i){
                        return Column(
                          children: [

                           WidgetCart(listData:Ca.dataCart!.data! ,inedx: i,colorK:Ca.dataCart!.data![i].colorCart!,SizeK:Ca.dataCart!.data![i].sizeCart! ,),


                          ],
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.85,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(75),
                            bottomLeft: Radius.circular(100),bottomRight: Radius.circular(50) ),
                        color: TheColors.dustyRose,
                        boxShadow: [BoxShadow(color:TheColors.dustyRose, blurRadius: 5, spreadRadius: 0)]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('100'.tr,style: Theme.of(context).textTheme.headline3,),

                            Chip(

                              backgroundColor:Colors.white,
                              elevation:4,
                              shadowColor: Colors.white,

                              //  labelPadding:EdgeInsets.all(3),
                              label: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('\$ ',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: Colors.black,)),
                                  Text('${Ca.totalPriceCart.toStringAsFixed(2)}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,)),

                                ],
                              ),

                            ),


//
                          ],
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('107'.tr,style: Theme.of(context).textTheme.headline3,),

                            Text('',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900,color:Colors.black,),),


//
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 20,),child:    Container(

                          width: MediaQuery.of(context).size.width*0.60,
                          child:   CustombButton('108'.tr, () {
                            Get.toNamed(pageSelectAddress,arguments: Ca.dataCart!.data);
                            co.argument(totalPrice: Ca.totalPriceCart);
                          }, Colors.black38,Colors.white,
                          ),),),
                      ],
                    ),
                  ),
                ),


              ],
            ), )

      ),
    );
  }
}

/*
 WidgetCartOrder(
                                SizeK: Ca.DataCart!.data![i].sizeCart!,
                                colorK:Ca.DataCart!.data![i].colorCart! ,
                                name: Ca.DataCart!.data![i].name!,
                                idP: Ca.DataCart!.data![i].id!,
                                image: Ca.DataCart!.data![i].image!,
                                listData:  Ca.DataCart!.data!,
                                index: i,
                                widgetCount:
                                Container(
                                  child: GetBuilder<ControllerCart>(
                                    init: ControllerCart(),
                                    builder: (ca)=>
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Text('\$',style: TextStyle(fontWeight: FontWeight.w700,
                                                    fontFamily: 'SignikaNegative',fontSize: 18,color: Colors.black87),),
                                                SizedBox(width: 2,),
                                                Text('${ca.DataCart!.data![i].priec * ca.DataCart!.data![i].count } ',style: const TextStyle(fontWeight: FontWeight.w800,
                                                    fontSize:19,color:Colors.black),),

                                              ],
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: (){
                                                    Ca.minusCount(count: Ca.DataCart!.data![i].count!);

                                                  },
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Container(
                                                        height: 20,
                                                        width: 20,
                                                        color: Colors.grey[200],
                                                        child: Icon(Icons.remove,),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 12,),
                                                Text('${Ca.DataCart!.data![i].count}',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w900),),
                                                SizedBox(width: 12,),
                                                InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      Ca.DataCart!.data![i].count++;
                                                    });

                                                  },
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Container(
                                                        height: 20,
                                                        width: 20,
                                                        color: Colors.white70,
                                                        child: Icon(Icons.add,),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )

                                          ],
                                        ),
                                  ),),
                                clear:    IconButton(onPressed: ()async{
                                  await Ca.MapAddAndDeleteCart(id:'${Ca.DataCart!.data![i].productsId}');
                                  Ca.AddAndDeleteCart(idProduct:'${ Ca.DataCart!.data![i].productsId}' ,
                                      Scolor: '${ Ca.DataCart!.data![i].colorCart}',
                                      Ssize: '${ Ca.DataCart!.data![i].sizeCart}');
                                }, icon: Icon(Icons.clear,color: Colors.black,size: 20,),)),
*/
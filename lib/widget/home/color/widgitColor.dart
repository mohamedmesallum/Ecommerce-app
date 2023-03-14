import 'package:ecommercea/controller/controllerHome/controllerProducts/controllerProducts.dart';
import 'package:ecommercea/core/function/HindlingDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controllerFavorites&Cart/controllerStaticCart.dart';


class ColorsWidgets extends StatefulWidget {
  const  ColorsWidgets({Key? key}) : super(key: key);

  @override
  State<ColorsWidgets> createState() => _ColorsWidgetsState();
}

class _ColorsWidgetsState extends State<ColorsWidgets> {
  ControllerProducts c = Get.find();
  var SelectColor;
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ControllerSelectCS>(
      init: ControllerSelectCS(),
      builder: (sc)=>
          SizedBox(
            // color:  Colors.black26,
            width:  double.infinity,
          //  height: 40,
            child:
            SingleChildScrollView(
              padding:const EdgeInsets.all(3),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('63'.tr,style:Theme.of(context).textTheme.headline2),
                  const SizedBox(width: 8,),
                  if(c.product!.color![0].white==1)
              Column(children: [
                const CircleAvatar(
                    radius: 12.02,backgroundColor: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: CircleAvatar(radius: 12,backgroundColor:Colors.white,),
                    )),
                Radio(value: 'white', groupValue: sc.color, onChanged:(String? value){
                  sc.selectColor(value);
                })
              ],),

                  if(c.product!.color![0].yellow==1)
                    Column(children: [
                      const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: CircleAvatar(radius: 12,backgroundColor:Colors.yellow,),
                          ),
                      Radio(value: 'yellow', groupValue: sc.color, onChanged:(String? value){
                        sc.selectColor(value);
                      })
                    ],),
                  if(c.product!.color![0].blue==1)
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: CircleAvatar(radius: 12,backgroundColor:Colors.blue,),
                      ),
                      Radio(value: 'blue', groupValue: sc.color, onChanged:(String? value){
                        sc.selectColor(value);
                      })
                    ],),
                  if(c.product!.color![0].red==1)
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: CircleAvatar(radius: 12,backgroundColor:Colors.red,),
                      ),
                      Radio(value: 'red', groupValue: sc.color, onChanged:(String? value){
                        sc.selectColor(value);
                      })
                    ],),

                if(c.product!.color![0].green==1)
                  Column(children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: CircleAvatar(radius: 12,backgroundColor:Colors.green),
                    ),
                    Radio(value: 'green', groupValue: sc.color, onChanged:(String? value){
                      sc.selectColor(value);
                    })
                  ],),

                  if(c.product!.color![0].black==1)
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: CircleAvatar(radius: 12,backgroundColor:Colors.black,),
                      ),
                      Radio(value: 'black', groupValue: sc.color, onChanged:(String? value){
                        sc.selectColor(value);
                      })
                    ],),
                  if(c.product!.color![0].azure==1)
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: CircleAvatar(radius: 12,backgroundColor:Colors.blueAccent,),
                      ),
                      Radio(value: 'azure', groupValue: sc.color, onChanged:(String? value){
                        sc.selectColor(value);
                      })
                    ],),

                  if(c.product!.color![0].brown==1)
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: CircleAvatar(radius: 12,backgroundColor:Colors.brown,),
                      ),
                      Radio(value: 'brown', groupValue: sc.color, onChanged:(String? value){
                        sc.selectColor(value);
                      })
                    ],),
                        if(c.product!.color![0].silver==1)
                          Column(children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3),
                              child: CircleAvatar(radius: 12,backgroundColor:Colors.white54,),
                            ),
                            Radio(value: 'silver', groupValue: sc.color, onChanged:(String? value){
                              sc.selectColor(value);
                            })
                          ],),
                  if(c.product!.color![0].purple==1)
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: CircleAvatar(radius: 12,backgroundColor:Colors.purple,),
                      ),
                      Radio(value: 'purple', groupValue: sc.color, onChanged:(String? value){
                        sc.selectColor(value);
                      })
                    ],),


                  if(c.product!.color![0].orange==1)
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: CircleAvatar(radius: 12,backgroundColor:Colors.orange,),
                      ),
                      Radio(value: 'orange', groupValue: sc.color, onChanged:(String? value){
                        sc.selectColor(value);
                      })
                    ],),
                  if(c.product!.color![0].gray==1)
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: CircleAvatar(radius: 12,backgroundColor:Colors.grey,),
                      ),
                      Radio(value: 'gray', groupValue: sc.color, onChanged:(String? value){
                        sc.selectColor(value);
                      })
                    ],),


                ],),
            ) ,
          ),

    );
  }
}

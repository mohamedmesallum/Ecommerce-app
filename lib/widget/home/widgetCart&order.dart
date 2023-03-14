
import 'package:ecommercea/widget/home/size/SelectSiez.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../controller/controllerHome/controllerProducts/controllerProducts.dart';
import '../../core/url.dart';
import 'color/selectColorCart.dart';

class WidgetCartOrder extends StatelessWidget {
final String name;
final int idP;
final String image;
final List listData;
final int index;
final Widget widgetCount;
final Widget clear;
final String colorK;
final String SizeK;
WidgetCartOrder({required this.SizeK,required this.colorK,required this.name, required this.idP, required this.image, required this.listData, required this.index, required this.widgetCount, required this.clear});

  ControllerProducts cp = Get.find();


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () async {
            Get.toNamed(productsView);
            await cp.getProducts(
                id: idP);
          },
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.22,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.95,
            decoration: BoxDecoration(
               color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25)
            ),
            child:
            LayoutBuilder(
                builder: (context, BoxConstraints) =>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            '${urlImages}/${image}')
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular((15))),
                                  ),
                                  height: BoxConstraints.maxHeight,
                                  width: BoxConstraints.maxWidth * 0.35,

                                ),

                              ],
                            ),
                            Stack(
                              alignment: Alignment.topRight,

                              children: [

                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),

                                    ),

                                    height: BoxConstraints.maxHeight,
                                    width: BoxConstraints.maxWidth * 0.65,
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Container(child: Text( name, style: Theme.of(context).textTheme.headline2,)),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceAround,
                                            children: [
                                              Row(
                                                children: [
                                                  Text('63'.tr,
                                                    style:Theme.of(context).textTheme.headline2,),
                                                  SizedBox(width: 6,),
                                                  SelectColorCart(colorK:colorK,),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('62'.tr,
                                                    style: Theme.of(context).textTheme.headline2,),
                                                  SizedBox(width: 6,),
                                                  SelectSize(SizeK: SizeK,
                                                    ),

                                                ],
                                              ),
                                            ],
                                          ),
                                          widgetCount

                                          // SelectColorCart(listData: widget.listData,inedx: widget.inedx,)




                                        ],
                                      ),
                                    )),
                                clear
                              ],
                            ),
                          ],
                        )
                      ],
                    )
            ),

          ),
        )
    );
  }
}

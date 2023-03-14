
import 'package:ecommercea/controller/controllerHome/controllerProducts/controllerProducts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/controllerFavorites&Cart/controllerStaticCart.dart';
import '../../../model/cartmodel.dart' as Cart;
import 'containerSiez.dart';



class ViewSiezPr extends  StatelessWidget{
  ControllerProducts p = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerSelectCS>(
      init: ControllerSelectCS(),
      builder: (c)=>
          Container(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('62'.tr,style:Theme.of(context).textTheme.headline2),
                  if(p.product!.size![0].small==1)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerSiez(name: 'S',),
                      Radio(value: 'S', groupValue:  c.selectSize, onChanged: (String? valu){
                        c.selectSeiz(valu);
                      }),
                      //  widget.widgetSlect
                    ],
                  ),
                  if(p.product!.size![0].medium==1)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerSiez(name: 'M',),
                      Radio(value: 'M', groupValue:  c.selectSize, onChanged: (String? valu){
                        c.selectSeiz(valu);
                      }),
                      //  widget.widgetSlect
                    ],
                  ),
                  if(p.product!.size![0].large==1)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerSiez(name: 'L',),
                      Radio(value: 'L', groupValue:  c.selectSize, onChanged: (String? valu){
                        c.selectSeiz(valu);
                      }),
                      //  widget.widgetSlect
                    ],
                  ),
                  if(p.product!.size![0].xLarge==1)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerSiez(name: 'XL',),
                      Radio(value: 'XL', groupValue:  c.selectSize, onChanged: (String? valu){
                        c.selectSeiz(valu);
                      }),
                      //  widget.widgetSlect
                    ],
                  ),
                  if(p.product!.size![0].xxLarge==1)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ContainerSiez(name: 'XXL',),
                        Radio(value: 'XXL', groupValue:  c.selectSize, onChanged: (String? valu){
                          c.selectSeiz(valu);
                        }),
                        //  widget.widgetSlect
                      ],
                    ),
                ],
              ),
            ),
          ),
    );
  }
}

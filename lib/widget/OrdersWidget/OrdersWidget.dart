
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controllerOrder/controllerOrder.dart';
import '../../core/url.dart';
import '../home/widgetPrice.dart';

class WidgetViewOrders extends StatefulWidget {
final String image;
final String name;
 final String date;
dynamic totalPrice;

final int id;
final Function() onTap;
WidgetViewOrders({required this.name,required this.image,required this.date,required this.totalPrice,required this.id, required this.onTap});
  @override
  State<WidgetViewOrders> createState() => _WidgetViewOrdersState();
}

class _WidgetViewOrdersState extends State<WidgetViewOrders> {
  int lengthItems = 0 ;
  ControllerOrder c = Get.find();
  @override
void initState() {

lengthItems = c. lengthItemOrder(idOrders: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(

        decoration:  BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.white, blurRadius: 1, spreadRadius: 1)
        ], color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width*90,
        child:
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width:MediaQuery.of(context).size.width*0.25 ,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${urlImages}/${widget.image}'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              child:  Padding(padding: EdgeInsets.all(8),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    lengthItems>1?
                    Text('${widget.name} \n & ${lengthItems-1} + ${'99'.tr}',style:Theme.of(context).textTheme.headline2,):
                    Text(widget.name,style: Theme.of(context).textTheme.headline2,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       Text('100'.tr,style:Theme.of(context).textTheme.headline2 ,),
                        WidgetPrice(price: '${widget.totalPrice}',),

                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('101'.tr,style: Theme.of(context).textTheme.headline2),
                        Text('${widget.date}',style: Theme.of(context).textTheme.headline2
                          ,),

                      ],
                    ),

                  ],
                ) ,),
            )
          ],
        ),

      ),
    );

  }
}

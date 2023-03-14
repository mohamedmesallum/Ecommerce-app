import 'package:ecommercea/core/serviese/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidhetNameAndSeeAll extends StatelessWidget {
  final String name;
  final Function() OnTapSeeAll;
 WidhetNameAndSeeAll({required this.name,required this.OnTapSeeAll});
 MyServises s = Get.find();

  @override
  Widget build(BuildContext context) {
    return   Row(
    children: [
    Text(name,style:Theme.of(context).textTheme.headline4),
    Spacer(),
    InkWell(
      onTap: OnTapSeeAll,
      child: Text('48'.tr,style:TextStyle(color: Colors.pink[300],
      fontWeight: FontWeight.w900,fontSize: 16,fontFamily:  'Caveat'),),
    ),
      s.sharedPreferences.getString('Lang')=='ar'?
    Icon(Icons.keyboard_double_arrow_left,color: Colors.pink[300],size: 20,):
      Icon(Icons.keyboard_double_arrow_right,color: Colors.pink[300],size: 20,)
    ],
    );
  }
}



import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercea/controller/controllerHome/controllerAddress.dart';
import 'package:ecommercea/controller/controllerHome/controllerStitcAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../core/color.dart';

import '../../model/userAddress.dart' as S;
import '../widgetDilogacation.dart';
import 'buttomsmol.dart';

class ContainerAddes extends StatelessWidget {
final Widget widget;
final List<S.Data> listData;
final int index;
ContainerAddes({required this.listData,required this.index,required this.widget});
Controlleraddres ad = Get.find();


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        color: Colors.grey[100],

        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  height: 35,
                  width:35,

                  child: Center(child: Icon(Icons.home,color: Colors.pink[400],size: 25,),),
                ),
                SizedBox(width: 12,),
                Text('${listData[index].nameAddress}',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.black),),
                Spacer(),
                  widget
              ],
            ),
            Container(
              child: Text('${listData[index].addressDetails}',style: TextStyle(fontSize: 17,color: Colors.black38,fontWeight: FontWeight.w900,overflow: TextOverflow.ellipsis,),maxLines: 4,),
            ),
            SizedBox(height: 12,),
            Container(
              child: Text('+ ${listData[index].phoneAddress}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900,color: Colors.black38,overflow: TextOverflow.ellipsis,),maxLines: 4,),
            ),
          ],
        ),
      ),
    );
  }
}

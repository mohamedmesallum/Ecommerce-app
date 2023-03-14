import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/color.dart';
import 'home/buttomsmol.dart';

AwesomeDialog Dilogeacaion({required BuildContext context,required String titel,required Function() ontap}){
  return  AwesomeDialog(context: context,padding: EdgeInsets.all(10),
    barrierColor: Colors.black26,
   dialogBackgroundColor:TheColors.dustyRose,
    dialogType:DialogType.INFO,
    body: Column(
      children: [
       Text(titel,style:const TextStyle(fontSize: 18,color:Colors.black87,fontWeight: FontWeight.w900,),),
        const SizedBox(height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  color: Colors.red,
                ),
                width: 120,
                child: ButtomSmal(titel: '92'.tr,onTap: (){
                  Get.back();
                },)),
            SizedBox(width: 10,),
            Container(
                width: 90,
                child: ButtomSmal(titel: '93'.tr,onTap: ontap,)),
          ],),
      ],
    ),
  )..show();
}
Future  WidgtDialog({required BuildContext context,required String nameImage,required String Textbody,
  required String Texttitel,required Widget widget}){
  return
    showDialog(barrierColor: Colors.black54,context: context,builder:(context){
      return
        AlertDialog(
          titlePadding:const EdgeInsets.only(top: 10,left: 5,right: 5),
          elevation:100,
          title:Container(
            height: MediaQuery.of(context).size.height *0.60,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(child: Container(child: Image.asset(nameImage,fit: BoxFit.cover,))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(Texttitel,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: Colors.black87),textAlign: TextAlign.center,),
                      const SizedBox(height: 30,),
                      Text(Textbody,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black38),textAlign: TextAlign.center,),
                      const SizedBox(height: 20,),
                      widget,
                    ],
                  ),
                ),


              ],
            ),
          ),
        );
    });
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/color.dart';
import '../controller/controllerFavorites&Cart/controllerCart.dart';
AppBar coustmAppBarBack({required String titel,required BuildContext context}){
   return AppBar(
     elevation: 0,
     backgroundColor:TheColors.dustyRose,
     foregroundColor: Colors.black,
     title: Text(titel,style:Theme.of(context).textTheme.headline4,),

     leading: IconButton(onPressed: (){
       //  FocusScope.of(context).unfocus();
       Get.back();
     },icon: const Icon(Icons.arrow_back_sharp,size: 27,),),
     actions: [
       Center(child: Padding(
         padding:const EdgeInsets.symmetric(horizontal: 5),
         child:
         Stack(
           alignment: Alignment.topLeft,
           children: [
             IconButton(icon: const Icon(Icons.badge_outlined,size: 30,color: Colors.black,),onPressed: (){},),
             GetBuilder<ControllerCart>(
                 init: ControllerCart(),
                 builder: (ca)=>
                 ca.cartMap.isNotEmpty?
                 Opacity(
                   opacity: 0.5,
                   child: CircleAvatar(
                       backgroundColor: Colors.black,
                       radius: 12,
                       child: Text('${ca.cartMap.length}',style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.white,fontSize: 16),)),
                 ):Text('')
             )
           ],
         ),

       )),
     ],
   );
 }

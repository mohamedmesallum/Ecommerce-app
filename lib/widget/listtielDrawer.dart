import 'package:ecommercea/core/color.dart';
import 'package:flutter/material.dart';

Widget ListTielDrawer({required Function() onTap, required String titel,required IconData icons,required BuildContext context,}){

  return  ListTile(

    onTap:onTap,
    leading: Container(
      decoration: BoxDecoration(
          color: Colors.white70,
        borderRadius: BorderRadius.circular(8)
      ),
      height: 35,
      width:35,

      child: Center(child: Icon(icons,color: Colors.pink[400],size: 25,),),
    ),

    title:Text(titel,style: Theme.of(context).textTheme.headline3,),

  );
}
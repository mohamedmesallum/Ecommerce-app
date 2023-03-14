
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color.dart';

AppBar widgetAppBarLogin({required String titel,required BuildContext context}){
  return AppBar(
    foregroundColor: Colors.black38,
    backgroundColor:TheColors.dustyRose ,
    elevation: 0,
    title: Text(titel,style: Theme.of(context).textTheme.headline6,),
    // leading: Icon(Icons.arrow_back_ios),
  );
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog DialogErorr({required BuildContext context,required String titel , required DialogType dialogType}){
  return
    AwesomeDialog(context: context,title:titel ,padding: EdgeInsets.all(10),
        dialogType:dialogType,
        titleTextStyle:const TextStyle(fontSize: 18,color: Colors.black87,fontWeight: FontWeight.w900))..show();
}
import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String namehient;
  final Icon prefixicons;
  final TextInputType  keyboard;
  Widget? suffixIcons;
  final String? Function(String?) valid;
  final TextEditingController controller;


  Field(this.suffixIcons,{required this.namehient,required this.prefixicons,required this.keyboard,
    required this.valid,required this.controller});
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      // height: 65,
     width: double.infinity,
      padding: const EdgeInsets.only(left: 4,bottom: 0,right: 4),
      decoration: BoxDecoration(
          color: Colors.grey[200],

          borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
          key: Key(namehient),
          controller: controller,
          validator: valid,
          keyboardType:keyboard,
          style:const TextStyle(
              fontSize: 20,color: Colors.black,fontWeight: FontWeight.w800
          ),
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.w800,),
            enabledBorder:InputBorder.none,
            disabledBorder:InputBorder.none,
            // errorBorder:InputBorder.none,
            focusedBorder:InputBorder.none,
            prefixIcon:prefixicons,
            //Icon(,size:28,color: Colors.black38,),

            suffixIcon:suffixIcons,
            hintText:namehient,
            hintStyle: Theme.of(context).textTheme.headline6

          )

      ),
    );

  }
}
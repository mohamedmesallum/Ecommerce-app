import 'package:flutter/material.dart';

class FieldReview extends StatelessWidget{
  final int maxLinesfield;
  final String namehient;
  final String? Function(String?) valid;
  final TextEditingController controller;
  bool? isread;
  FieldReview( this.isread,{required this.namehient,required this.maxLinesfield,
    required this.valid,required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // height: 65,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 4,bottom: 0,right: 4),
      decoration: BoxDecoration(

        color: Colors.blueGrey[50],
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 5,left: 5),
        child: TextFormField(
          validator: valid,
            readOnly:isread!,
            maxLines:maxLinesfield,
            key: Key(namehient),
            controller: controller,
            keyboardType:TextInputType.text,
            style:const TextStyle(
                fontSize: 19,color: Colors.black,fontWeight: FontWeight.w700
            ),
            decoration: InputDecoration(

              errorStyle:const TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.w500),
              enabledBorder:InputBorder.none,
              disabledBorder:InputBorder.none,
              // errorBorder:InputBorder.none,
              focusedBorder:InputBorder.none,
              hintText:namehient,

              hintStyle: const TextStyle(

                fontSize: 18,
                color: Colors.black38,

              ),

            )

        ),
      ),
    );
  }

}
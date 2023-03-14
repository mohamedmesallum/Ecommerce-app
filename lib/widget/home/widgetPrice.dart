
import 'package:flutter/material.dart';

class WidgetPrice extends StatelessWidget {
  final String price;
  WidgetPrice({required this.price}) ;

  @override
  Widget build(BuildContext context) {

    return      Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('\$',style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'ElMessiri',
            fontSize: 18,color: Colors.black87),),
        const SizedBox(width: 2,),
        Text('${price}',style: const TextStyle(fontWeight: FontWeight.w900,fontFamily: 'ElMessiri',
            fontSize:18,color: Colors.black87),),
      ],
    );
  }
}

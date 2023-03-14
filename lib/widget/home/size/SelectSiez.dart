
import 'package:flutter/material.dart';

import '../../../model/cartmodel.dart' as Cart;
import 'containerSiez.dart';
class SelectSize extends StatelessWidget {

final String SizeK;
  const SelectSize({required this.SizeK});


  @override
  Widget build(BuildContext context) {
    return
       Container(
         child: SingleChildScrollView(
           physics: const BouncingScrollPhysics(),
           scrollDirection: Axis.horizontal,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [

               if(SizeK=='S')
                     ContainerSiez(name: 'S',),
               if(SizeK=='M')
                     ContainerSiez(name: 'M',),

               if(SizeK=='L')
                   ContainerSiez(name: 'L',),
               if(SizeK=='XL')
                     ContainerSiez(name: 'XL',),
               if(SizeK=='XXL')
                     ContainerSiez(name: 'XXL',),
             ],
           ),
         ),
       );

  }
}

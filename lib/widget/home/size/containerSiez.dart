import 'package:ecommercea/core/color.dart';
import 'package:flutter/material.dart';

class ContainerSiez extends StatelessWidget {
 final String name;
  ContainerSiez({required this.name});
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: 25,
        width: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: TheColors.dustyRose,width: 2),
        ),
        child: Text(name,style: TextStyle(fontFamily: 'Caveat',fontSize: 18,fontWeight: FontWeight.w900),),
      ),
    );
  }
}

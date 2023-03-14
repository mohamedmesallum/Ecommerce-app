
import 'package:flutter/material.dart';

import '../../core/color.dart';

class ContrainerListViewCatg extends StatelessWidget {
final String name;
final Function() onTap;
   ContrainerListViewCatg({required this.name,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Chip(
        backgroundColor: Colors.white,
        elevation:2,
        shadowColor: Colors.black,
        labelPadding:const EdgeInsets.all(3),
        label:  Text(name,style:Theme.of(context).textTheme.headline4,
        ),),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/myclass/textThem/textThem.dart';

class ButtomSmal extends StatelessWidget {
final Function() onTap;
final String titel;
ButtomSmal({required this.onTap,required this.titel});
  @override
  Widget build(BuildContext context) {
    return    InkWell(
      onTap:onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.50,
        padding: const EdgeInsets.only(top: 7, bottom: 7),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        child:   Text(
          titel,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize:Theme.of(context).textTheme==themeDataEng? 20:17, color: Colors.white,fontFamily:'Caveat',fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

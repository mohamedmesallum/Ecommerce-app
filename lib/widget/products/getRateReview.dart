
import 'package:flutter/material.dart';

class RateReviews extends StatelessWidget {
  final int rate;
  RateReviews(this.rate);
  @override
  Widget build(BuildContext context) {
    return
      rate==1.0?
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star_border,color: Colors.yellow,),
          Icon(Icons.star_border,color: Colors.yellow,),
          Icon(Icons.star_border,color: Colors.yellow,),
          Icon(Icons.star_border,color: Colors.yellow,),
        ],
      ):
      rate==2.0?
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star_border,color: Colors.yellow,),
          Icon(Icons.star_border,color: Colors.yellow,),
          Icon(Icons.star_border,color: Colors.yellow,),
        ],
      ):
      rate==3.0?
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star_border,color: Colors.yellow,),
          Icon(Icons.star_border,color: Colors.yellow,),
        ],
      ):
      rate==4.0?
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star_border,color: Colors.yellow,),
        ],
      ):
      rate==5.0?
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
        ],
      ):
          rate == 0 ?
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.star_border,color: Colors.yellow,),
              Icon(Icons.star_border,color: Colors.yellow,),
              Icon(Icons.star_border,color: Colors.yellow,),
              Icon(Icons.star_border,color: Colors.yellow,),
              Icon(Icons.star_border,color: Colors.yellow,),
            ],
          ):
      SizedBox();
  }
}
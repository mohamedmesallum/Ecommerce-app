
import 'package:ecommercea/core/url.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class SliderContainer extends StatelessWidget {

final String image;
final Function()favorite;
final Function() onDoubleTap;

SliderContainer({required this.image,
  required this.favorite,required this.onDoubleTap,
});


  @override
  Widget build(BuildContext context) {
                  return

                           SizedBox(
                              child: Image.network('${urlImages}/${image}',fit: BoxFit.fill,),
                              width:  MediaQuery.of(context).size.width *0.90,
                             height: MediaQuery.of(context).size.height * 0.24,
                              //  margin: EdgeInsets.symmetric(horizontal: 5.0),

    );
  }
}

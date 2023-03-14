import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color.dart';
import '../../controller/controllerHome/controllerProducts/controllerProducts.dart';
import '../../core/url.dart';
import 'dateTimeReview.dart';
import 'getRateReview.dart';

class GetReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ControllerProducts>(
      init:ControllerProducts(),
      builder: (c)=>
          Center(
            child:   Container(
                decoration: BoxDecoration(
                    boxShadow:const [BoxShadow(color: TheColors.dustyRose, blurRadius: 40, spreadRadius: 20)],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35)
                ),
                width: MediaQuery.of(context).size.width*0.90,

                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // reverse:true,
                    separatorBuilder: (context,i)=>const SizedBox(height: 15,),
                    itemCount: c.product!.review!.length,
                    itemBuilder: (context,i){
                      return
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    c.product!.review![i].image != null?
                                    CircleAvatar(
                                      radius: 25,

                                      backgroundImage: NetworkImage('${urlImageUser}/${c.product!.review![i].image}',),
                                    ):
                                    const CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.blue,
                                    ),
                                    const SizedBox(width: 5,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                            onTap: (){
                                              DateTime x = DateTime.parse('${c.product!.review![i].createTiem}');
                                              print(DateTime.now().year - x.year);
                                            },
                                            child: Text('${c.product!.review![i].username}',style: const TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.black),)),
                                        const SizedBox(height: 8,),
                                        Row(

                                          children: [
                                            const Icon(Icons.timelapse,color: Colors.black87,size:12,),
                                            const SizedBox(width: 5,),
                                            DateTimeReview(DateTime.parse('${c.product!.review![i].createTiem}')),
                                          ],
                                        ),
                                        const SizedBox(height: 8,),
                                        RateReviews(int.parse('${c.product!.review![i].rate}')),

                                        const SizedBox(height: 8,),
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          padding: const EdgeInsets.all(8),
                                          // height: 150,
                                          width: MediaQuery.of(context).size.width*0.60,
                                          color: Colors.grey[100],
                                          child: Text('${c.product!.review![i].comment}',style: const TextStyle(fontWeight: FontWeight.w800,fontSize: 17,color: Colors.black54),),
                                        )
                                      ],
                                    )
                                   ,


                                  ],
                                )
                              ],),
                          ),
                        );
                    },

                  ),
                )
            ),),
    );
  }
}
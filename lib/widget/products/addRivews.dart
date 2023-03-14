
import 'package:ecommercea/controller/controllerHome/controllerProducts/controllerReview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color.dart';
import '../../core/myclass/statusRequest.dart';

import 'fieldReview.dart';

class AddRaviews extends GetView<ControllerReview> {


 final String idp;
  AddRaviews({required this.idp});
  var   Controllername = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child:   Container(
        decoration: BoxDecoration(
            boxShadow: [ BoxShadow(color: TheColors.dustyRose, blurRadius: 40, spreadRadius: 20)],
            color: Colors.white,
            borderRadius: BorderRadius.circular(35)
        ),
        width: MediaQuery.of(context).size.width*0.90,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<ControllerReview>(
            init: ControllerReview(),
            builder: (controller)=>
            Form(
              key:controller.formstetReview,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('53'.tr,style: const TextStyle(color:Colors.black,fontSize:17,fontWeight: FontWeight.w900)),
                  const SizedBox(height: 12,),
                  Container(
                    child: FieldReview(true,maxLinesfield: 1,namehient: '${controller.controllerLogin.user.data!.username}', valid: (text){}, controller:Controllername),
                  ),
                  const SizedBox(height: 12,),
                  Text('54'.tr,style: const TextStyle(color:Colors.black,fontSize:17,fontWeight: FontWeight.w900)),
                  const SizedBox(height: 12,),
                  SizedBox(
                    height: 150,
                    child: FieldReview(false,maxLinesfield: 10,namehient: '55'.tr, valid: (text){
                      if(text!.isEmpty){
                        return '56'.tr ;
                      }else{
                        return null;
                      }
                    }, controller:controller.controllerComment),
                  ),
                  const SizedBox(height: 12,),
               Text('57'.tr,style: const TextStyle(color:Colors.black,fontSize:17,fontWeight: FontWeight.w900)),
                  const SizedBox(height: 7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
                      InkWell(
                          onTap: (){
                            controller.badRate();
                          },
                          child:
                     Text('58'.tr,style: TextStyle(color:Colors.red,fontSize:16,fontWeight: FontWeight.w900))),
                      const SizedBox(width: 8,),
                      SizedBox(
                       height: 40,
                          child: ListView.builder(
                            shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                          itemCount: controller.Starts.length,
                          itemBuilder: (context , i ){
                            return InkWell(
                                onTap: (){
                            controller.changeRate(index:i,);
                                },
                                child:(controller.Starts[i]==false?
                                const Icon(Icons.star_border,color: Colors.yellow):
                                const Icon(Icons.star,color: Colors.yellow)
                                ));
                          })

                      ),
                      const SizedBox(width: 8,),
                      InkWell(
                          onTap: (){
                            controller.goodRate();
                          },
                          child:  Text('59'.tr,style: const TextStyle(color:Colors.blue,fontSize:16,fontWeight: FontWeight.w900))),
                    ],),
                  const SizedBox(height: 8,),
                  const Divider(thickness: 1,height: 1,color: Colors.black38,),
                  const SizedBox(height: 7,),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child:
                    controller.statusRequest==StatusRequest.loading?
                        const Center(child: CircularProgressIndicator()):
                    Center(
                      child: InkWell(
                        onTap: ()async{
                        await controller.addReview(idp: idp, context: context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width *0.50,
                          padding:const EdgeInsets.only(
                              top: 9, bottom: 9),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(30,),
                          ),
                          child:
                          Text('60'.tr,textAlign: TextAlign.center,
                            style:const TextStyle(fontSize: 19, color:Colors.white,fontWeight:FontWeight.w800),),

                        ),
                      ),
                    ),
                  ),
                ],),
            ),
          ),
        ),),);
  }
}
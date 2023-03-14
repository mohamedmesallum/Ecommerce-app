

import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/controller/controllerHome/controllerProducts/controllerProducts.dart';
import 'package:ecommercea/controller/controllerHome/controllerProducts/controllerReview.dart';
import 'package:ecommercea/core/function/HindlingDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controllerFavorites&Cart/controllerFavorites.dart';
import '../../core/url.dart';
import '../../widget/floatButton.dart';
import '../../widget/home/ContainerViewP.dart';
import '../../widget/products/addRivews.dart';
import '../../widget/products/getReview.dart';

class Viewproducts extends GetView<ControllerProducts> {
  var controllernameField = TextEditingController();
  var controllercommentField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        floatingActionButton:FloatButtonCart(),
             backgroundColor:TheColors.testColor,
        body: GetBuilder<ControllerProducts>(
            init: ControllerProducts(),
            builder: (c)=>
              Center(
                child: HindlingDataView(statusRequest: c.statusRequest!,
                    widget:GetBuilder<ControllerProducts>(
                      builder: (c)=>
                         SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        decoration:
                                  BoxDecoration(
                                  image: DecorationImage(
                              fit: BoxFit.fill,
                                  image: NetworkImage('${urlImages}/${controller.product!.data![0].image}')
                              )
                              ),
                                        width:MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height*0.45 + MediaQuery.of(context).padding.top,
                                        child:  Container(
                                         // height: MediaQuery.of(context).size.height * 0.15,
                                          child: Padding(
                                            padding: EdgeInsets.all(8+MediaQuery.of(context).padding.top),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [

                                                    const CircleAvatar(
                                                      backgroundColor:Colors.white70,
                                                      radius: 20,
                                                    ),
                                                    IconButton(onPressed:()=>Get.back(),
                                                      icon:const Icon(Icons.arrow_back_sharp,size: 30,color: Colors.black87,),)
                                                  ],
                                                ),
                                                GetBuilder<Controllerfavorites>(
                                                  init: Controllerfavorites(),
                                                  builder: (f)=>
                                                   Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                       CircleAvatar(
                                                        backgroundColor: (f.favoritesMap[controller.product!.data![0].id]==false || f.favoritesMap[controller.product!.data![0].id]==null)?TheColors.dustyRose:Colors.white,
                                                        radius: 20,
                                                      ),
                                                      IconButton(onPressed:()async{
                                                        await f. mapAddAndDeleteFov(id: controller.product!.data![0].id!);
                                                        f. addAndDeleteFavorites(idProduct: controller.product!.data![0].id!,);
                                                      },
                                                        icon:Icon((f.favoritesMap[controller.product!.data![0].id]==false || f.favoritesMap[controller.product!.data![0].id]==null)?Icons.favorite_border:Icons.favorite,size: 30,color: (f.favoritesMap[controller.product!.data![0].id]==false || f.favoritesMap[controller.product!.data![0].id]==null)?Colors.black38:Colors.pink,),)


                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  ContainerInfoPro(),
                                  const SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(right:10 ,left: 10),
                                    child: Text('52'.tr,style: Theme.of(context).textTheme.headline4,),
                                  ),
                                  const SizedBox(height: 10,),
                                  GetBuilder<ControllerReview>(
                                    init: ControllerReview(),
                                      builder: (c)=>
                                          AddRaviews(idp: controller.product!.data![0].id.toString(),)),
                                  const SizedBox(height: 20,),
                                  controller.product!.review!.isNotEmpty?
                                  Padding(
                                    padding: const EdgeInsets.only(right:10 ,left: 10,bottom: 10,),
                                    child: Text('61'.tr,style: Theme.of(context).textTheme.headline4),
                                  ): const SizedBox(height: 5,),
                                  controller.product!.review!.isNotEmpty?
                                  GetBuilder<ControllerReview>(
                                    builder: (c)=>
                                     Column(
                                       children: [
                                         GetReviews(),
                                         const SizedBox(height: 20,),
                                       ],
                                     )

                                  ):
                                 const SizedBox(),

                                ],
                              ),
                            ),

                    ),),
              )
          ),


      );

  }
}

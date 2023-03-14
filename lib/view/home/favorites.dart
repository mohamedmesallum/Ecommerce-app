
import 'package:ecommercea/controller/controllerFavorites&Cart/controllerFavorites.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color.dart';
import '../../widget/home/containerProdHome.dart';

class Favorites extends GetView<Controllerfavorites> {
MyServises s = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TheColors.dustyRose,
      body: GetBuilder<Controllerfavorites>(
        init: Controllerfavorites(),
        builder: (f)=>
            f.favoritesBool==false?
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      const Icon(Icons.favorite,size: 300,color: Colors.black38,),
                      const SizedBox(height: 8,),
                      Text("112".tr,style: TextStyle(fontFamily: 'Caveat',fontWeight: FontWeight.w900,fontSize: 22,color: Colors.black,),textAlign:TextAlign.center ,)

                    ],
                  ),
                ):
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing:10,
                    childAspectRatio:1.9/3.2,),
                  itemCount:f.dataFavorites!.data!.length,
                  itemBuilder: (ctx,i){
                    return
                      WidgetContainerPr(
                        id:f.dataFavorites!.data![i].productsId!,
                        image: '${f.dataFavorites!.data![i].image}',
                       // name:'${f.DataFavorites!.data![i].name}',
                       name:s.sharedPreferences.getString('Lang')=='en'?'${f.dataFavorites!.data![i].name}':'${f.dataFavorites!.data![i].nameAr}' ,
                        price: '${f.dataFavorites!.data![i].priec}',
                      );
                  },
                ),
              ),
            ),
      ),
    );
  }
}

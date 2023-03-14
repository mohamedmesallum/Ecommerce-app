import 'package:ecommercea/controller/controllerFavorites&Cart/controllerCart.dart';
import 'package:ecommercea/core/url.dart';
import 'package:ecommercea/widget/home/widgetPrice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../controller/controllerFavorites&Cart/controllerFavorites.dart';
import '../../core/color.dart';
import '../../controller/controllerHome/controllerProducts/controllerProducts.dart';
class WidgetContainerPr extends StatelessWidget {
  ControllerProducts sc = Get.put(ControllerProducts());
  Controllerfavorites fav = Get.find();
  ControllerCart  ca = Get.find();
final String image;
final String name;
final String price;
final int id ;
WidgetContainerPr({required this.image,required this.name,required this.price,required this.id, });



  @override
  Widget build(BuildContext context) {
    return      Builder(
      builder: (BuildContext context) {
        return  InkWell(
          onTap: ()async{
            Get.toNamed(productsView);
            await sc.getProducts(id: id);
          },
          child: Container(
          //  height:MediaQuery.of(context).size.height*0.37 ,
            decoration: BoxDecoration(
            ),
            child: LayoutBuilder(
                builder: (context,Constraints) {
                  return Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width*0.45,
                              height:Constraints.maxHeight * 0.78,
                              decoration: BoxDecoration(
                                  border: Border.all(color:TheColors.dustyRose,width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage('${urlImages}/${image}')
                                  )
                              ),
                              //  margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child:Stack(
                                alignment: Alignment.bottomRight,
                                children: [

                                  GetBuilder<ControllerCart>(
                                    init: ControllerCart(),
                                    builder: (ca)=>
                                   Stack(
                                      alignment: Alignment.center,
                                      children: [
                                         const CircleAvatar(
                                          backgroundColor:  TheColors.dustyRose,
                                          radius: 14,
                                        ),
                                        IconButton(onPressed:()async{
                                          Get.toNamed(productsView);
                                          await sc.getProducts(id: id);
                                                 },
                                          icon: const Icon(Icons.add,size: 22,color: Colors.black38,),)
                                      ],
                                    ),
                                  ),
                                ],
                              )
                          ),
                          GetBuilder<Controllerfavorites>(
                            init: Controllerfavorites(),
                            builder: (f)=>
                            Stack(
                              alignment: Alignment.center,
                              children: [
                              CircleAvatar(
                                  backgroundColor: (f.favoritesMap[id]==false || f.favoritesMap[id]==null)?TheColors.dustyRose:Colors.white,
                                  radius: 16,
                                ),
                                IconButton(onPressed: ()async{
                                  await f. mapAddAndDeleteFov(id: id);
                                  f. addAndDeleteFavorites(idProduct: id,);
                                },
                                  icon:Icon((f.favoritesMap[id]==false || f.favoritesMap[id]==null)?Icons.favorite_border:Icons.favorite,size: 24,color: (f.favoritesMap[id]==false || f.favoritesMap[id]==null)?Colors.black38:Colors.pink,),)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:Constraints.maxHeight * 0.01,),
                      Container(
                        height: Constraints.maxHeight * 0.20,
                        child: Column(
                          children: [
                            Text(name,style: Theme.of(context).textTheme.headline2,),
                            const SizedBox(height:3,),
                            WidgetPrice(price: '${price}',)
                          ],
                        ),)

                    ],
                  );
                }
            ),
          ),
        );
      },
    );
  }
}


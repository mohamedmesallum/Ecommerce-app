
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/controller/controllerHome/homeController.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:ecommercea/core/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../controller/controllerHome/controllerCategories.dart';
import '../../widget/listColors.dart';
import '../../widget/textField.dart';
import '../../widget/widgetSearch.dart';

class Search extends StatelessWidget{
  MyServises s= Get.find();
  ControllerOneCategories g = Get.put(ControllerOneCategories());
ControllerHome H= Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TheColors.dustyRose,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              Container(
                // color: Colors.blue,
                  width: double.infinity,
                  child: GridView.builder(

                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing:15,
                        crossAxisSpacing:15,
                        childAspectRatio:1.5/1.4,),
                      itemCount: H.modelHome!.categories!.length,

                      itemBuilder: (ctx,i) {
                        return InkWell(
                          onTap: (){
    Get.toNamed(pageCategories, arguments: {
    'name':H.modelHome!.categories![i].name,
    'id':H.modelHome!.categories![i].id,
    'name_ar':H.modelHome!.categories![i].nameAr
    });
   g.argoument();


                          },
                          child: Column(
                            children: [
                              Container(

                                decoration: BoxDecoration(

                                    image: DecorationImage(
                                        image: NetworkImage('${urlImages}/${H.modelHome!.categories![i].image}',),fit: BoxFit.fill),
                                    // color: Colors.blue,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                width:250,
                                height: 100,
                                child: GridTile(
                                  child: Opacity(
                                    opacity: 0.3,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:  ColorsCat[i],
                                          borderRadius: BorderRadius.circular(30)
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(s.sharedPreferences.getString('Lang')=='en'?'${H.modelHome!.categories![i].name}':'${H.modelHome!.categories![i].nameAr}',style:Theme.of(context).textTheme.headline4,),
                              ),


                            ],
                          ),
                        );
                      }
                  )
              ),
            ],
          ),
        ),
      ),

    );
  }
}
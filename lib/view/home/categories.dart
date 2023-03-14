
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/core/function/HindlingDataView.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controllerHome/controllerCategories.dart';
import '../../widget/home/containerProdHome.dart';
import '../../widget/home/iconCartAppBar.dart';
import '../../widget/widgetSearch.dart';


class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
ControllerOneCategories c = Get.find();
MyServises s =Get.find();
@override
  void initState() {

     c.getOneCategories(id: c.id!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:TheColors.dustyRose ,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TheColors.dustyRose,
        foregroundColor: Colors.black,
        title: Text(s.sharedPreferences.getString('Lang')=='en'?'${c.name}':'${c.nameAr}',style:Theme.of(context).textTheme.headline4,),
      //
        actions: [
          Center(child: IconButton(icon: const Icon(Icons.search_rounded,size: 33,),onPressed: (){
              showSearch(context: context, delegate: Searshelegate(Datalist: c.products!.data!,nameCategories:s.sharedPreferences.getString('Lang')=='en'?'${c.name}':'${c.nameAr}'));
            },),
          ),
          IconCartAppBar()
        ],
      ),
      body:

        GetBuilder<ControllerOneCategories>(
          init: ControllerOneCategories(),
          builder: (c)=>
              HindlingDataView(statusRequest: c.statusRequest!,
                widget: GetBuilder<ControllerOneCategories>(
                  builder: (c)=>
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
                            itemCount:c.products!.data!.length,
                            itemBuilder: (ctx,i){
                              return
                                WidgetContainerPr(
                                  id:c.products!.data![i].id!,
                                  image: '${c.products!.data![i].image}',
                                 // name:'${c.prodectes!.data![i].name}',
                                  name: s.sharedPreferences.getString('Lang')=='en'?'${c.products!.data![i].name}':'${c.products!.data![i].nameAr}',

                                  price: '${c.products!.data![i].priec}',
                                );
                            },
                          ),
                        ),
                      ),

                ),),
        )


    );
  }
}

import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/controller/controllerHome/controllerProducts/controllerProducts.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ routes/namepages.dart';
import '../controller/controllerHome/controllerCategories.dart';
import '../model/oneCategories.dart' as pro;

class Searshelegate extends SearchDelegate{
 final List<pro.Data> Datalist;
 final String nameCategories;

  Searshelegate({required this.Datalist,required this.nameCategories});
  ControllerOneCategories g = Get.put(ControllerOneCategories());
  ControllerProducts P = Get.find();
  MyServises s = Get.find();

  @override
  String? get searchFieldLabel => '${'95'.tr} ${nameCategories}';

@override
  void showSuggestions(BuildContext context) {
    // TODO: implement showSuggestions
    super.showSuggestions(context);
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return
[
    IconButton(onPressed: (){
      query='';
    }, icon: Icon(Icons.close)),
];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
IconButton(onPressed: (){
  close(context, null);
},icon: Icon(Icons.arrow_back),);

  }

  @override
  Widget buildResults(BuildContext context) {
 return null!;
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List filterList =s.sharedPreferences.getString('Lang')=='en'?Datalist.where((element) => element.name!.startsWith(query)).toList():
    Datalist.where((element) => element.nameAr!.startsWith(query)).toList();
return  Scaffold(
  backgroundColor: TheColors.dustyRose,
  body: ListView.separated(
      separatorBuilder: (context,i)=>const SizedBox(height: 8,),
      itemCount:
query==''?
Datalist.length:filterList.length,
    itemBuilder:(context,i){
        return
GetBuilder<ControllerOneCategories>(
    init: ControllerOneCategories(),
    builder: (H){
      return InkWell(
        onTap: ()async{
          Get.toNamed(productsView);
          await P.getProducts(id:Datalist[i].id!);
        },
        child: Padding(padding: EdgeInsets.all(8),child:
        query==''?
        Text(s.sharedPreferences.getString('Lang')=='en'?'${Datalist[i].name}':'${Datalist[i].nameAr}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),)
            :
        Text(s.sharedPreferences.getString('Lang')=='en'?'${filterList[i].name}':'${filterList[i].nameAr}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),)
        ),
      );
    });

        } , )
);
  }

}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/controller/controllerFavorites&Cart/controllerCart.dart';
import 'package:ecommercea/controller/controllerHome/homeController.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../ routes/namepages.dart';
import '../../controller/controllerFavorites&Cart/controllerFavorites.dart';
import '../../controller/controllerHome/controllerCategories.dart';
import '../../core/function/HindlingDataView.dart';
import '../../widget/home/containerProdHome.dart';
import '../../widget/home/name&SeeAll.dart';
import '../../widget/home/sliderContainrI.dart';
import '../../widget/home/widgetCategroyContrinar.dart';

class Home extends StatelessWidget {

  ControllerOneCategories g = Get.put(ControllerOneCategories());
  Controllerfavorites fav = Get.find();
  ControllerCart ca = Get.find();
  MyServises s = Get.find();
  PageController controlerPage = PageController();


List<String> images=[
  'images/pink.jpg',
  'images/pink.jpg',
  'images/prodectes.jpg',
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: TheColors.dustyRose,

      body:
            GetBuilder<ControllerHome>(
              init: ControllerHome(),
              builder: (c)=>
             HindlingDataView(statusRequest:c.statusRequest!,
                  widget:GetBuilder<ControllerHome>(
                    builder: (c)=>
                 SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
          Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Center(child: Text('46'.tr,style: TextStyle(fontFamily: 'Caveat',fontWeight: FontWeight.w900,fontSize:s.sharedPreferences.getString('Lang')=='en'?50:33,color:Colors.black),)),
                      const SizedBox(height: 20,),
                      SizedBox(
                      height:MediaQuery.of(context).size.height * 0.07,
                        child: ListView.separated(
                          separatorBuilder:(context,i)=> SizedBox(width: 15,),
                          itemCount:c.modelHome!.categories!.length,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,i){
                            return   ContrainerListViewCatg(
                              name:s.sharedPreferences.getString('Lang')=='en'?'${c.modelHome!.categories![i].name}':'${c.modelHome!.categories![i].nameAr}',
                              onTap: ()async{
                              Get.toNamed(pageCategories, arguments: {
                              'name':c.modelHome!.categories![i].name,
                              'id':c.modelHome!.categories![i].getId(),
                                'name_ar':c.modelHome!.categories![i].nameAr
                              });
                             g.argoument();
                             print('ssssssssssssssssssss');

                              },);
                          },
                        ) ,
                      ),
                      const SizedBox(height: 10,),
                      Column(
                        children: [
                           CarouselSlider(

                              options: CarouselOptions(

                                onPageChanged:(index, CarouselPageChangedReason){
                                   c.vSlieder(index: index);
                                } ,
                                  aspectRatio:10 /5,

                                  autoPlayInterval:const Duration(seconds: 3),
                                  enlargeCenterPage:true,
                                  autoPlay:false,

                            //   height: MediaQuery.of(context).size.height * 0.22,
                              ),


                              items:c.modelHome!.categories!.map((i,) {
                                return SliderContainer(
                                  image:'${i.image}',
                                  favorite: (){

                                  },onDoubleTap: (){

                                  },);

                              }).toList(),
                            ),
                          const SizedBox(height: 10,),
                          AnimatedSmoothIndicator(
effect: const SlideEffect(
  dotWidth: 10,
  dotHeight: 10,
  spacing: 5,
  radius: 15,
  activeDotColor: Colors.black,
),
                                  curve:Curves.easeInOut,

                            activeIndex: c.sliderIndex,

                            count: c.modelHome!.categories!.length,
                          )

                        ],
                      ),

                      WidhetNameAndSeeAll(
                        name:'47'.tr ,
                        OnTapSeeAll: (){
                        },
                      ),
                      const SizedBox(height: 8),

                      Container(
                     height: MediaQuery.of(context).size.height*0.42,
                        color: TheColors.dustyRose,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context,i)=> SizedBox( width: MediaQuery.of(context).size.width*0.03,),
                          itemCount: c.modelHome!.latestfashions!.length,
                          itemBuilder:(context,i){
                            return
                              GetBuilder<ControllerCart>(
                                init: ControllerCart(),
                                builder: (cr)=>
                               WidgetContainerPr(
                                  id: c.modelHome!.latestfashions![i].id!,
                                  image: '${c.modelHome!.latestfashions![i].image}',
                                 name: s.sharedPreferences.getString('Lang')=='en'?'${c.modelHome!.latestfashions![i].name}':'${c.modelHome!.latestfashions![i].nameAr}',
                                  price:'${c.modelHome!.latestfashions![i].priec}',
                                ),
                              );
                          },
                        ),
                      ),
                      const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8),
                        child: Divider(height: 2,thickness: 1,color: Colors.black12,),
                      ),
                      WidhetNameAndSeeAll(
                        name:'49'.tr ,
                        OnTapSeeAll: (){},
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: MediaQuery.of(context).size.height*0.42,
                        color: TheColors.dustyRose,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),

                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context,i)=> SizedBox( width: MediaQuery.of(context).size.width*0.03,),
                          itemCount: c.modelHome!.discount!.length,
                          itemBuilder:(context,i){
                            return
                              WidgetContainerPr(
                                id:  c.modelHome!.discount![i].id!,
                                image: '${c.modelHome!.discount![i].image}',
                              name:s.sharedPreferences.getString('Lang')=='en'?'${c.modelHome!.discount![i].name}':'${c.modelHome!.discount![i].nameAr}' ,
                                //  name:'${c.ModelHome!.discount![i].name}',
                                price: '${c.modelHome!.discount![i].priec}',
                              );
                          },
                        ),
                      ),

                      const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8),
                        child: Divider(height: 2,thickness: 1,color: Colors.black12,),
                      ),

                      WidhetNameAndSeeAll(
                        name:'50'.tr ,
                        OnTapSeeAll: (){},
                      ),

                      const SizedBox(height: 8),
                      SizedBox(
                          width: double.infinity,
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing:10,
                              childAspectRatio:1.9/3.2,),
                            itemCount:c.modelHome!.newprodectes!.length,
                            itemBuilder: (ctx,i){
                              return
                                WidgetContainerPr(
                                  id:c.modelHome!.newprodectes![i].id!,
                                  image:'${c.modelHome!.newprodectes![i].image}',
                                 name:s.sharedPreferences.getString('Lang')=='en'?'${c.modelHome!.newprodectes![i].name}':'${c.modelHome!.newprodectes![i].nameAr}' ,
                                  price: '${c.modelHome!.newprodectes![i].priec}',
                                );
                            },
                          )
                      ),
                    ],
                ),
              ),
          ),
                  )

        ),
            ),


    );
  }
}
Widget buildIndicator({required int silerderindex})=>AnimatedSmoothIndicator(
    activeIndex:silerderindex , count: 7);

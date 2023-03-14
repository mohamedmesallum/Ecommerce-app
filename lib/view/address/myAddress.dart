
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/controller/controllerHome/controllerAddress.dart';
import 'package:ecommercea/core/myclass/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../controller/controllerFavorites&Cart/controllerCart.dart';
import '../../controller/controllerGoogelMap/controllergeolocator.dart';
import '../../controller/controllerHome/controllerStitcAddress.dart';
import '../../widget/bottom.dart';
import '../../widget/coustmAppBarBack.dart';
import '../../widget/home/buttomsmol.dart';
import '../../widget/home/widgetAddress.dart';
import '../../widget/widgetDilogacation.dart';

class MyAddress extends StatelessWidget {
  ControllerGeolocator g = Get.find();
  ControllerStaticAd ads = Get.put(ControllerStaticAd());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TheColors.dustyRose,

      appBar:coustmAppBarBack(titel: '69'.tr,context: context),
      body: GetBuilder<Controlleraddres>(
    init: Controlleraddres(),
        builder: (ad)=>
            ad.addressBool==false?
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.home,size: 300,color: Colors.black38,),
                  const SizedBox(height: 8,),
                  const Text("You did not add any address  !",style: TextStyle(fontFamily: 'Caveat',fontWeight: FontWeight.w800,fontSize: 22,color: Colors.black,),textAlign:TextAlign.center ,)
                 ,const SizedBox(height: 8,),
                 GetBuilder<ControllerGeolocator>(
                   init: ControllerGeolocator(),
                     builder: (g){
                     return
                       g.statusRequest==StatusRequest.loading?
                           const Center(child: CircularProgressIndicator(),):
                       InkWell(
                         onTap: (){
                           g.geolocatoServess(context);
                         },
                         child:  Text("70".tr,style: TextStyle(fontFamily: 'Caveat',fontWeight: FontWeight.w800,fontSize: 22,color: Colors.black,decoration:TextDecoration.underline,),textAlign:TextAlign.center ,));
                     })

                ],
              ),
            ):SingleChildScrollView(
              child: Container(
               padding: const EdgeInsets.all(20),

                child: Column(
                  children: [
                    ListView.separated(
                      separatorBuilder: (context,i)=>SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: ad.address!.data!.length,
                          itemBuilder: (context,i){
                            return GetBuilder<Controlleraddres>(
                              init: Controlleraddres(),
                                builder: (ad)=>
                               ContainerAddes(listData:ad.address!.data! ,index: i,
                               widget:   DropdownButton(items: ['90'.tr,'89'.tr].map((e) => DropdownMenuItem(child: Text('${e}',style:
                               const TextStyle(fontSize: 17,fontWeight: FontWeight.w900,color: Colors.black)
                                 ,),value:e ,)).toList(),underline:Divider(thickness: 0,color: Colors.grey[100],),
                                 onChanged:(val){
                                   if(val=='89'.tr){
                                     // ad.DeleteAddress(id_address: '${listData[index].adsressId}', context: context);
                                     Dilogeacaion(context: context,titel: '91'.tr,ontap:()async{
                                       await  ad.deleteAddress(idAddress: '${ad.address!.data![i].adsressId}', context:context);
                                       Get.back();
                                     }, );
                                   }else{
                                     Get.toNamed(pageShowAndUpAddres,arguments:{
                                       'iduser':ad.address!.data![i].userId,
                                       'idaddress':ad.address!.data![i].adsressId,
                                       'name':ad.address!.data![i].nameAddress,
                                       'phone':ad.address!.data![i].phoneAddress,
                                       'Details':ad.address!.data![i].addressDetails,
                                       'longitude':ad.address!.data![i].longitude,
                                       'latitude':ad.address!.data![i].latitude,
                                     });
                                     ads.arguments();
                                   }
                                 },icon: Icon(Icons.more_vert),elevation: 0,),
                               ));

                          }),
   SizedBox(height:MediaQuery.of(context).size.height*0.03 ,),
                  GetBuilder<ControllerGeolocator>(
                    init: ControllerGeolocator(),
                      builder:(g){
                      return
                        g.statusRequest==StatusRequest.loading?
                            const Center(child: CircularProgressIndicator(),):
                        ButtomSmal(titel: '71'.tr,onTap:()async{
                        await  g.geolocatoServess(context);
                      },);
                      } )

                  ],
                ),
              ),
              ),
            ),

    );
  }
}


import 'package:ecommercea/controller/controllerOrder/controllerOrder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../core/color.dart';
import '../../controller/controllerGoogelMap/controllergeolocator.dart';
import '../../controller/controllerHome/controllerAddress.dart';
import '../../core/myclass/statusRequest.dart';
import '../../core/myclass/textThem/textThem.dart';
import '../../widget/bottom.dart';
import '../../widget/coustmAppBarBack.dart';
import '../../widget/home/buttomsmol.dart';
import '../../widget/home/widgetAddress.dart';

class SelectAddress extends StatelessWidget {
  ControllerGeolocator g = Get.find();
  ControllerOrder co = Get.find();
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
          child:Padding(padding: EdgeInsets.all(9),child: Container(
           // height: MediaQuery.of(context).size.height*0.80,
            child:   Column(
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
                                  widget: GetBuilder<ControllerOrder>(
                                    init: ControllerOrder(),
                                    builder: (co){
                                      return
                                        Radio(value: ad.address!.data![i].adsressId, groupValue: co.idAddress, onChanged: (dynamic val){
                                          co.selectIdAddress(val);
                                        });
                                    },
                                  )
                              ));

                    }),
                SizedBox(height:MediaQuery.of(context).size.height*0.03 ,),
                GetBuilder<ControllerGeolocator>(
                    init: ControllerGeolocator(),
                    builder:(g){
                      return
                        g.statusRequest==StatusRequest.loading?
                        const Center(child: CircularProgressIndicator(),):
                            TextButton.icon(icon: Icon(Icons.add,size: 24,color: Colors.black,),onPressed: ()async{
                              await  g.geolocatoServess(context);
                            }, label: Text( '71'.tr,
                                textAlign: TextAlign.center,

                                style: TextStyle(fontSize:Theme.of(context).textTheme==themeDataEng? 20:17, color: Colors.black,fontFamily:'Caveat',fontWeight: FontWeight.w900),
                            ) );

                    } ),
                SizedBox(height:MediaQuery.of(context).size.height*0.03,),
              GetBuilder<ControllerOrder>(
                  init: ControllerOrder(),
                  builder: (co){
                return
                  co.statusRequest==StatusRequest.loading?Center(child: CircularProgressIndicator(),):
                  Padding(padding: EdgeInsets.symmetric(vertical: 5,),child:    Container(

                  width: MediaQuery.of(context).size.width*0.60,
                  child:   CustombButton('40'.tr, () {
                    co.getPagerSuccess(context);
                  }, Colors.black38,Colors.white,
                  ),),);
              })

              ],
            ),

          ),)
        ),
      ),

    );
  }
}

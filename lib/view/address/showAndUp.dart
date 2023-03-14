
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/controller/controllerHome/controllerStitcAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/controllerHome/controllerAddress.dart';
import '../../widget/coustmAppBarBack.dart';
import '../../widget/home/buttomsmol.dart';
import '../../widget/textField.dart';

class ShowAndUpAddres extends StatefulWidget {

  @override
  State<ShowAndUpAddres> createState() => _ShowAndUpAddresState();
}

class _ShowAndUpAddresState extends State<ShowAndUpAddres> {
  ControllerStaticAd ads = Get.find();
  Controlleraddres ad = Get.find();
  GoogleMapController? _controller ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TheColors.dustyRose,
      appBar: coustmAppBarBack(titel: '${'72'.tr} ${ads.nameAddress}',context: context),
      body: SingleChildScrollView(
      child:
       Column(
          children: [
            GetBuilder<ControllerStaticAd>(
              init: ControllerStaticAd(),
              builder: (ads)=>
              SizedBox(
                width:MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.50,
                child: GoogleMap(
                  mapType: MapType.normal,
                  markers: { Marker(markerId:  const MarkerId('1'),
                      infoWindow: InfoWindow(title: '${ads.nameAddress}'),
                      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), //location stor
                      position: LatLng(ads.latitude, ads.longitude),draggable: true,onDragEnd:(lat){
                                  ads.longitude=lat.longitude;
                                  ads.latitude=lat.latitude;
                                  print(ads.longitude);
                                  print(ads.latitude);

                      }),
                  },
                  initialCameraPosition:   CameraPosition(
                    //location camera postions
                    target: LatLng(ads.latitude,ads.longitude),
                    zoom: 12.4746,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller=controller;
                  },
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height *0.01,),
            Center(child: SizedBox(width: 56,child: Divider(height: MediaQuery.of(context).size.height *0.01,color: Colors.blueGrey,thickness: 2,)),),
            SizedBox(height:  MediaQuery.of(context).size.height *0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: ad.formstetAddAddress,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              LatLng latlinguser = LatLng(ads.latitude, ads.longitude);
                              _controller!.animateCamera(CameraUpdate.newLatLng(latlinguser));
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                color: Colors.white70,
                                child: Icon(Icons.location_on,size: 26,color: Colors.red[600],),
                              ),

                              const SizedBox(width: 15,),
                              Text('${'73'.tr} ${ads.nameAddress}',style: Theme.of(context).textTheme.headline3,),

                            ],
                          ),
                        ),

                        const Spacer(),
                        InkWell(
                            onTap: (){
                              Get.snackbar('','',
                                  padding:const EdgeInsets.only(bottom: 30)  ,
                                  icon:Icon(Icons.location_on,size: 35,color: Colors.red[600],) ,
                                  messageText:  Text('74'.tr,style: const TextStyle(
                                    fontSize: 19,fontWeight: FontWeight.w900,
                                  ),),

                                  snackPosition: SnackPosition.BOTTOM,duration: const Duration(seconds: 3));
                            },
                            child:Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                child: Text("75".tr,style: const TextStyle(fontFamily: 'Caveat',fontWeight: FontWeight.w800,fontSize: 20,color: Colors.black,decoration:TextDecoration.underline,),textAlign:TextAlign.center ,))
                          ,)
                      ],),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.80,
              height: MediaQuery.of(context).size.height*0.06,
              child: Field(null, namehient: '76'.tr, prefixicons: const Icon(Icons.account_balance,color: Colors.black38,size: 27,), keyboard: TextInputType.text,
                  valid: (text){
                    if(text!.isEmpty){
                      return '77'.tr;
                    }
                  }, controller:ads.controllerNameA),

            ),
            const SizedBox(height: 12,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.80,
              height: MediaQuery.of(context).size.height*0.06,
              child: Field(null, namehient: '78'.tr, prefixicons: const Icon(Icons.add_road,color: Colors.black38,size: 27,), keyboard: TextInputType.text,
                  valid: (text){
                    if(text!.isEmpty){
                      return '79'.tr;
                    }
                  }, controller:ads.controllerDetailsA)

            ),
            const SizedBox(height: 12,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.80,
              height: MediaQuery.of(context).size.height*0.06,
              child: Field(null, namehient: '27'.tr, prefixicons: const Icon(Icons.phone,color: Colors.black38,size: 27,), keyboard: TextInputType.number,
                  valid: (text){
                    if(text!.isEmpty){
                      return '27'.tr;
                    }
                    if(text.length<11){
                      return '28'.tr;
                    }else {
                      return null ;
                    }
                  }, controller:ads.controllerPhoneA),

            ),
            const SizedBox(height: 12,),
            ButtomSmal(titel: '80'.tr,onTap: ()async{
              await ad.updateAddress(data: {
                'iduser':ad.c.user.data!.id.toString(),
                'name':ads.controllerNameA.text,
                'details':ads.controllerDetailsA.text,
                'phone':ads.controllerPhoneA.text,
                'latitude':'${ads.latitude}',
                'longitude':'${ads.longitude}',
                'idaddress':'${ads.addressId}'
              }, context: context);

            },)



          ],
        ),

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../ routes/namepages.dart';
import '../../core/color.dart';
import '../../controller/controllerGoogelMap/controllergeolocator.dart';
import '../../controller/controllerGoogelMap/listMarker.dart';
import '../../widget/coustmAppBarBack.dart';
import '../../widget/home/buttomsmol.dart';
class AddAddressGMap extends StatefulWidget {
  @override
  State<AddAddressGMap> createState() => _AddAddressGMapState();
}
class _AddAddressGMapState extends State<AddAddressGMap> {
 GoogleMapController? _controller ;
 var controllerfield = TextEditingController();

  ControllerGeolocator g = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:TheColors.dustyRose,
      appBar: coustmAppBarBack(titel:'81'.tr,context: context),
   body:  LayoutBuilder(
     builder: (context,BoxConstraints){
       return Column(
              children: [
                SizedBox(
                  //MediaQuery.of(context).size.height *0.55,
                  height:BoxConstraints.maxHeight*0.65,
                  width: double.infinity,
                  child: GoogleMap(
                    markers: mymarkers,
                    mapType: MapType.normal,
                    initialCameraPosition:   CameraPosition(
                      //location camera postions
                      target: LatLng(g.userLatitude, g.userLongitude),
                      zoom: 12.4746,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                     _controller=controller;
                    },
                  ),
                ),
              SizedBox(height: BoxConstraints.maxHeight *0.01,),
                Center(child: SizedBox(width: 56,child: Divider(height: MediaQuery.of(context).size.height *0.01,color: Colors.blueGrey,thickness: 2,)),),
                SizedBox(height: BoxConstraints.maxHeight *0.01,),
//    List<Placemark> placemarks = await placemarkFromCoordinates(26.155536, 32.726188);

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10),
  child:   Container(
    height:BoxConstraints.maxHeight *0.30,
    width: MediaQuery.of(context).size.width,
    color: TheColors.dustyRose,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      InkWell(
        onTap: (){
          setState(() {
            LatLng latlinguser = LatLng(26.155536, 32.726188 );
            _controller!.animateCamera(CameraUpdate.newLatLng(latlinguser));
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Container(
               height: 35,
                width: 35,
                color: Colors.white70,
                child: Icon(Icons.location_on,size: 26,color: Colors.purpleAccent[200],),
              ),

            const SizedBox(width: 15,),
            Text('82'.tr,style:Theme.of(context).textTheme.headline3,)
        ],),
      ),
      const SizedBox(height: 15,),
       Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  LatLng latlinguser = LatLng(g.userLatitude, g.userLongitude);
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
                   Text('83'.tr,style:Theme.of(context).textTheme.headline3),

                ],
              ),
            ),

            Spacer(),
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
                child:  Padding(padding: EdgeInsets.symmetric(horizontal: 3),child: Text("75".tr,style: const TextStyle(fontFamily: 'Caveat',fontWeight: FontWeight.w800,fontSize: 20,color: Colors.black,decoration:TextDecoration.underline,),textAlign:TextAlign.center ,))
              ,)
          ],),
    const SizedBox(height: 15,),
      SizedBox(
                child:Text('84'.tr,
       style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 16,color: Colors.black38),),),
      const Expanded(child: SizedBox()),
      ButtomSmal(titel: '85'.tr,onTap: (){
Get.toNamed(pageAddDetailsAddress);
      },)
    ],
  ),),
),
              ],
            );
     }
   ),

    );
  }
}

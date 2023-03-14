import 'package:ecommercea/controller/controllerGoogelMap/listMarker.dart';
import 'package:ecommercea/core/myclass/statusRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../ routes/namepages.dart';
import '../../widget/bottom.dart';
import '../../widget/widgetDilogacation.dart';


abstract class CGeolocator extends GetxController{
  geolocatoServess (BuildContext context);
  getPermission();
  getPosition();
  functionRequestPermission();
}
class ControllerGeolocator extends CGeolocator {
  StatusRequest? statusRequest;
  late bool servises;
  late LocationPermission locationPermission;
  late Position position;
  late double userLatitude;
  late double userLongitude;
double? choiceUserLatitude;
  double? choiceUserLongitude;

 bool userPosition = false;

  @override
  geolocatoServess(BuildContext context) async {
    statusRequest=StatusRequest.loading;
    update();
    servises = await Geolocator.isLocationServiceEnabled();
    print(servises);
    if (servises == false) {
      statusRequest=StatusRequest.success;
      update();
      return
        WidgtDialog(nameImage:'images/logo.jpg',
        context: context,
        Textbody: 'Please activate the location service to add the address and enjoy the services',
        Texttitel: 'Activate the location service ' ,
        widget:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                height: MediaQuery.of(context).size.height*0.07,
               width: MediaQuery.of(context).size.width*0.30,
                child: CustombButton('Ok',()async{
                  Navigator.of(context).pop();
                 // controller.Nextpage();

                },Colors.black38,Colors.white70),
              ),
            ],
          ),
        ),) ;
    } else{
      update();
  return await getPermission();
    }
     }

  @override
  getPermission() async {
    print(' Getpermission 2222222222222222222222222222222222');
    locationPermission = await Geolocator.checkPermission();
    print(locationPermission);
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      update();
      statusRequest=StatusRequest.success;
      update();
      return await functionRequestPermission();
    } else if (locationPermission == LocationPermission.always ||
        locationPermission == LocationPermission.whileInUse){
return getPosition();
    }
  }

  @override
  Future getPosition() async {
    print('Getposition 333333333333333333333333333333333333333333333333333');
    position = await Geolocator.getCurrentPosition();

    userLatitude=position.latitude;
    userLongitude=position.longitude;
    update();
    mymarkers.add( Marker(markerId:MarkerId('2',),position: LatLng(g.userLatitude, g.userLongitude),
      infoWindow: InfoWindow(title: 'My Location'),draggable: true,onDragEnd:(Lat)async{
          userLatitude=Lat.latitude;
          userLongitude=Lat.longitude;
print('تم اختيار موقع اخر  ');
print(userLatitude);
print(userLatitude);
update();
        }),
    );
    userPosition =true;
    print(' userlatitude ========================${userLatitude}');
    print(' userlongitude ========================${userLongitude}');
    if(userPosition != false){
      statusRequest=StatusRequest.success;
      Get.toNamed(pageAddAddressMaps);
    }
    statusRequest=StatusRequest.success;
    print('userpositon ========================== ${userPosition}');
    update();
  }


  @override
  Future functionRequestPermission()async {
    print('Functionrequestpermission 444444444444444444444444444444444');
  locationPermission= await Geolocator.requestPermission();
     if(locationPermission==LocationPermission.always ||
         locationPermission == LocationPermission.whileInUse){
       update();
      return getPosition();
     }else {
       update();
       print('userpositon ========================== ${userPosition}');
       return  userPosition;
     }

  }

@override
  void onClose() {
    mymarkers.remove(mymarkers.remove(Marker(markerId:MarkerId('2'))));
    print('lllllllllllllllllllllllllllllllllllllllllllllllenth on close');
    print(mymarkers.length);
    super.onClose();
  }

}

//  AwesomeDialog(context: context,title:'Please turn on location services' ,padding: EdgeInsets.all(10),
      //    titleTextStyle:const TextStyle(fontSize: 18,color: Colors.black87,fontWeight: FontWeight.w900))..show();
import 'package:ecommercea/controller/controllerGoogelMap/controllergeolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
ControllerGeolocator g = Get.find();

Set<Marker> mymarkers= {

   Marker(markerId:  const MarkerId('1'),
      infoWindow: const InfoWindow(title: 'Fashions stor'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
      //location stor
      position: LatLng(26.155536, 32.726188)),

};
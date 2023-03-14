import 'package:ecommercea/core/function/methodGPUD.dart';
import 'package:get/get.dart';

import '../../controller/controllerFavorites&Cart/controllerCart.dart';
import '../../controller/controllerFirebase/login.dart';
import '../../controller/controllerGoogelMap/controllergeolocator.dart';
import '../../controller/controllerHome/controllerAddress.dart';
import '../../controller/controllerHome/homeController.dart';
import '../../controller/login/controllerLogin.dart';

class BidingControllerLogin implements Bindings{
  @override
  void dependencies() {
    Get.put(ControllerLoginFirebase());
   Get.put(ControllerLogin(),permanent: true);
    Get.put(Method());
  }

}
class BidingControllerHome implements Bindings{

  @override
  void dependencies() {
    Get.put(Method());
    Get.put(ControllerHome());
  }

}

class BidingControlleraddres implements Bindings{
  @override
  void dependencies() {
    Get.put(ControllerGeolocator());
    Get.put(Controlleraddres());

  }

}
class BidingControllerChat implements Bindings{
  @override
  void dependencies() {
    Get.put(ControllerCart());


  }

}
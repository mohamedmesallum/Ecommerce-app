

import '../myclass/statusRequest.dart';

handlingData(resbons){
  if(resbons is StatusRequest){
    return resbons;
  }else{
    return StatusRequest.success;
  }

}
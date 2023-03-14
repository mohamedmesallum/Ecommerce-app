
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../serviese/servises.dart';

class Middleware extends GetMiddleware{
  MyServises  s =  Get.find();
  @override
  RouteSettings? Seting (String? route){
    if(s.sharedPreferences.getString('tokan')!=null){
      return const RouteSettings(name:homeBottomBar);
    }
  }
}
class MiddlewareLang extends GetMiddleware{
  MyServises  s =  Get.find();
  @override
  RouteSettings? Seting (String? route){
    if(s.sharedPreferences.getString('Lang')!=null){
      return const RouteSettings(name:screen1);
    }
  }
}
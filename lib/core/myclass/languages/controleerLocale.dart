import 'package:ecommercea/core/serviese/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ routes/namepages.dart';
import '../textThem/textThem.dart';

class ControllerLocal extends GetxController{
  MyServises myServises = Get.find();
  Locale? languages;
  ThemeData abbThem = themeDataEng ;

  chooseLanguages({required String CodeLocale,required Function() than }){
Locale locale = Locale(CodeLocale);
myServises.sharedPreferences.setString('Lang', CodeLocale);
abbThem = CodeLocale == 'en'?themeDataEng:themeDataAr;
Get.changeTheme(abbThem);
Get.updateLocale(locale).then((value) => than());
    print(CodeLocale);
update();

  }
@override
  void onInit() {
  String? sharedPrefLang = myServises.sharedPreferences.getString('Lang');
  if(sharedPrefLang=='ar'){
    languages=const Locale('ar');
    abbThem = themeDataAr;
  }else if(sharedPrefLang=='en'){
    languages=const Locale('en');
    abbThem = themeDataEng;
  }else{
    languages = Locale(Get.deviceLocale!.languageCode);
  }

    super.onInit();
  }
}
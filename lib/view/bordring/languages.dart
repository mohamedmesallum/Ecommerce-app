
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/core/myclass/languages/controleerLocale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../widget/bottom.dart';
import '../../widget/screenLanguagesWidget.dart';

class Languages extends GetView<ControllerLocal> {

  @override
  Widget build(BuildContext context) {
    return WidgetLanguages(onTapAr:(){ controller.chooseLanguages(CodeLocale:'ar',than:()=>Get.toNamed(screen1) );}
      ,onTapEn: (){controller.chooseLanguages(CodeLocale:'en',than:()=>Get.toNamed(screen1));},);
  }
}

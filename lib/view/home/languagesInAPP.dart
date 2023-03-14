
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/myclass/languages/controleerLocale.dart';
import '../../widget/screenLanguagesWidget.dart';

class LanguagesInApp extends GetView<ControllerLocal> {

  @override
  Widget build(BuildContext context) {
    return WidgetLanguages(onTapAr:(){ controller.chooseLanguages(CodeLocale:'ar',than:()=>Get.back() );}
      ,onTapEn: (){controller.chooseLanguages(CodeLocale:'en',than:()=>Get.back());},);
  }
}

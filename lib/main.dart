import 'package:ecommercea/%20routes/namepages.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import ' routes/pages.dart';
import 'core/myclass/languages/controleerLocale.dart';
import 'core/myclass/languages/locale.dart';
import 'core/serviese/servises.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
await initServises();

  runApp(MyApp());
}

Future initServises()async{
  await Get.putAsync(() => MyServises().initsharedpref(),permanent: true);
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   ControllerLocal c =  Get.put(ControllerLocal());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyLocale(),
      locale: c.languages,
      title: 'Flutter Demo',
      theme:c.abbThem,
      getPages: routes,
    );
  }
}

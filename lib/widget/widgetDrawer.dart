
import 'package:ecommercea/controller/controllerOrder/controllerOrder.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ routes/namepages.dart';
import '../core/myclass/languages/controleerLocale.dart';
import 'listtielDrawer.dart';

class DrawerWidget extends StatelessWidget {

 DrawerWidget({Key? key}) : super(key: key);
 ControllerOrder co = Get.find();
  MyServises s = Get.find();
  ControllerLocal l = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: ListTileTheme(
          textColor: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 170.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('images/logo.jpg')
                    )
                ),
                ),
              const SizedBox(height: 20,),
              ListTielDrawer(onTap:()async{
                await co.getOrders().then((value) => Get.toNamed(pageMyOrders));
              } ,icons:Icons.shop_sharp ,titel:'64'.tr, context: context ),
              const SizedBox(height: 5,),
              ListTielDrawer(onTap:(){
                Get.toNamed(pageMessages);
              },icons:Icons.mark_email_unread_sharp ,titel:'65'.tr,context: context),
              const SizedBox(height: 5,),
              ListTielDrawer(onTap:(){
              //  l.Chooselanguages('ar');
              } ,icons:Icons.add_alert ,titel:'66'.tr,context: context ),
              const SizedBox(height: 5,),
              ListTielDrawer(onTap:(){
             Get.toNamed(pageLanguagesInApp);
              } ,icons:Icons.language ,titel:'67'.tr,context: context ),
              const SizedBox(height: 7,),
              ListTielDrawer(onTap:(){
                Get.back();
                s.sharedPreferences.remove('tokan').then((value) => Get.offAllNamed(screen1));
              } ,icons:Icons.logout ,titel:'68'.tr,context: context ),
              const SizedBox(height: 7,),

              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white38,
                    fontWeight: FontWeight.w900
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: const Text('Fashionable Shopping without limits',style: TextStyle(color: Colors.black38,fontFamily: 'Caveat',fontWeight: FontWeight.w800,fontSize: 22),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

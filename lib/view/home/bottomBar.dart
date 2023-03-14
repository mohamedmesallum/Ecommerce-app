
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:ecommercea/view/home/home.dart';
import 'package:ecommercea/view/home/profile.dart';
import 'package:ecommercea/view/home/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

import '../../controller/controllerHome/homeController.dart';
import '../../widget/home/iconCartAppBar.dart';
import '../../widget/widgetDrawer.dart';
import 'cart.dart';
import 'favorites.dart';



class BottomBar  extends StatelessWidget {
  List<Widget> WidgetBar= [
    Home(),
    Search(),
    Cart(),
    Favorites(),
    MyProfile(),

  ];
  final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
  MyServises s = Get.find();
  ControllerHome H= Get.find();

  @override
  Widget build(BuildContext context) {

return
AdvancedDrawer(
backdropColor: Colors.white,
controller: _advancedDrawerController,
animationCurve: Curves.easeInOut,
animationDuration: const Duration(milliseconds: 300),
animateChildDecoration: true,
rtlOpening: false,
// openScale: 1.0,
disabledGestures: false,
childDecoration: const BoxDecoration(
// NOTICE: Uncomment if you want to add shadow behind the page.
// Keep in mind that it may cause animation jerks.
// boxShadow: <BoxShadow>[
//   BoxShadow(
//     color: Colors.black12,
//     blurRadius: 0.0,
//   ),
// ],
borderRadius: const BorderRadius.all(Radius.circular(16)),
),
drawer:DrawerWidget(),
child: GetBuilder<ControllerHome>(
init: ControllerHome(),
builder: (H){
return Scaffold(appBar: AppBar(
centerTitle: true,
title: Text('Fashions',style: TextStyle(fontFamily: 'Caveat',fontWeight: FontWeight.w800,fontSize: 33,color:Colors.black),),
backgroundColor:TheColors.dustyRose,
elevation: 0,

foregroundColor: Colors.black,
leading:  IconButton(
onPressed: _handleMenuButtonPressed,
icon: ValueListenableBuilder<AdvancedDrawerValue>(
valueListenable: _advancedDrawerController,
builder: (_, value, __) {
return AnimatedSwitcher(
duration: Duration(milliseconds: 250),

child: Icon(
value.visible ? Icons.clear : Icons.clear_all,  size: 30,
key: ValueKey<bool>(value.visible),
),
);
},
),
),
actions: [

IconCartAppBar()
],
),
bottomNavigationBar:
ConvexAppBar(

backgroundColor:TheColors.dustyRose,
activeColor:Colors.black54,
curveSize:75,
color:Colors.grey,
style: TabStyle.react,
elevation:2 ,
height: 50,
items:  [
TabItem(icon: Icons.home, title: '41'.tr,),
TabItem(icon: Icons.apps, title: '42'.tr,),
TabItem(icon: Icons.shopping_cart, title: '43'.tr,),
TabItem(icon: Icons.favorite, title: '44'.tr,),
TabItem(icon: Icons.person, title: '45'.tr,),
],
initialActiveIndex:H.selectIndexBottomBar,

//initialActiveIndex: 0,//optional, default as 0
onTap: (index) {
H.selectBottomBar(index: index);
},
),

body: WidgetBar.elementAt(H.selectIndexBottomBar),



);
}
)

);

}
  }


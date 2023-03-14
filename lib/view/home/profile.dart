
import 'dart:io';

import 'package:ecommercea/controller/controllerOrder/controllerOrder.dart';
import 'package:ecommercea/controller/login/controllerLogin.dart';
import 'package:ecommercea/core/serviese/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../ routes/namepages.dart';
import '../../core/color.dart';
import '../../core/url.dart';
import '../../widget/listtielDrawer.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
ControllerLogin c = Get.find();
ControllerOrder co = Get.find();
MyServises s =  Get.find();
File? _file;
var _imagePicker= ImagePicker();
Future addImages()async {
  var imagePath = await _imagePicker.pickImage(
      source: ImageSource.gallery, maxWidth: 250, imageQuality: 50);
  if (imagePath != null) {
    setState(() {
      _file = File(imagePath.path);
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TheColors.dustyRose,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                   GetBuilder<ControllerLogin>(
                       builder: (c){
                     return  Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [

                         c.user.data!.image!.isEmpty?
                         Container(
                           height: MediaQuery.of(context).size.height*0.15,
                           width: MediaQuery.of(context).size.width*0.40,
                           decoration: BoxDecoration(
                             color: Colors.white70,
                             borderRadius: BorderRadius.circular(10),
                           ),
                           child:  _file==null? Icon(Icons.perm_identity,size: 75,color: Colors.black38,):Image.file(_file!,fit: BoxFit.fill,),
                         ):      Container(
                           height: MediaQuery.of(context).size.height*0.15,
                           width: MediaQuery.of(context).size.width*0.40,
                           decoration: BoxDecoration(
                             color: Colors.white70,
                             borderRadius: BorderRadius.circular(10),
                           ),
                           child:  _file==null? Image.network('${urlImageUser}/${c.user.data!.image}',fit: BoxFit.fill,):Image.file(_file!,fit: BoxFit.fill,),
                         ),





                         Row(children: [
                           IconButton(onPressed: ()async{
                             await addImages();
                           }, icon: Icon(Icons.camera_alt_outlined,size: 27,color: Colors.black26,)),
                           InkWell(
                             onTap: (){
                               if(_file!=null){
                               c.addImageUser(file: _file!, context: context);
                               }else{
                                 print('image null');
                                 return ;
                               }
                             },
                             child: Container(
                               width: 60,
                               alignment: Alignment.center,
                               decoration: BoxDecoration(
                                   color: Colors.black26,
                                   borderRadius: BorderRadius.circular(10)
                               ),
                               margin: EdgeInsets.all(5),

                               child: Text('111'.tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white70,fontFamily: 'Caveat'),),
                             ),
                           )
                         ],)

                       ],
                     );
                   }),
             const SizedBox(width: 10,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${c.user.data!.username}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900,color: Colors.black,),)
                      ,Text('${c.user.data!.email}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900,color: Colors.black54,),)
                      ,Text('${c.user.data!.phone}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900,color: Colors.black54,),)

                    ],
                  ),

                const Spacer(),
                InkWell(
                  onTap: ()async{

                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black54
                      ),
                      Icon(Icons.rate_review,size: 23,color: Colors.white,)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            ListTielDrawer(onTap:()async{
            await co.getOrders().then((value) => Get.toNamed(pageMyOrders));
            } ,icons:Icons.shop_sharp ,titel:'64'.tr, context: context ),
            const SizedBox(height: 5,),
            ListTielDrawer(onTap:(){
              Get.toNamed(pageMessages);
            } ,icons:Icons.mark_email_unread_sharp ,titel:'65'.tr,context: context ),
            const SizedBox(height: 5,),
            ListTielDrawer(onTap:(){
              Get.toNamed(pageAddress);
            } ,icons:Icons.home ,titel:'69'.tr,context: context ),
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
          ],
        ),
      )

    );
  }
}

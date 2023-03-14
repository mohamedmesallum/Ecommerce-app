
import 'package:ecommercea/controller/login/controllerSignIn.dart';
import 'package:ecommercea/core/color.dart';
import 'package:ecommercea/controller/login/controllerLogin.dart';
import 'package:ecommercea/core/myclass/statusRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../widget/bottom.dart';
import '../../widget/login/abbBarLogin.dart';
import '../../widget/textField.dart';

class SignIn extends StatelessWidget {

var controllerEmail = TextEditingController();
ControllerSignIn c = Get.put(ControllerSignIn());


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: TheColors.dustyRose,
      appBar:widgetAppBarLogin(titel: '6'.tr,context: context),
      body: SingleChildScrollView(
        child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       CircleAvatar(
                         backgroundColor: Colors.black,
                         radius: MediaQuery.of(context).size.height  * 0.09,
                         backgroundImage: const AssetImage('images/logo.jpg') ,),
                   SizedBox(
                     height: MediaQuery.of(context).size.height*0.18,
                     child:Padding(padding: const EdgeInsets.symmetric(horizontal:0),child:
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       // mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('7'.tr,style: Theme.of(context).textTheme.headline6,),
                         Text('8'.tr,style: Theme.of(context).textTheme.headline6,textAlign:TextAlign.center ,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text('9'.tr,style: Theme.of(context).textTheme.headline6,),

                             Text('10'.tr,style: Theme.of(context).textTheme.headline6,),
                           ],
                         ),
                       ],
                     ),
                     ),
                   ),
                        SizedBox(
                              width: MediaQuery.of(context).size.width *0.95,
                          // height: MediaQuery.of(context).size.height * 0.50,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child:Form(
                                  key:c.formSignIn ,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Field(null, namehient: '12'.tr, prefixicons: const Icon(Icons.email,color: Colors.black38,),
                                            keyboard: TextInputType.emailAddress,
                                            valid: (text){
                                              if(text!.isEmpty){
                                                return '19'.tr;
                                              }
                                              if(!text.contains('@gmail.com')){
                                                return '20'.tr;
                                              }else {
                                                return null;
                                              }
                                            }, controller:c.controllerEmail ),
                                        SizedBox(height: MediaQuery.of(context).size.height  * 0.01),
                                        Field(null, namehient: '13'.tr, prefixicons: const Icon(Icons.visibility,color: Colors.black38,),
                                            keyboard: TextInputType.emailAddress,
                                            valid: (text){
                                              if(text!.isEmpty){
                                                return '17'.tr;
                                              }
                                              if(text.length<5){
                                                return '18'.tr;
                                              }else return null;

                                            }, controller:c.controllerPassword ),
                                        SizedBox(height: MediaQuery.of(context).size.height  * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                                onTap: (){
                                                  Get.toNamed(sendEmail);
                                                },
                                                child: Text('11'.tr,style: Theme.of(context).textTheme.headline3,)),
                                          ],
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height  * 0.02),
                                        GetBuilder<ControllerSignIn>(
                                          init: ControllerSignIn(),
                                          builder: (c)=>
                                          c.statusRequest==StatusRequest.loading?const CircularProgressIndicator(color: Colors.blue,):
                                           SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.70 ,
                                              child:CustombButton('14'.tr, (){
                                                c.signIn(context);
                                              }, Colors.black38, Colors.white,) ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height  * 0.02),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            CircleAvatar(radius: 18,backgroundImage: AssetImage('images/face.jpg',),),
                                            SizedBox(width: 6,),
                                            CircleAvatar(radius: 18,backgroundImage: AssetImage('images/googel.png'),),
                                            SizedBox(width: 6,),
                                            CircleAvatar(radius: 18,backgroundImage: AssetImage('images/appel.jpg'),),
                                          ],
                                        ),
                                       SizedBox(height: MediaQuery.of(context).size.height  * 0.03),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('15'.tr,style: Theme.of(context).textTheme.headline6),
                                            InkWell(
                                                onTap: (){
                                                  Get.toNamed(sign_Up);
                                                },
                                                child:  Text('16'.tr,style:Theme.of(context).textTheme.bodyText1,)),
                                          ],),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      ],
                    )
      ),
    );
  }
}

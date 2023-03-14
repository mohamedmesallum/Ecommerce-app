
import 'package:ecommercea/%20routes/namepages.dart';
import 'package:ecommercea/controller/login/controllerSignUp.dart';
import 'package:ecommercea/core/myclass/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color.dart';
import '../../controller/login/controllerLogin.dart';

import '../../widget/bottom.dart';
import '../../widget/login/abbBarLogin.dart';
import '../../widget/textField.dart';

class SignUp extends StatelessWidget {
  ControllerSignUp c = Get.put(ControllerSignUp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TheColors.dustyRose,
      appBar:widgetAppBarLogin(titel:'21'.tr ,context: context),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(radius: MediaQuery.of(context).size.height  * 0.09,backgroundImage: AssetImage('images/logo.jpg') ,),
                SizedBox(height:MediaQuery.of(context).size.height  * 0.01),
                SizedBox(
                  // height: Constraints.maxHeight * 0.20,
                  height: MediaQuery.of(context).size.height  * 0.05,
                  width: MediaQuery.of(context).size.height  *0.90,
                  child:
                      Center(child: Text('22'.tr,style: Theme.of(context).textTheme.headline6,)),


                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *0.95,
                 // height: MediaQuery.of(context).size.height * 0.50,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child:Form(
                      key:c.formSignUp,
                      child: Column(
                        children: [
                          Field(null, namehient: '23'.tr, prefixicons: Icon(Icons.person,color: Colors.black38,),
                              keyboard: TextInputType.name,
                              valid: (text){
                                if(text!.isEmpty){
                                  return '24'.tr;
                                }
                                if(text.length>10){
                                  return '25'.tr;
                                }else return null;
                              }, controller:c.controllerName ),
                          SizedBox(height: MediaQuery.of(context).size.height  * 0.01),
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
                          Field(null, namehient: '26'.tr, prefixicons: Icon(Icons.phone,color: Colors.black38,),
                              keyboard: TextInputType.number,
                              valid: (text){
                                if(text!.isEmpty){
                                  return '27'.tr;
                                }
                                if(text.length<11){
                                  return '28'.tr;
                                }else {
                                  return null ;
                                }
                              }, controller:c.controllerPhone ),
                          SizedBox(height: MediaQuery.of(context).size.height  * 0.01),
                          Field(null, namehient: '13'.tr, prefixicons: const Icon(Icons.visibility,color: Colors.black38,),
                              keyboard: TextInputType.visiblePassword,
                              valid: (text){
                                if(text!.isEmpty){
                                  return '17'.tr;
                                }
                                if(text.length<5){
                                  return '18'.tr;
                                }else {
                                  return null;
                                }
                              }, controller:c.controllerPassword ),


                          SizedBox(height: MediaQuery.of(context).size.height  * 0.02),
                          GetBuilder<ControllerSignUp>(
                            init: ControllerSignUp(),
                            builder: (c)=>
                            c.statusRequest==StatusRequest.loading?CircularProgressIndicator(color: Colors.blueAccent,):
                            SizedBox(

                                width: MediaQuery.of(context).size.width * 0.70 ,
                                child:CustombButton('14'.tr, (){
                                  c.signUp(context);
                                }, Colors.black38, Colors.white,) ),
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height  * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('32'.tr,style: Theme.of(context).textTheme.headline6),
                              InkWell(
                                  onTap: (){
                                         Get.offNamed(sign_In);
                                  },
                                  child:  Text('6'.tr,style: Theme.of(context).textTheme.bodyText1)),
                            ],),
                        ],
                      ),
                    ),
                  ),
                ),



              ],
            ),
          )



      ),



    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../core/color.dart';
import '../../controller/controllerFirebase/login.dart';
import '../../widget/bottom.dart';
import '../../widget/login/abbBarLogin.dart';
import '../../widget/textField.dart';

class SendEmailFP extends StatelessWidget {
  var ControllerEmail = TextEditingController();
  ControllerLoginFirebase CF = Get.put(ControllerLoginFirebase());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TheColors.dustyRose,
      appBar:  widgetAppBarLogin(titel:'' ,context: context),
      body: SingleChildScrollView(
          child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(radius: MediaQuery.of(context).size.height  * 0.15,backgroundImage: AssetImage('images/logo.jpg') ,),
                SizedBox(height:MediaQuery.of(context).size.height  * 0.02),
                SizedBox(
                  // height: Constraints.maxHeight * 0.20,
                  // height: MediaQuery.of(context).size.height  * 0.15,
                  width: MediaQuery.of(context).size.height  *0.90,
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('34'.tr,style: Theme.of(context).textTheme.headline6,),
                      SizedBox(height:MediaQuery.of(context).size.height  * 0.04),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Field(null,
                            controller:ControllerEmail ,
                            namehient: '12'.tr,
                            prefixicons: const Icon(Icons.email,color: Colors.black38,),
                            keyboard: TextInputType.emailAddress,
                            valid: (text){
                              if(text!.isEmpty){
                                return '19'.tr;
                                //!text.contains('.com')
                              }if(text.isEmpty){
                                return '20'.tr;
                              }else {
                                return null ;
                              }

                            }),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height  * 0.10),
                      SizedBox(

                          width: MediaQuery.of(context).size.width * 0.70 ,
                          child:CustombButton('35'.tr, ()async{
                         // await CF.verifyPhone(context: context, phone: ControllerEmail.text);
                            Get.toNamed(verifyForPass);
                          }, Colors.black38, Colors.white,) ),
                    ],
                  ),


                ),])
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../core/color.dart';
import '../../controller/controllerFirebase/login.dart';
import '../../widget/bottom.dart';
import '../../widget/login/abbBarLogin.dart';

class ForgetPasVerify extends StatelessWidget {
  ControllerLoginFirebase CF = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TheColors.dustyRose,
      appBar: widgetAppBarLogin(titel: '',context: context,),
      body: SingleChildScrollView(
          child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(radius: MediaQuery.of(context).size.height  * 0.11,backgroundImage: AssetImage('images/logo.jpg') ,),
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
                      Text('36'.tr,style: Theme.of(context).textTheme.headline6,),
                      SizedBox(height:MediaQuery.of(context).size.height  * 0.01),
                      Text('37'.tr,style: Theme.of(context).textTheme.headline6,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text('Mesaluum@gmail.com',style: TextStyle(fontSize: 20,color: Colors.black38,fontWeight: FontWeight.w800),),
                          const SizedBox(width: 7,),
                          TextButton(onPressed: (){

                          }, child:  Text('38'.tr,style: Theme.of(context).textTheme.bodyText1,))

                        ],
                      ),

                      SizedBox(height:MediaQuery.of(context).size.height  * 0.02),
                      OTPTextField(

                        outlineBorderRadius:10,
                        length: 4,
                        width: MediaQuery.of(context).size.width *0.85,
                        fieldWidth: 60,
                        contentPadding:EdgeInsets.symmetric(horizontal: 15,vertical:15),
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 25
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.box,
                        onCompleted: (pin) async{
                         // await CF.SentCode(code: pin);
                          print("Completed:  + $pin");
                          print("Completed: " + pin);
                        },onChanged: (text){
                        print('$text ===========================');
                      },
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height  * 0.03),
                      Text('39'.tr,style: Theme.of(context).textTheme.headline6),
                      const SizedBox(height: 5,),
                      const Text('45 S',style: TextStyle(fontSize: 25,color: Colors.blueAccent,fontFamily: 'Caveat')),
                      SizedBox(height:MediaQuery.of(context).size.height  * 0.15),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.70 ,
                          child:CustombButton('40'.tr, (){}, Colors.black38, Colors.white,) ),
                    ],
                  ),


                ),])
      ),
    );
  }
}
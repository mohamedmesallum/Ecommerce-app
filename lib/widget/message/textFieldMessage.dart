
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercea/controller/login/controllerLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controllerFirebase/controllerChat.dart';


class TextFildMassage extends StatelessWidget {
  ControllerChat chat = Get.put(ControllerChat());
  ControllerLogin s = Get.find();
  String valtest ='';

 // SetMassage()async{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child:
    Container(
    alignment: Alignment.center,
     height: 65,
    //  width: 100,
      padding: const EdgeInsets.only(left: 10,bottom: 0,right: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12,width: 2),
          color: Colors.white70,

          borderRadius: BorderRadius.circular(30)
      ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 7),child: TextField(

          onChanged: (value){
            if(value!=null){
              chat.up();
            }
          },
          key: Key('s'),
          controller: chat.TextMessage,

          maxLines:2 ,

          keyboardType:TextInputType.text,
          style:const TextStyle(

            fontSize: 20,color: Colors.black,fontWeight: FontWeight.w800,
          ),

          decoration: InputDecoration(

              enabledBorder:InputBorder.none,
              disabledBorder:InputBorder.none,
              // errorBorder:InputBorder.none,
              focusedBorder:InputBorder.none,
              //  prefixIcon:prefixicons,
              //Icon(,size:28,color: Colors.black38,),

              // suffixIcon:suffixIcons,
              hintText:'94'.tr,
              hintStyle:TextStyle(fontFamily: 'Caveat',color: Colors.black54,fontSize: 19,fontWeight: FontWeight.w900,)

          )

      ),)
    ),
       ),
        GetBuilder<ControllerChat>(
          init: ControllerChat(),
          builder: (c)=>
          IconButton(
              onPressed:
                  (){
              c.TextMessage.text.trim().isEmpty?null:c.setMessage();
              },
              icon:
              c.TextMessage.text.trim().isEmpty?
              Icon(Icons.send,color: Colors.black38,):
              Icon(Icons.send,color: Colors.pink),
          ),
        )


      ],
    );
  }
}

// TextField(
//           keyboardType: TextInputType.text,
//           style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,),
//           controller: widget.chat.TextMessage,
//           decoration: InputDecoration(
//               contentPadding:EdgeInsets.only(left: 8,top: 5,bottom:5),
//               hintText:'Send a Massage' ,
//               hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.w900,)
//           ),
//           onChanged: (val){
//             setState(() {
//               valtest = val;
//             });
//           },
//         )
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercea/controller/controllerFirebase/controllerChat.dart';
import 'package:ecommercea/controller/login/controllerLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color.dart';
import '../../widget/coustmAppBarBack.dart';
import '../../widget/message/textFieldMessage.dart';
import '../../widget/message/widgetMessage.dart';

class Messages extends StatefulWidget {


  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  ControllerChat chat = Get.put(ControllerChat());
  ControllerLogin s = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TheColors.dustyRose,
      appBar: coustmAppBarBack(titel: 'Fashions Message',context: context),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 6,left: 3,right: 3),
        child: Column(
          children: [
            IconButton(onPressed: ()async{
              await chat.SetMassageeeeTest();
            }, icon: Icon(Icons.add)),
            Expanded(
              child: StreamBuilder(
                stream:  FirebaseFirestore.instance.collection('Chat/${s.userCredentialID!.user!.uid}/massage').orderBy('time',descending: true).snapshots() ,
                builder:(ctx,SnapShot){

                  if(SnapShot.hasData) {
                    var data = (SnapShot.data! as QuerySnapshot).docs;
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      // padding: EdgeInsets.all(8),
                        reverse: true,
                        itemCount: (SnapShot.data! as QuerySnapshot).docs.length,
                        itemBuilder:(ctx,i){
                          return

                            Container(
                                width: MediaQuery.of(context).size.width*0.80,
                                child: WidgetMassage('${data[i]['massage']}',data[i]['email']==s.userCredentialID!.user!.email));
                        });
                  }else{
                    return Text('');
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFildMassage(),
            )

          ],
        ),
      ),
    );
  }
}

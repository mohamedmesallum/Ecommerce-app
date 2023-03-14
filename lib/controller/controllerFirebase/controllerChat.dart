import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../login/controllerLogin.dart';

abstract class ChatController extends GetxController{
  setDataChat();
  setMessage();
}
class ControllerChat extends ChatController{
  var TextMessage = TextEditingController();
  ControllerLogin C = Get.find();
bool iconsent = false;
up(){
  update();
}


  @override
  setDataChat()async {
    try{
      var sessst=await FirebaseFirestore.instance.collection('HomeChat').doc('${C.userCredentialID!.user!.uid}');
      sessst.set({
        'id':'${C.userCredentialID!.user!.uid}',
        'email':'${C.userCredentialID!.user!.email}',
        'name':'${C.user.data!.username}',
        'time':Timestamp.now(),
      });
      print('sent test chattttttttttttttttt trrrrrrrrue');
      update();
    }catch(e){
      print('eroeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr test chat');
      print(e.toString());
    }
  }

  @override
  setMessage() async{
    try{
      await setDataChat().then((value) {
        var sessst=  FirebaseFirestore.instance.collection('Chat/${C.userCredentialID!.user!.uid}/massage');
        sessst.add({
          'massage':TextMessage.text,
          'time':Timestamp.now(),
          'email':'${C.userCredentialID!.user!.email}'
        });
        TextMessage.clear();
      });

      print('sent massage  trrrrrrrrue');

    }catch(e){
      print('eroeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr sent massage');
      print(e.toString());
    }
  }
  Future  SetMassageeeeTest()async{
    try{
      var sessst=await FirebaseFirestore.instance.collection('Chat/${C.userCredentialID!.user!.uid}/massage');
      sessst.add({
        'massage':'Hi',
        'time':Timestamp.now(),
        'email':'test1@gmail.com'
      });
      print('sent massage  trrrrrrrrue');
      update();
    }catch(e){
      print('eroeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr sent massage');
      print(e.toString());
    }
  }

}
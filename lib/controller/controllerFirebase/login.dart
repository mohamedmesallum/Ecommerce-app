import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../widget/erorrDailog.dart';

abstract class ControllerFirebase extends GetxController{
  signInFirebase({required String email , required String password});
  signUpFirebase({required String email , required String password});
  verifyPhone({required BuildContext context,required String phone });
  sentCode({required String code });
}
class ControllerLoginFirebase extends ControllerFirebase{
  UserCredential? userCredentialID;
  late String idVerification;

  @override
  signInFirebase({required String email, required String password}) async{
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      update();
      return userCredential;
  }
  @override
  Future signUpFirebase({required String email , required String password})async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      update();
      return userCredential;

    }catch(e){
      print(e.toString());
      update();
    }
    update();
  }




  @override
  verifyPhone({required BuildContext context,required String phone })async{
  await  FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
        verificationCompleted: (verificationCompleted){},//تعمل غ الاندويرد فقط
        verificationFailed: (FirebaseAuthException e){
          DialogErorr(context: context,titel:e.toString(),dialogType:DialogType.INFO);
         update();
        },// ايرورر
        codeSent: (String verificationId,int? forceResendingToken)async{
        verificationId=verificationId;
        update();
        if(verificationId!=null){
          Get.toNamed(verifyForPass);
        }else{
          print('verificationId ==========================mull');
        }
update();

  },
        timeout:const Duration(seconds: 120) ,
        codeAutoRetrievalTimeout: (i){
        print('${i} codeAutoRetrievalTimeout codeAutoRetrievalTimeout codeAutoRetrievalTimeout codeAutoRetrievalTimeout ');
        }
    );
  }
  @override
  sentCode({required String code })async{
    FirebaseAuth auth = FirebaseAuth.instance;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: idVerification, smsCode: code);
  userCredentialID= await auth.signInWithCredential(credential);

  if(userCredentialID!.user!.uid != null){
    print(userCredentialID!.user!.uid);
    Get.toNamed(homeBottomBar);
  }
  print('تم تسجيل الدخول بنجاح ssssssssssssssssssssssssssssssssssss' );


  }

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

abstract class ControllerFireStor extends GetxController{
  setDataUsrt({required String name , required String id,required String email});
}
class ControllerFStore extends ControllerFireStor{
  @override
  setDataUsrt({required String name , required String id,required String email}) async{
    try{
      var setData= await FirebaseFirestore.instance.collection('User').doc(id);
      setData.set({
        'name':name,
        'id':id,
        'email':email,
      });
    }catch(e){
      print(e.toString());
    }
  }

}
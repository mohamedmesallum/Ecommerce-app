
import 'package:flutter/material.dart';

import '../myclass/statusRequest.dart';



class HindlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  HindlingDataView({required this.statusRequest ,required this.widget});

  @override
  Widget build(BuildContext context) {
    return
      statusRequest==StatusRequest.loading?
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const  Center(child:CircularProgressIndicator(color: Colors.blueAccent,),),
          ],
        ),
      ) :
      statusRequest==StatusRequest.serverFailure?
      Center(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const[
          Icon(Icons.error,size: 70,color: Colors.red,),
            Text('Server Connection Failed',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),),
        ],
      ),):
      statusRequest==StatusRequest.internetFailure?
      Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children:const [
         Icon(Icons.wifi_off_rounded,size:70,color: Colors.blueGrey,),
           Text('There is no internet connection !',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.blueAccent),),
        ],
      ),):
      statusRequest==StatusRequest.offLienFailure?
      const  Center(child:    Text('Data not available ?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),)):
      statusRequest==StatusRequest.failure?
      const Center(child: Text('Something went wrong, please try again !',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),)):
      widget;


  }
}
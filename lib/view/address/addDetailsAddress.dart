
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color.dart';
import '../../controller/controllerHome/controllerAddress.dart';
import '../../core/myclass/statusRequest.dart';
import '../../widget/coustmAppBarBack.dart';
import '../../widget/home/buttomsmol.dart';
import '../../widget/textField.dart';

class AddDetailsAddress extends StatelessWidget {
  Controlleraddres  ad = Get.find();
var controllerinput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TheColors.dustyRose,
      appBar:  coustmAppBarBack(titel: '87'.tr,context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: ad.formstetAddAddress,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text('86'.tr,style: Theme.of(context).textTheme.headline4,),
                const SizedBox(height: 8,),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.06,
                  child: Field(null, namehient: '76'.tr, prefixicons: const Icon(Icons.account_balance,color: Colors.black38,size: 27,), keyboard: TextInputType.text,
                      valid: (text){
                        if(text!.isEmpty){
                          return '77'.tr;
                        }
                      }, controller:ad.controllerName),
                ),
                SizedBox(height: MediaQuery.of(context).size.height  * 0.03),
                Text('87'.tr,style:Theme.of(context).textTheme.headline4,),
                const SizedBox(height: 8,),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.06,
                  child: Field(null, namehient: '78'.tr, prefixicons: const Icon(Icons.add_road,color: Colors.black38,size: 27,), keyboard: TextInputType.text,
                      valid: (text){
                        if(text!.isEmpty){
                          return '79'.tr;
                        }
                      }, controller:ad.controllerDetails),
                ),
                SizedBox(height: MediaQuery.of(context).size.height  * 0.03),
                 Text('26'.tr,style: Theme.of(context).textTheme.headline3),
                const SizedBox(height: 8,),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.06,
                  child: Field(null, namehient: '27'.tr, prefixicons: const Icon(Icons.phone,color: Colors.black38,size: 27,), keyboard: TextInputType.number,
                      valid: (text){
                        if(text!.isEmpty){
                          return '27'.tr;
                        }
                        if(text.length<11){
                          return '28'.tr;
                        }else return null ;
                      }, controller:ad.controllerPhone),
                ),
                SizedBox(height: MediaQuery.of(context).size.height  * 0.06),
                GetBuilder<Controlleraddres>(
                  init: Controlleraddres(),
                  builder: (ad)=>
                  ad.statusRequest==StatusRequest.loading?Center(child: CircularProgressIndicator()):
                   Center(
                    child: ButtomSmal(titel: '88'.tr,onTap: ()async{
                         await ad.addAddress();
                    },),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

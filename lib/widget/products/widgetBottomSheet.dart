
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controllerFavorites&Cart/controllerCart.dart';
import '../../controller/controllerHome/controllerProducts/controllerProducts.dart';
import '../../core/function/HindlingDataView.dart';
import '../../core/url.dart';

class ViewBottomSheet extends StatefulWidget {
  const ViewBottomSheet({Key? key}) : super(key: key);

  @override
  State<ViewBottomSheet> createState() => _ViewBottomSheetState();
}

class _ViewBottomSheetState extends State<ViewBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerProducts>(
      init: ControllerProducts(),
      builder: (p)=>
      Center(
        child: HindlingDataView(statusRequest: p.statusRequest!,widget:
          Container(
            height: MediaQuery.of(context).size.height*0.40,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.white, blurRadius: 3, spreadRadius: 0)
              ],
              borderRadius:BorderRadius.only(topRight: Radius.circular(35),topLeft: Radius.circular(35)),
            ),
            child:  LayoutBuilder(
                builder: (context,BoxConstraints)=>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage('${urlImages}/${p.product!.data![0].image}')
                                    ),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
                                  ),
                                  height:BoxConstraints.maxHeight*0.75 ,
                                  width:BoxConstraints.maxWidth*0.30 ,

                                ),
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                                  ),
                                  height:BoxConstraints.maxHeight*0.25 ,
                                  width:BoxConstraints.maxWidth*0.30,
                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(child: Text('${p.product!.data![0].name}',maxLines:2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: 'Caveat',fontWeight: FontWeight.w900,fontSize: 18,color: Colors.black),)),

                                    ],
                                  )
                                  ,

                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.topRight,

                              children: [
                                Icon(Icons.clear,color: Colors.black38,),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),

                                    ),

                                    height:BoxConstraints.maxHeight ,
                                    width:BoxConstraints.maxWidth*0.65  ,
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text(' Select Colors',style: TextStyle(fontFamily: 'Caveat',fontWeight: FontWeight.w900,color: Colors.black,fontSize: 18),),
                                          SizedBox(height: 3,),

                                          SizedBox(height: 3,),

                                          //GetBuilder<ControllerSelectSiezC>(
                                              //init: ControllerSelectSiezC(),
                                              //builder: (Sc)=>
                                              //    SelectColorCart(listData: widget.listData,inedx: widget.inedx,)),
                                          SizedBox(height: 3,),
                                          Text(' Select Siez',style: TextStyle(fontFamily: 'Caveat',fontWeight: FontWeight.w900,color: Colors.black,fontSize: 18),),
                                          SizedBox(height: 3,),
                                       //   SelectSiez(listData: widget.listData,inedx: widget.inedx,),

                                          Padding(
                                            padding: const EdgeInsets.only(right:10 ,bottom: 5,left: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    const Text('\$',style: TextStyle(fontWeight: FontWeight.w700,
                                                        fontFamily: 'SignikaNegative',fontSize: 20,color: Colors.black87),),
                                                    SizedBox(width: 2,),
                                                    Text('${p.product!.data![0].priec! * p.product!.data![0].count! } ',style: const TextStyle(fontWeight: FontWeight.w800,
                                                        fontSize: 21,color:Colors.black),),

                                                  ],
                                                ),
                                                Spacer(),
                                                Container(
                                                  child: GetBuilder<ControllerCart>(
                                                    init: ControllerCart(),
                                                    builder: (ca)=>
                                                        Row(
                                                          children: [
                                                            InkWell(
                                                              onTap: (){
                                                           //     setState(() {
                                                                //                                                                   if(Staticcont>1)
                                                                //                                                                     Staticcont--;
                                                                //                                                                   widget.listData[widget.inedx].count=Staticcont;
                                                                //                                                                   ca.GetTotalCart();
                                                                //                                                                 });
                                                              },
                                                              child: Stack(
                                                                alignment: Alignment.center,
                                                                children: [
                                                                  Container(
                                                                    height: 25,
                                                                    width: 25,
                                                                    color: Colors.grey[200],
                                                                    child: Icon(Icons.remove,size: 24,),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(width: 12,),
                                                            Text('${p.product!.data![0].count!}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                                                            SizedBox(width: 12,),
                                                            InkWell(
                                                              onTap: (){
                                                           //     setState(() {
                                                                //                                                                   Staticcont++;
                                                                //                                                                   p.product!.data![0]..count=Staticcont;
                                                                //                                                                   ca.GetTotalCart();
                                                                //
                                                                //                                                                 });
                                                              },
                                                              child: Stack(
                                                                alignment: Alignment.center,
                                                                children: [
                                                                  Container(
                                                                    height: 25,
                                                                    width: 25,
                                                                    color: Colors.white70,
                                                                    child: Icon(Icons.add,size: 24,),
                                                                  )
                                                                ],
                                                              ),
                                                            ),

                                                          ],
                                                        ),
                                                  ),

                                                )
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
            ),

          )

          ,),
      ),
    );
  }
}

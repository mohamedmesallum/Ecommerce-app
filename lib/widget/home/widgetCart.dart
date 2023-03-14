import 'package:ecommercea/core/serviese/servises.dart';
import 'package:ecommercea/widget/home/color/selectColorCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ routes/namepages.dart';
import '../../controller/controllerFavorites&Cart/controllerCart.dart';
import '../../controller/controllerHome/controllerProducts/controllerProducts.dart';
import '../../core/url.dart';
import '../../model/cartmodel.dart' as Cart;
import 'size/SelectSiez.dart';

class WidgetCart extends StatefulWidget {

  final List<Cart.Data> listData;
  final int inedx;
  final String colorK;
  final String SizeK;

  WidgetCart({required this.SizeK,required this.colorK,required this.listData,required this.inedx});
  @override
  State<WidgetCart> createState() => _WidgetCartState();
}

class _WidgetCartState extends State<WidgetCart> {
  ControllerProducts cp = Get.find();
MyServises s = Get.find();
  ControllerCart ca = Get.find();
  int Staticcont = 1;
  var SIEZTest;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:InkWell(
        onTap: ()async{
          Get.toNamed(productsView);
          await cp.getProducts(id: widget.listData[widget.inedx].productsId!);

        },
        child: Container(
          height: MediaQuery.of(context).size.height*0.22,
          width: MediaQuery.of(context).size.width*0.95,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(color: Colors.white, blurRadius: 5, spreadRadius: 0)
              ],
              borderRadius: BorderRadius.circular(25)
          ),
          child:
          LayoutBuilder(
              builder: (context,BoxConstraints)=>
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage('${urlImages}/${widget.listData[widget.inedx].image}')
                                  ),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular((15))),
                                ),
                                height:BoxConstraints.maxHeight ,
                                width:BoxConstraints.maxWidth*0.35 ,

                              ),

                            ],
                          ),
                          Stack(
                            alignment:s.sharedPreferences.getString('Lang')=='en'? Alignment.topRight:Alignment.topLeft,

                            children: [

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
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(child: Text(s.sharedPreferences.getString('Lang')=='en'?'${widget.listData[widget.inedx].name}':'${widget.listData[widget.inedx].nameAr}',maxLines:2,overflow: TextOverflow.ellipsis,style:Theme.of(context).textTheme.headline2,)),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                Text('63'.tr,style:Theme.of(context).textTheme.headline2,),
                                                SizedBox(width: 6,),
                                                SelectColorCart(colorK: widget.colorK,),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text('62'.tr,style:Theme.of(context).textTheme.headline2 ,),
                                                SizedBox(width: 6,),
                                                SelectSize(SizeK:widget.SizeK ,),

                                              ],
                                            ),
                                          ],
                                        ),



                                        // SelectColorCart(listData: widget.listData,inedx: widget.inedx,)




                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Text('\$',style: TextStyle(fontWeight: FontWeight.w700,
                                                      fontFamily: 'SignikaNegative',fontSize: 18,color: Colors.black87),),
                                                  SizedBox(width: 2,),
                                                  Text('${widget.listData[widget.inedx].priec! * widget.listData[widget.inedx].count! } ',style: const TextStyle(fontWeight: FontWeight.w800,
                                                      fontSize:19,color:Colors.black),),

                                                ],
                                              ),

                                              Container(
                                                child: GetBuilder<ControllerCart>(
                                                  init: ControllerCart(),
                                                  builder: (ca)=>
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: (){
                                                              setState(() {
                                                                if(Staticcont>1)
                                                                  Staticcont--;
                                                                widget.listData[widget.inedx].count=Staticcont;
                                                                ca.GetTotalCart();

                                                              });
                                                            },
                                                            child: Stack(
                                                              alignment: Alignment.center,
                                                              children: [
                                                                Container(
                                                                  height: 20,
                                                                  width: 20,
                                                                  color: Colors.grey[200],
                                                                  child: Icon(Icons.remove,),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(width: 12,),
                                                          Text('${widget.listData[widget.inedx].count!}',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w900),),
                                                          SizedBox(width: 12,),
                                                          InkWell(
                                                            onTap: (){
                                                              setState(() {
                                                                Staticcont++;
                                                                widget.listData[widget.inedx].count=Staticcont;
                                                                ca.GetTotalCart();

                                                              });
                                                            },
                                                            child: Stack(
                                                              alignment: Alignment.center,
                                                              children: [
                                                                Container(
                                                                  height: 20,
                                                                  width: 20,
                                                                  color: Colors.white70,
                                                                  child: Icon(Icons.add,),
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
                              IconButton(onPressed: ()async{
                                await ca.mapCart(id:'${ widget.listData[widget.inedx].productsId}');
                                ca.addAndDeleteCart(idProduct:'${ widget.listData[widget.inedx].productsId}' ,
                                    selectColor: '${ widget.listData[widget.inedx].colorCart}',
                                    selectSize: '${ widget.listData[widget.inedx].sizeCart}');
                              }, icon: Icon(Icons.clear,color: Colors.black,size: 20,),),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
          ),

        ),
      )
    );
  }
}

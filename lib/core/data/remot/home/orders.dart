import 'package:ecommercea/core/function/methodGPUD.dart';
import 'package:ecommercea/core/url.dart';

class FunctionOrders{
 Method method;
 FunctionOrders({required this.method});


Future addOrders({required Map data })async{
  var resbons = await method.postData(Url: UrlAddOrders, Data: data);
  return resbons.fold((l) => l, (r) => r);
 }
 Future getOrders({required int idUser})async{
  var resbons = await method.postData(Url: UrlGetOrders, Data:{
'iduser':'${idUser}',
  } );
return resbons.fold((l) => l, (r) => r);
}






}
import 'package:ecommercea/core/url.dart';

import '../../../function/methodGPUD.dart';

class FunctionCatr{
  Method method;
  FunctionCatr(this.method);
  Future getCart ({required String id})async{
    var resbons =await method.postData(Url: UrlGetCart, Data:{
      'iduser': id,
    });
    return resbons.fold((l) => l, (r) => r);
  }
  Future addAndDeleteCart({required String idUser , required String idProduct,required String color,required String size})async{
    var resbons = await method.postData(Url: UrlAddAndDeleteCart, Data: {
      'iduser':idUser,
      'idproduct':idProduct,
      'color':color,
      'size':size,
    });
    return resbons.fold((l) => l, (r) => r);
  }
}
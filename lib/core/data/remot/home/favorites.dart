import 'package:ecommercea/core/url.dart';

import '../../../function/methodGPUD.dart';

class FunctionFavorites{
  Method method;
  FunctionFavorites(this.method);
  Future getFavorites ({required int id})async{
    var resbons =await method.postData(Url: UrlGetFav, Data:{
'iduser': '${id}',
    });
    return resbons.fold((l) => l, (r) => r);
  }
  Future addAndDeleteFov({required int idUser , required int idProduct})async{
    var resbons = await method.postData(Url: UrlAddANdDeleteFav, Data: {
'iduser':'${idUser}',
'idproduct':'${idProduct}',
    });
    return resbons.fold((l) => l, (r) => r);
  }
}
import 'package:ecommercea/core/url.dart';

import '../../../function/methodGPUD.dart';

class FunctionAddress{
  Method method;
  FunctionAddress(this.method);
  Future getAddress({required String  id})async{
    var resbons =await method.postData(Url: UrlGetAddress, Data: {
      'iduser':id,
    });
    return resbons.fold((l) => l, (r) => r);
  }
  Future addAddress({required Map Data})async{
    var resbons = await method.postData(Url: UrlAddAddress, Data:Data);
    return resbons.fold((l) => l, (r) => r);
  }
  Future deleteAddress({required Map Data})async{
    var resbons = await method.postData(Url: UrlDeleteAddress, Data: Data);
    return resbons.fold((l) => l, (r) => r);
  }
  Future updateAddress({required Map Data})async{
    var resbons = await method.postData(Url: UrlupdateAddress, Data: Data);
    return resbons.fold((l) => l, (r) => r);
  }
}
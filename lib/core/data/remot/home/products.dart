import 'package:ecommercea/core/url.dart';

import '../../../function/methodGPUD.dart';

class FunctionProducts{
  Method method;
  FunctionProducts(this.method);

  Future  getDataProducts({required int id })async{
    var resbons = await method.postData(Url: UrlGetColorAndSiez, Data: {
      'id':'${id}'
    });
    return resbons.fold((l) => l, (r) => r);
  }
  Future  addReview({required Map Data })async{
    var resbons = await method.postData(Url: UrlAddReview, Data:Data);
    return resbons.fold((l) => l, (r) => r);
  }
}
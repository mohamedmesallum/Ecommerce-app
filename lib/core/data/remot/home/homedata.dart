import 'package:ecommercea/core/url.dart';

import '../../../function/methodGPUD.dart';

class FunctionHome{
  Method method;
  FunctionHome(this.method);
Future getDataHome()async{
  var resbons = await method.GetData(Url: UrlHome);
  return resbons.fold((l) => l, (r) => r);
}
 Future  getCategories({required int id })async{
  var resbons = await method.postData(Url: UrlGetcategories, Data: {
    'id':'${id}'
  });
  return resbons.fold((l) => l, (r) => r);
 }
}
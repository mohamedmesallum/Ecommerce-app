import 'dart:io';

import 'package:ecommercea/core/url.dart';

import '../../../function/methodGPUD.dart';

class FunctionLoin{
  Method method;
  FunctionLoin(this.method);
Future signIn({required Map Data})async{
  var resbons = await method.postData(Url: UrlSignIn, Data: Data);
  return resbons.fold((l) => l, (r) => r);
}
Future signUp({required Map Data})async{
  var resbons = await method.postData(Url: UrlSignUp, Data: Data);
  return resbons.fold((l) => l, (r) => r);
}
Future addImagesUser({required File file,required Map data})async{

 var resbons = await method.postFile(Url:UrlAddImageUser, file: file,data:data);
 print(resbons);
 print('sssssssssssssssssssssss');
 return resbons.fold((l) => l, (r) => r);
}
}
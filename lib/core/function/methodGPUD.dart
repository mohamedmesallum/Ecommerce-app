import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart ' as http;
import 'package:path/path.dart';
import '../myclass/statusRequest.dart';
import 'checkInternet.dart';


class Method{
  Future<Either<StatusRequest,Map>> postData({required String Url,required Map Data})async{
try{
  if(await checkInInternet()){
    var resbons = await http.post(Uri.parse(Url),body:Data);
    if(resbons.statusCode==200 || resbons.statusCode==201 ){
      Map resbonsbody = jsonDecode(resbons.body);
      return  Right(resbonsbody);
    }else{

      return const Left(StatusRequest.serverFailure);
    }
  }else{
    print('CheckIntrnet');
    return const Left(StatusRequest.internetFailure);
  }
}catch(e){
  print(e.toString());
  return const Left(StatusRequest.offLienFailure);
}
  }


  Future<Either<StatusRequest,Map>> GetData({required String Url})async{
    try{
      if(await checkInInternet()){
        var resbons = await http.get(Uri.parse(Url));
        if(resbons.statusCode==200 || resbons.statusCode==201 ){
          Map resbonsbody = jsonDecode(resbons.body);
          return  Right(resbonsbody);
        }else{
          return const Left(StatusRequest.serverFailure);
        }
      }else{
        print('CheckIntrnet');
        return const Left(StatusRequest.internetFailure);
      }
    }catch(e){
      return const Left(StatusRequest.offLienFailure);
    }

  }


  Future<Either<StatusRequest,Map>> postFile({required String Url,required Map data,required File file})async{
    try{
      if(await checkInInternet()){
        var requst = await http.MultipartRequest('POST',Uri.parse(Url),);
        var length = await file.length();
        var strem =  http.ByteStream(file.openRead());
        var multipartR = http.MultipartFile('image',strem,length,filename:basename(file.path));
      requst.files.add(multipartR);
        data.forEach((key, value) {
          requst.fields[key] = value;
        });
          var resbons = await requst.send();
        var resbosbody = await http.Response.fromStream(resbons);
        print(resbosbody.body);
        if(resbosbody.statusCode==200 || resbosbody.statusCode==201 ){
          var resbonsMap = jsonDecode(resbosbody.body) as Map<String, dynamic>;
          return  Right(resbonsMap);
        }else{

          return const Left(StatusRequest.serverFailure);
        }
      }else{
        print('CheckIntrnet');
        return const Left(StatusRequest.internetFailure);
      }
    }catch(e){
      print('jjjjjjjjjjjjjjjjjjj');
      print(e.toString());
      return const Left(StatusRequest.offLienFailure);
    }
  }
}

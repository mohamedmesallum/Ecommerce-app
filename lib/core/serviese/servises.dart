import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyServises extends GetxService{
  late SharedPreferences sharedPreferences;
  Future<MyServises> initsharedpref () async{
    sharedPreferences =   await SharedPreferences.getInstance();
    print('${sharedPreferences.getString('Lang')}');
    return this;
  }
}

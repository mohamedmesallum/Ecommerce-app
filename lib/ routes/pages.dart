import 'package:ecommercea/%20routes/namepages.dart';
import 'package:ecommercea/view/address/myAddress.dart';
import 'package:ecommercea/view/address/selectAddres.dart';
import 'package:ecommercea/view/bordring/screenOne.dart';
import 'package:get/get.dart';

import '../core/biding/biding.dart';
import '../core/middleware/middlewareLogin.dart';
import '../view/address/addAddress.dart';
import '../view/address/addDetailsAddress.dart';
import '../view/address/showAndUp.dart';
import '../view/bordring/languages.dart';
import '../view/home/bottomBar.dart';
import '../view/home/cart.dart';
import '../view/home/categories.dart';
import '../view/home/home.dart';
import '../view/home/languagesInAPP.dart';
import '../view/home/messages.dart';
import '../view/home/viewProducts.dart';
import '../view/login/forgetPasVerfiy.dart';
import '../view/login/sendEmailFP.dart';
import '../view/login/signIn.dart';
import '../view/login/signUp.dart';
import '../view/login/verify.dart';
import '../view/orders/myOrders.dart';
import '../view/orders/orderSsuccess.dart';
import '../view/orders/viewOneOrder.dart';
List<GetPage> routes=[
  GetPage(name:  screen1, page:()=>ScreenOne(),middlewares:[Middleware(),]),
  GetPage(name: pageChoiceLang, page:()=>Languages(),middlewares: [MiddlewareLang()]),
  GetPage(name:  sign_In, page:()=>SignIn(),binding:BidingControllerLogin(),),
  GetPage(name:  sign_Up,page:()=>  SignUp()),
  GetPage(name:  verify, page:()=>VerifyCode()),
  GetPage(name: sendEmail , page:()=>SendEmailFP()),
  GetPage(name: verifyForPass , page:()=>ForgetPasVerify()),
  GetPage(name:  homePage , page:()=>Home()),
  GetPage(name:  homeBottomBar , page:()=>BottomBar(),binding:BidingControllerHome()),
  GetPage(name:  pageCategories , page:()=>Categories()),
  GetPage(name:  productsView , page:()=>Viewproducts()),
  GetPage(name:  pageAddress , page:()=>MyAddress(),binding: BidingControlleraddres()),
  GetPage(name:  pageSelectAddress , page:()=>SelectAddress(),binding: BidingControlleraddres()),
  GetPage(name:  pageAddAddressMaps , page:()=>AddAddressGMap()),
  GetPage(name:  pageAddDetailsAddress , page:()=>AddDetailsAddress()),
  GetPage(name:  pageShowAndUpAddres , page:()=>ShowAndUpAddres()),
  GetPage(name:  pageMessages , page:()=>Messages(),binding: BidingControllerChat()),
  GetPage(name:  pageSuccessOrder , page:()=>SuccessOrder(),),
  GetPage(name:  pageMyOrders , page:()=>MyOrders(),),
  GetPage(name:  pageOneOrder , page:()=>ViewOneOrder(),),
  GetPage(name:  pageLanguagesInApp , page:()=>LanguagesInApp(),),
  GetPage(name:  pageCart , page:()=>Cart(),),
];//
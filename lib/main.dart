import 'package:Queen_Beauty/test.dart';
import 'package:Queen_Beauty/views/address/view.dart';
import 'package:Queen_Beauty/views/auth/forgetpassword/forgotpassword.dart';
import 'package:Queen_Beauty/views/auth/forgetpassword/success_reseatpassword.dart';
import 'package:Queen_Beauty/views/auth/login.dart';
import 'package:Queen_Beauty/views/auth/success_signup.dart';
import 'package:Queen_Beauty/views/language.dart';
import 'package:Queen_Beauty/views/splash/spalshscreenlogin.dart';
import 'package:Queen_Beauty/views/splash/splashscreen.dart';
import 'package:Queen_Beauty/views/splash/splashscreenadmin.dart';
import 'package:Queen_Beauty/views/splash/splashscreenonboarding.dart';
import 'package:Queen_Beauty/views/users/home.dart';
import 'package:Queen_Beauty/views/users/myfavorite.dart';
import 'package:Queen_Beauty/views/users/panier.dart';
import 'package:Queen_Beauty/views/users/screenhome.dart';
import 'package:Queen_Beauty/views/users/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/intialbindings.dart';
import 'core/localisation/changelanguage.dart';
import 'core/localisation/translation.dart';
import 'core/middleware/mymiddleware.dart';
import 'services/services.dart';
import 'views/admin/adminhome.dart';
import 'views/auth/forgetpassword/reseatpassword.dart';
import 'views/auth/signup.dart';
import 'views/auth/forgetpassword/verifycode.dart';
import 'dart:io';
import 'views/users/checkout.dart';
import 'views/users/items.dart';
import 'views/users/itemsdetails.dart';

void main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
   HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
   //HttpOverrides.global = MyHttpOverrides();

  //runApp(const MyApp());
}
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    localLanguage controller = Get.put(localLanguage());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            // ignore: deprecated_member_use
            headline1: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
            // ignore: deprecated_member_use
            headline2: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            // ignore: deprecated_member_use
            bodyText1: TextStyle(fontSize: 10),
          )),
      //home: HomePage(),
      getPages: [
        //GetPage(name: '/', page: () => Test()),
        GetPage(
            name: '/',
            page: () => const SplashScreenOnBoarding(),
            middlewares: [MyMiddleWare()]),

        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/testpage', page: () => TestPage()),

        GetPage(name: '/long', page: () => Language()),
        GetPage(name: '/homepage', page: () => HomePage()),
        GetPage(name: '/mypanier', page: () => MyPanier()),

        GetPage(name: '/screen', page: () => ScreenHome()),

        GetPage(name: '/signup', page: () => SignUp()),
        GetPage(name: '/forgetpassword', page: () => ForgetPassword()),
        GetPage(name: '/verifycode', page: () => VerifyCode()),
        GetPage(name: '/reseatpassword', page: () => ReseatPassword()),
        GetPage(
            name: '/sucessreseatpassword', page: () => SucessReseatPassword()),
        GetPage(name: '/sucesssignup', page: () => SucessSignUp()),
        GetPage(name: '/items', page: () => Items()),
        GetPage(name: '/itemsdetails', page: () =>  ItemsDetails()),
        GetPage(name: '/myfavorite', page: () => MyFavorite()),
        GetPage(name: '/setting', page: () => Setting()),
        GetPage(name: '/addressview', page: () => AddressView()),
        GetPage(name: '/checkout', page: () => CheckOut()),
        GetPage(name: '/adminhome', page: () => AdminHome()),
        GetPage(name: '/adminsplachscreen', page: () => SplashScreenAdmin()),
        GetPage(name: '/splashscreen', page: () => SplashScreenUser()),
        GetPage(name: '/splashscreenlogin', page: () => SplashScreenLogin()),







      ],
      initialBinding: initialBindings(),
    );
  }
}

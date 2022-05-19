import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktik/Auth/signin_page.dart';
import 'package:tiktik/screen/KitchenAddScreen.dart';
import 'package:tiktik/screen/KitchenDetailScreen.dart';
import 'package:tiktik/screen/KitchenEditScreen.dart';
import 'package:tiktik/screen/LoginScreen.dart';
import 'package:tiktik/screen/MessagingScreen.dart';
import 'package:tiktik/screen/OrderConformationScreen.dart';
import 'package:tiktik/screen/ProductAddScreen.dart';
import 'package:tiktik/screen/ProductDetailScreen.dart';
import 'package:tiktik/screen/ProductEditScreen.dart';
import 'package:tiktik/screen/SingUpScreen.dart';
import 'package:tiktik/screen/UserProfileScreen.dart';

import 'NavigationPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>  SignInPage(),
        '/navigationPage': (context) =>  NavigationPage(),

        '/kitchenAddScreen': (context) =>  KitchenAddScreen(),
        '/kitchenEditScreen': (context) =>  KitchenEditScreen(),
        '/kitchenDetailScreen': (context) =>  KitchenDetailScreen(),

        '/messagingScreen': (context) =>  MessagingScreen(),
        '/orderConformationScreen': (context) =>  OrderConformationScreen(),

        '/productAddScreen': (context) =>  ProductAddScreen(),
        '/productDetailScreen': (context) =>  ProductDetailScreen(),
        '/productEditScreen': (context) =>  ProductEditScreen(),

        '/singUpScreen': (context) =>  SingUpScreen(),
        '/userProfileScreen': (context) =>  UserProfileScreen(),


      },
      debugShowCheckedModeBanner: false,
    );
  }
}



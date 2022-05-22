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
import 'package:tiktik/screen/greetingPage.dart';

import 'NavigationPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

/// todo USER DATA can be moved user class
//String  selectedName          = "";
String? currentUserID = "";
String? currentUserMail = "";
String? currentUserName = "";
String currentUserDescription = "";
String currentUserAddress = "";
bool hasKitchen = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400)),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => GreetingPage(),
        '/navigationPage': (context) => NavigationPage(),
        '/kitchenAddScreen': (context) => KitchenAddScreen(),
        '/kitchenEditScreen': (context) => KitchenEditScreen(),
        '/kitchenDetailScreen': (context) => KitchenDetailScreen(),
        '/messagingScreen': (context) => MessagingScreen(),
        '/orderConformationScreen': (context) => OrderConformationScreen(),
        '/productAddScreen': (context) => ProductAddScreen(),
        '/productDetailScreen': (context) => ProductDetailScreen(),
        '/productEditScreen': (context) => ProductEditScreen(),
        '/singUpScreen': (context) => SingUpScreen(),
        '/userProfileScreen': (context) => UserProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

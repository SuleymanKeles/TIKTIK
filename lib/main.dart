import 'package:flutter/material.dart';
import 'package:tiktik/screen/KitchenAddScreen.dart';
import 'package:tiktik/screen/KitchenDetailScreen.dart';
import 'package:tiktik/screen/LoginScreen.dart';
import 'package:tiktik/screen/MessagingScreen.dart';
import 'package:tiktik/screen/OrderConformationScreen.dart';
import 'package:tiktik/screen/ProductDetailScreen.dart';
import 'package:tiktik/screen/ProductScreen.dart';
import 'package:tiktik/screen/SingUpScreen.dart';
import 'package:tiktik/screen/UserProfileScreen.dart';

import 'NavigationPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/navigationPage': (context) =>  NavigationPage(),
        '/kitchenAddScreen': (context) =>  KitchenAddScreen(),
        '/kitchenDetailScreen': (context) =>  KitchenDetailScreen(),
        '/messagingScreen': (context) =>  MessagingScreen(),
        '/orderConformationScreen': (context) =>  OrderConformationScreen(),
        '/productDetailScreen': (context) =>  ProductDetailScreen(),
        '/productScreen': (context) =>  ProductScreen(),
        '/singUpScreen': (context) =>  SingUpScreen(),
        '/userProfileScreen': (context) =>  UserProfileScreen(),
      },
    );
  }
}



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tiktik/screen/KitchenAddScreen.dart';
import 'package:tiktik/screen/KitchenDetailScreen.dart';
import 'package:tiktik/screen/LoginScreen.dart';
import 'package:tiktik/screen/MessagingScreen.dart';
import 'package:tiktik/screen/OrderConformationScreen.dart';
import 'package:tiktik/screen/ProductDetailScreen.dart';
import 'package:tiktik/screen/ProductAddScreen.dart';
import 'package:tiktik/screen/SingUpScreen.dart';
import 'package:tiktik/screen/UserProfileScreen.dart';
import 'package:tiktik/style/Theme.dart';

import 'Auth/signin_page.dart';
import 'NavigationPage.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

String selectedName = "";
String? currentUserID = "";
String? currentUserMail = "";
String? currentUserName = "";
String selectedDescription = "";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemes.lightTheme,
      initialRoute: '/',
      routes: {

        '/': (context) =>  SignInPage(),
        '/navigationPage': (context) => NavigationPage(),
        '/kitchenAddScreen': (context) => KitchenAddScreen(),
        '/kitchenDetailScreen': (context) => KitchenDetailScreen(),
        '/messagingScreen': (context) => MessagingScreen(),
        '/orderConformationScreen': (context) => OrderConformationScreen(),
        '/productDetailScreen': (context) => ProductDetailScreen(),
        '/productAddScreen': (context) => ProductAddScreen(),
        '/singUpScreen': (context) => SingUpScreen(),
        '/userProfileScreen': (context) => UserProfileScreen(),
        '/sign': (context) => SignInPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

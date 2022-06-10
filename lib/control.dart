import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

int option = 0;

class Control extends StatefulWidget {


  Control({Key? key}) : super(key: key);

  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  Future checkSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('currentUserID') == null ||
        prefs.getString('currentUserID') == "") {

      developer.log("giriş yapılmamış ${prefs.getString('currentUserID')}");
      Navigator.pushNamed(context, '/singInScreen');


    } else if (true) {
      currentUserID = prefs.getString('currentUserID')!;
      currentUserMail = prefs.getString('currentUserMail')!;
      currentUserName = prefs.getString('currentUserName')!;
      developer.log("giriş yapılmış ${prefs.getString('currentUserID')}");

      Navigator.pushNamed(context, '/navigationPage');
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    developer.log("#################### start");

    checkSignIn();
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProviderUserData extends ChangeNotifier {
  User? user=null;
  ProviderUserData();
  ProviderUserData.user({required this.user});

}

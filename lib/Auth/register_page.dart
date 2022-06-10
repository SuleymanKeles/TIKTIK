/// TODO FOR firestore add firestore new user information (akif)

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktik/Auth/signin_page.dart';
import 'package:tiktik/StyleProvider.dart';

import '../main.dart';

/// Sign Up with email and password
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _success = true;
  String _message = "";

  //String selectedName="";
  //String? currentUserMail= "";
  //String currentUserID="";
  // String? currentUserMail;
  //String? currentUserName;

  @override
  Widget build(BuildContext context) {
    void _register() async {
      try {
        final UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ); // uzun süren bir işlem

        final User? currentUser = userCredential.user;

        currentUserID = currentUser!.uid;
        currentUserMail = currentUser.email;
        currentUserName = _fullNameController.text;
        userCredential.user?.updateDisplayName(currentUserName);



        print("regFunct");

        print(currentUserMail);
        print(currentUserName);
        print(_passwordController.text);
        print(currentUserID);

        //TODO verification
        if (currentUser != null) {
          //Sends auth info mail to the user
          //user.sendEmailVerification();
          // setState(() {
          // _message = "Merhaba, ${user.email}" + "\n Lütfen hesabınıza gönderilen doğrulama mailini onaylayınız";
          //});
          /// simdilik mail atma
          //if(user.emailVerified==true){
          print("user kayıt oldu ");
          setState(() {
            _success = true;
          });

          //}
        } else {
          setState(() {
            _message = "Hata oldu sanırım :(";
            _success = false;
          });
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          _message = e.message!;
          _success = false;
        });
      } catch (e) {
        print(e); //dynamic her sey olabilir
      }

      final docUser =
          FirebaseFirestore.instance.collection('users').doc(currentUserID);

      var json = {
        'date': new DateTime.now(),
        'description': '',
        'email': '',
        'image':
            'https://firebasestorage.googleapis.com/v0/b/tiktik-7f7e3.appspot.com/o/images%2Fdefault.jpg?alt=media&token=fde7c081-12d5-4781-ab9c-05226dced8a6',
        'name': '',
        'userID': '',
        'kitchenName': '',
        'kitchenImage': '',
        'kitchenAbout': '',
        'kitchenMeals': '',
        'hasKitchen': 0,

      };

      json['email'] = currentUserMail as String;
      json['userID'] = currentUserID as String;
      json['name'] = currentUserName as String;


      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('currentUserID', currentUserID.toString());
      prefs.setString('currentUserName', currentUserName.toString());
      prefs.setString('currentUserMail', currentUserMail.toString());

      await docUser.set(json);
    }

    Future createUser({required String name}) async {
      final docUser =
          FirebaseFirestore.instance.collection('users').doc(currentUserID);

      var json = {
        'date': new DateTime.now(),
        'description': '',
        'email': '',
        'image':
            'https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=20&m=1223671392&s=612x612&w=0&h=lGpj2vWAI3WUT1JeJWm1PRoHT3V15_1pdcTn2szdwQ0=',
        'name': '',
        'userID': '',
      };

      json['email'] = currentUserMail as String;
      json['userID'] = currentUserID as String;
      json['name'] = currentUserName as String;



      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('currentUserID', currentUserID.toString());
      prefs.setString('currentUserName', currentUserName.toString());
      prefs.setString('currentUserMail', currentUserMail.toString());

      await docUser.set(json);
    }

    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Name
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _fullNameController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Tam adınızı giriniz..",
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (name) {
                          if (name!.isEmpty) {
                            return "Lütfen tam adınızı giriniz";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // E-Mail
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Email..",
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (mail) {
                          if (mail!.isEmpty) {
                            return "Lütfen bir email hesabı giriniz";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "En az 6 haneli bir şifre oluşturunuz..",
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (password) {
                          if (password!.isEmpty) {
                            return "Lütfen bir şifre giriniz";
                          }
                          return null;
                        },
                        obscureText: true, //! Şifrenin görünmesini engeller.
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Şifrenizi tekrar giriniz",
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (confirmPassword) {
                          if (confirmPassword!.isEmpty) {
                            return "Lütfen bir şifre giriniz";
                          } else {
                            if (confirmPassword != _passwordController.text) {
                              return "Lütfen aynı şifreyi tekrar giriniz!";
                            }
                          }
                          return null;
                        },
                        obscureText: true, //! Şifrenin görünmesini engeller.
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    alignment: Alignment.center,
                    child: SignInButtonBuilder(
                      icon: Icons.person_add,
                      backgroundColor: mainColor,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Kayıt İşlemi
                          _register();
                          //  createUser(name: 'name');


                          sleep(const Duration(seconds:3));
                          Navigator.pushNamed(context, '/greetingPage');
                        }
                      },
                      text: "Kayıt ol",
                    ),
                  ),
                  //? Geri bildirim
                  Container(
                    alignment: Alignment.center,
                    child: Text(_success == null ? '' : _message),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Auth new user firebase auth and firestore

}

//import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:tiktik/main.dart';


/// Sign Up with email and password
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {


  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _success = true;
   String _message="";


  @override
  Widget build(BuildContext context) {

    Future createUser({required String name}) async {

      final docUser  = FirebaseFirestore.instance.collection('users').doc(currentUserID);

      var json = {
        'date': new DateTime.now(),
        'description': '',
        'email': '',
        'image': 'https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=20&m=1223671392&s=612x612&w=0&h=lGpj2vWAI3WUT1JeJWm1PRoHT3V15_1pdcTn2szdwQ0=',
        'name': '',
        'userID': '',
      };

      json['email'] = currentUserMail as String;
      json['userID'] = currentUserID as String;
      json['name'] = currentUserName as String;

      await docUser.set(json);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //? E-Mail
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
                            hintText: "E-Mail",
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: ( mail) {
                          if (mail!.isEmpty) {
                            return "Please enter an email";
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
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: ( password) {
                          if (password!.isEmpty) {
                            return "Please enter an password";
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
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: ( password) {
                          if (password!.isEmpty ) {
                            return "Please enter an password";
                          }
                          else {
                            if(password != _passwordController.text){
                            return "Please enter same passwords !";
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
                      backgroundColor: Colors.black45,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Kayıt İşlemi
                          _register();
                          createUser(name: 'name');
                        }
                      },
                      text: "Sign Up",
                    ),
                  ),
                  //? Geri bildirim
                  Container(
                    alignment: Alignment.center,
                    child: Text(_success == null ? '' : _message  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );


  }






  void _register() async {
    try {
      final UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()); // uzun süren bir işlem

      final User?  currentUser = userCredential.user;

      currentUserID = currentUser?.uid;
      currentUserMail = currentUser?.email;
      currentUserName = currentUser?.displayName;

      print(_emailController.text);
      print(_passwordController.text);

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
  }
}
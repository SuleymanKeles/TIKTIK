import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tiktik/screen/KitchenDetailScreen.dart';

import '../main.dart';



String currentImageURL = "";


class Storage {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile (
      String filePath, String fileName
      ) async {

    File file = File(filePath);



    try {
      await storage.ref('$fileName').putFile(file);
    } on firebase_storage.FirebaseException catch (e) {
      print(e);
    }



    final ref = FirebaseStorage.instance.ref().child('$fileName');
    var url = await ref.getDownloadURL();



    final docUser =
    FirebaseFirestore.instance.collection('users').doc(currentUserID);

    var json = {
      'image': '',

    };

    json['image'] = url as String;

    await docUser.update(json);



    print(url);


  }



  Future<void> uploadProductFile (
      String filePath, String fileName
      ) async {

    File file = File(filePath);



    try {
      await storage.ref('$fileName').putFile(file);
    } on firebase_storage.FirebaseException catch (e) {
      print(e);
    }



    final ref = FirebaseStorage.instance.ref().child('$fileName');
    var url = await ref.getDownloadURL();





    currentImageURL = url;



    print(url);


  }


  Future<void> uploadKitchenFile (
      String filePath, String fileName
      ) async {

    File file = File(filePath);



    try {
      await storage.ref('$fileName').putFile(file);
    } on firebase_storage.FirebaseException catch (e) {
      print(e);
    }



    final ref = FirebaseStorage.instance.ref().child('$fileName');
    var url = await ref.getDownloadURL();





    currentKitchenImage = url;



    print(url);


  }



}
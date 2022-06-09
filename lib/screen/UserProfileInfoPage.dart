import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktik/Auth/signin_page.dart';
import 'package:tiktik/StyleProvider.dart';
import 'package:tiktik/screen/HomeScreen.dart';
import 'package:tiktik/services/storage_service.dart';
import '../main.dart';
import '../profileWidget.dart';
import 'ProductDetailScreen.dart';
import 'UserProfileInfoPage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktik/main.dart';
import 'package:tiktik/screen/UserProfileScreen.dart';

import '../StyleProvider.dart';
import 'greetingPage.dart';

class UserProfileInfoPage extends StatefulWidget {
  @override
  _UserProfileInfoPage createState() => _UserProfileInfoPage();
}

class _UserProfileInfoPage extends State<UserProfileInfoPage> {
  TextEditingController displayNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final docUser =
      FirebaseFirestore.instance.collection('users').doc(currentUserID);

  bool isLoading = false;

//  User user;
  Container circularProgress() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 10.0),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.purple),
        ));
  }

  @override
  void initState() {
    super.initState();
    getUser();

    displayNameController = new TextEditingController(text: currentUserName);
    bioController = new TextEditingController(text: currentUserDescription);
    mailController = new TextEditingController(text: currentUserMail);
    addressController = new TextEditingController(text: currentUserAddress);
  }

  getUser() async {
    setState(() {
      isLoading = true;
    });
    //DocumentSnapshot doc = await usersRef.document(widget.currentUserId).get();
    //user = User.fromDocument(doc);
    docUser.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        // ...
        currentUserMail = data['email'];
        currentUserName = data['name'];
        currentUserDescription = data['description'];
        currentUserAddress = data['address'];

        print("####### $currentUserName");




      },
      onError: (e) => print("Error getting document: $e"),
    );

    displayNameController.text = "";
    bioController.text = "";
    setState(() {
      isLoading = false;
    });
  }

  setUserInfo() async {
    setState(() {
      isLoading = true;
    });
    String currentUserID = _auth.currentUser!.uid;

    var json = {
      'date': new DateTime.now(),
      'description': '',
      'email': '',
      'image':
          'https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=20&m=1223671392&s=612x612&w=0&h=lGpj2vWAI3WUT1JeJWm1PRoHT3V15_1pdcTn2szdwQ0=',
      'name': '',
      'userID': '',
    };

    // json['email'] = currentUserMail as String;
    // json['userID'] = currentUserID as String;
    // json['name'] = currentUserName as String;

    //await docUser.set(json);
    if (!mailController.text.isEmpty) {
      currentUserMail = mailController.text;
    }
    //
    if (!displayNameController.text.isEmpty) {
      currentUserName = displayNameController.text;
    }

    if (!bioController.text.isEmpty) {
      currentUserDescription = bioController.text;
    }

    if (!addressController.text.isEmpty) {
      currentUserAddress = addressController.text;
    }

    docUser.update({'name': displayNameController.text});
    docUser.update({'description': bioController.text});
    docUser.update({'email': mailController.text});
    docUser.update({'address': addressController.text});

    ///TODO image set
    //docUser.update({'image': displayNameController.text});

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Güncelleme İsteği'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text("Bilgileriniz Güncellenmiştir. \n Hata almanız durumunda tekrar giriş yapmayı deneyiniz."),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);

              },
            ),
          ],
        );
      },
    );
  }


  Column buildDisplayNameField() {
    return Column(
      children: [Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: displayNameController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Görünen ad giriniz...",
                label: Text("Görünen ad"),
                hintStyle: TextStyle(color: Colors.grey)),
            validator: (name) {
              if (name!.isEmpty) {
                return "Lütfen kullanıcı adı giriniz";
              }
              return null;
            },
          ),
        ),
      ),],
    );
  }

  Column buildBioField() {
    return Column(
      children: [Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: bioController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Hakkınızda kısa bilgi girin...",
                label: Text("Hakkınızda"),
                hintStyle: TextStyle(color: Colors.grey)),
            validator: (name) {
              if (name!.isEmpty) {
                return "Lütfen Hakkınızda giriniz";
              }
              return null;
            },
          ),
        ),
      ),],
    );
  }



  Column buildAddress() {
    return Column(
      children: [Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: addressController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Adresinizi girin...",
                label: Text("Adres"),
                hintStyle: TextStyle(color: Colors.grey)),
            validator: (name) {
              if (name!.isEmpty) {
                return "Lütfen adres giriniz";
              }
              return null;
            },
          ),
        ),
      ),],
    );
  }

  Column buildMail() {
    return Column(
      children: [Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: mailController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Mailinizi girin...",
                label: Text("Mail Adresi"),
                hintStyle: TextStyle(color: Colors.grey)),
            validator: (name) {
              if (name!.isEmpty) {
                return "Lütfen mail giriniz";
              }
              return null;
            },
          ),
        ),
      ),],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profili Düzenle",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: isLoading
          ? circularProgress()
          : ListView(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 16.0,
                          bottom: 8.0,
                        ),
                        child:
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .doc(currentUserID)
                                .snapshots(),

                            builder: (context, snapshot) {
                              final Storage storage = Storage();

                              if (!snapshot.hasData) {
                                return new Text("Loading");
                              } else {
                                final data = snapshot.requireData;
                                return GestureDetector(
                                    child: CircleAvatar(
                                      backgroundImage:
                                      NetworkImage(data['image']),
                                      radius: 50,
                                    ),
                                    onTap: () async {
                                      final results = await FilePicker.platform.pickFiles(
                                        allowMultiple: false,
                                        type: FileType.custom,
                                        allowedExtensions: ['png', 'jpg', 'jpeg'],
                                      );

                                      if (results == null) {
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('görsel seçilmedi')));
                                      }

                                      final path = results?.files.single.path;
                                      final fileName = results?.files.single.name;

                                      storage.uploadFile(path!, fileName!)
                                          .then((value) => print('Done'));









                                      print(path);
                                      print(fileName);
                                    }
                                );
                              }
                            }),





                        /*CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                          radius: 50,
                        ),*/
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            buildDisplayNameField(),
                            SizedBox(height: 20,),
                            buildBioField(),
                            SizedBox(height: 20,),
                            buildMail(),
                            SizedBox(height: 20,),
                            buildAddress(),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setUserInfo();
                            print("buton basıldı");
                            print(currentUserID);
                            print(currentUserMail);
                            print(currentUserDescription);
                            print(currentUserAddress);
                            //_showMyDialog();
                            Navigator.pushNamed(context, '/navigationPage2');

                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 85.0, vertical: 15.0)),

                          /// TODO mutfağıma git mutfak aç olsun
                          child: const Text(
                            "Güncelle ",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ))
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

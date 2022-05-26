import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktik/main.dart';
import 'package:tiktik/screen/UserProfileScreen.dart';
import 'package:tiktik/widget/user_image.dart';

import '../StyleProvider.dart';
import 'greetingPage.dart';

class TempUserProfile extends StatefulWidget {
  @override
  _TempUserPofile createState() => _TempUserPofile();
}

class _TempUserPofile extends State<TempUserProfile> {
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

    docUser.update({'name': currentUserName});
    docUser.update({'description': currentUserDescription});
    docUser.update({'email': currentUserMail});
    docUser.update({'address': currentUserAddress});

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
                Text(
                    "Bilgileriniz Güncellenmiştir. \n Hata almanız durumunda tekrar giriş yapmayı deneyiniz."),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GreetingPage(),
                    ),
                        (route) => false);
              },
            ),
          ],
        );
      },
    );
  }


  Column buildDisplayNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text(
              "Kullanıcı Adın",
              style: TextStyle(color: Colors.grey),
            )),
        Container(
          decoration: carBoxDec,
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
            child: TextField(
              controller: displayNameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: currentUserName,
                hintStyle: infoHintStyle,
              ),
            ),
          ),
        )
      ],
    );
  }

  Column buildBioField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text(
              "Kendinden Bahset",
              style: TextStyle(color: Colors.grey),
            )),
        Container(
          decoration: carBoxDec,
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
            child: TextField(
              controller: bioController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: currentUserDescription,
                hintStyle: infoHintStyle,
              ),
            ),
          ),
        )
      ],
    );
  }


  Column buildAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text(
              "Adresin",
              style: TextStyle(color: Colors.grey),
            )),
        Container(
          decoration: carBoxDec,
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: currentUserAddress,
                hintStyle: infoHintStyle,
              ),
            ),
          ),
        )
      ],
    );
  }

  Column buildMail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text(
              "Mail Hesabın",
              style: TextStyle(color: Colors.grey),
            )),
        Container(
          decoration: carBoxDec,
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
            child: TextField(
              controller: mailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: currentUserMail,
                hintStyle: infoHintStyle,
              ),
            ),
          ),
        )
      ],
    );
  }

  String imageUrl = '';

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
                UserImage(onFileChanged: ((imageUrl) {
                setState(() {
                  this.imageUrl = imageUrl;
                });
                }),),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      buildDisplayNameField(),
                      buildBioField(),
                      buildMail(),
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
                      _showMyDialog();
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

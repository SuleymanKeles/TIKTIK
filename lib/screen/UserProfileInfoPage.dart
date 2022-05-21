import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktik/main.dart';
import 'package:tiktik/screen/UserProfileScreen.dart';

import '../StyleProvider.dart';

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
  final docUser  = FirebaseFirestore.instance.collection('users').doc(currentUserID);

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
         currentUserMail=        data['email'];
         currentUserName=        data['name'];
         currentUserDescription= data['description'];
         currentUserAddress=      data['address'];

      },
      onError: (e) => print("Error getting document: $e"),
    );


    displayNameController.text = "";
    bioController.text ="";
    setState(() {
      isLoading = false;
    });
  }

  setUserInfo() async {
    setState(() {
      isLoading = true;
    });
    String currentUserID=_auth.currentUser!.uid;


    var json = {
      'date': new DateTime.now(),
      'description': '',
      'email': '',
      'image': 'https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=20&m=1223671392&s=612x612&w=0&h=lGpj2vWAI3WUT1JeJWm1PRoHT3V15_1pdcTn2szdwQ0=',
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






       docUser.update({'name':      currentUserName   });
       docUser.update({'description': currentUserDescription });
       docUser.update({'email':    currentUserMail    });
       docUser.update({'address':    currentUserAddress   });





       ///TODO image set
       //docUser.update({'image': displayNameController.text});

       setState(() {
         isLoading = false;
       });
     }


  Column buildDisplayNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding:  EdgeInsets.fromLTRB(8,4,8,4),
            child: Text(
              "Kullanıcı Adın",
              style: TextStyle(color: Colors.grey),
            )),
        Container(
          decoration: carBoxDec,
          child: Padding(
            padding:  EdgeInsets.fromLTRB(8,6,8,6),
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
            padding:  EdgeInsets.fromLTRB(8,4,8,4),
            child: Text(
              "Kendinden Bahset",
              style: TextStyle(color: Colors.grey),
            )),
        Container(
          decoration: carBoxDec,
          child: Padding(
            padding:  EdgeInsets.fromLTRB(8,6,8,6),
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
            padding:  EdgeInsets.fromLTRB(8,4,8,4),
            child: Text(
              "Adresin",
              style: TextStyle(color: Colors.grey),
            )),
        Container(
          decoration: carBoxDec,
          child: Padding(
            padding:  EdgeInsets.fromLTRB(8,6,8,6),
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
            padding:  EdgeInsets.fromLTRB(8,4,8,4),
            child: Text(
              "Mail Hesabın",
              style: TextStyle(color: Colors.grey),
            )),
        Container(
          decoration: carBoxDec,
          child: Padding(
            padding:  EdgeInsets.fromLTRB(8,6,8,6),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                  child:  CircleAvatar(
                    backgroundImage:
                    AssetImage('assets/images/avatar.png'),
                    radius: 50,
                  ),
                ),
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
                ElevatedButton(onPressed: (){
                  setUserInfo();
                  print("buton basıldı");
                  print(currentUserID);
                  print(currentUserMail);
                  print(currentUserDescription);
                  print(currentUserAddress);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserProfileScreen(),
                    ),
                  );
                },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent[400],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        padding: const EdgeInsets.symmetric(horizontal: 85.0,vertical: 15.0)
                    ),
                    /// TODO mutfağıma git mutfak aç olsun
                    child:
                         Text("Güncelle ",style: TextStyle(fontSize: 18.0,color: Colors.white,fontStyle: FontStyle.italic),)




                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
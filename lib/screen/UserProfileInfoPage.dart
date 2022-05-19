import 'package:flutter/material.dart';

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
    displayNameController.text = "";
    bioController.text ="";
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
                hintText: "user.name",
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
                hintText: "user.bio",
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
                hintText: "user.address",
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
                hintText: "user.mail",
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

                  Navigator.of(context).pop();
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
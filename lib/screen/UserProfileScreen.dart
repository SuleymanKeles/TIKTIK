import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tiktik/Auth/signin_page.dart';
import 'package:tiktik/StyleProvider.dart';
import '../main.dart';
import '../profileWidget.dart';
import 'UserProfileInfoPage.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  refresh() {
    setState(() {});
  }

  ///
  //String currentUserName="Emine Çığ";
  //String currentUserMail="emine.cig67@gmail.com";
  // String currentUserAddress="";
  //String selectedDescription="Yemek yapmak benim isdada sdasd asdasd asdasda sdadasdaşsd aşldk aşlsdkşçin bir tutku...";

  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  void resetPassword() {
    _auth.sendPasswordResetEmail(email: currentUserMail as String);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/images/logo.png",
            width: 48,
          ),
          leading: Container(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              // const CircleAvatar(
              //   backgroundImage:
              //   AssetImage('assets/images/avatar.png'),
              //   radius: 35,
              // ),
              ProfileWidget(
                imagePath: "assets/images/avatar.png",
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => UserProfileInfoPage()),
                  );
                },
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    Text(
                      '$currentUserName'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 5.0),
                    //Text('$currentUserTitle',style: TextStyle(fontSize: 15.0,color: Colors.black),),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 8),
            child: (currentUserDescription.isEmpty)
                ? Text(
                    "Kendinizi tanıtacak yazınız yok.\nBilgilerinizi güncelleyiniz")
                : Text("$currentUserDescription"),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
              decoration: carBoxDec,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        child: ImageIcon(
                          AssetImage("assets/icons/personalinfo.png"),
                          size: 20,
                          color: Color(0xFFFF1744),
                        ),
                        backgroundColor: Colors.white,
                        radius: 20.0,
                      ),
                      title: const Text('Kullanıcı Adı '),
                      subtitle: (currentUserName!.isEmpty)
                          ? Text("not found!")
                          : Text("$currentUserName"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        child: ImageIcon(
                          AssetImage("assets/icons/mail.png"),
                          size: 20,
                          color: Color(0xFFFF1744),
                        ),
                        backgroundColor: Colors.white,
                        radius: 20.0,
                      ),
                      title: const Text('Mail'),
                      subtitle: (currentUserMail!.isEmpty)
                          ? Text("not found!")
                          : Text("$currentUserMail"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        child: ImageIcon(
                          AssetImage("assets/icons/map.png"),
                          size: 20,
                          color: Color(0xFFFF1744),
                        ),
                        backgroundColor: Colors.white,
                        radius: 20.0,
                      ),
                      title: const Text('Adresin'),
                      subtitle: (currentUserAddress.isEmpty)
                          ? Text("Adres bilginiz yok\nEklemek için tıklayın")
                          : Text("$currentUserAddress"),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UserProfileInfoPage(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        child: ImageIcon(
                          AssetImage("assets/icons/update.png"),
                          size: 20,
                          color: Color(0xFFFF1744),
                        ),
                        backgroundColor: Colors.white,
                        radius: 20.0,
                      ),
                      title: const Text('Bilgilerini Güncelle'),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UserProfileInfoPage(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        child: ImageIcon(
                          AssetImage("assets/icons/unlock.png"),
                          size: 20,
                          color: Color(0xFFFF1744),
                        ),
                        backgroundColor: Colors.white,
                        radius: 20.0,
                      ),
                      title: const Text('Şifre Yenile'),
                      onTap: () {
                        ///TODO firebase send reset email
                        resetPassword();
                      },
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        child: ImageIcon(
                          AssetImage("assets/icons/exit.png"),
                          size: 20,
                          color: Color(0xFFFF1744),
                        ),
                        backgroundColor: Colors.white,
                        radius: 20.0,
                      ),
                      title: const Text('Çıkış Yap'),
                      onTap: () async {
                        /// todo: LOG OUT operation
                        final user = _auth.currentUser;
                        if (user == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("No sign-in yet")));

                          return;
                        }

                        if (googleSignIn.currentUser != null ||
                            _auth.currentUser != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Successfully logged out")));

                          await googleSignIn.signOut();
                          await _auth.signOut();
                        }

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );

                        /*
                Center(
                     child: InkWell(
                       onTap: () async {
                         final User user = _auth.currentUser;
                         if (user == null) {
                           ScaffoldMessenger
                               .of(context)
                               .showSnackBar(SnackBar(content: Text("No sign-in yet")));

                           return;
                         }

                         if (googleSignIn.currentUser != null ||
                             _auth.currentUser != null) {

                           ScaffoldMessenger
                               .of(context)
                               .showSnackBar(SnackBar(content: Text("Successfully logged out")));

                           await googleSignIn.signOut();
                           await _auth.signOut();
                         }

                         Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(builder: (context) => SignInPage()),
                         );
                       },
                       child: Container(
                         height: 60,
                         width: MediaQuery.of(context).size.width-70,
                         decoration: BoxDecoration(
                           color: Colors.redAccent,
                           borderRadius: BorderRadius.circular(14),
                         ),
                         child: Padding(
                           padding: const EdgeInsets.only(
                               left: 30.0, right: 30.0, top: 5, bottom: 5),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Icon(Icons.add_to_home_screen_outlined),
                               SizedBox(
                                 width: 20,
                               ),
                               Text("Log out", style: TextStyle(fontSize: 15)),
                             ],
                           ),
                         ),
                       ),
                     ),


                   ),
                 */
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ])),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 85.0, vertical: 15.0)),

            /// TODO mutfağıma git mutfak aç olsun
            child: (!hasKitchen)
                ? Text(
                    "Mutfak Aç",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  )
                : Text(
                    "Mutfağıma Git",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  )
            //const Text("MUTFAK AÇ",style: TextStyle(fontSize: 18.0,color: Colors.white),)

            )
      ],
    );
  }
}

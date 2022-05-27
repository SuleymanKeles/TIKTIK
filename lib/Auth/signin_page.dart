import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktik/NavigationPage.dart';
import 'package:tiktik/Provider/UserData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktik/demo.dart';
import 'package:tiktik/screen/UserProfileScreen.dart';
import 'package:tiktik/screen/greetingPage.dart';
import '../StyleProvider.dart';
import '../main.dart';
import 'register_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final _messangerKey = GlobalKey<ScaffoldMessengerState>();

class _SignInPageState extends State<SignInPage> {
  /// add style page this variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _SignInBody(),
    );
  }
}

class _SignInBody extends StatefulWidget {
  @override
  __SignInBodyState createState() => __SignInBodyState();
}

class __SignInBodyState extends State<_SignInBody> {
  Color? fontColor = Colors.redAccent[400];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView(
          padding: const EdgeInsets.all(12.0),
          children: [
            Center(
              //TO:DO Logo eklenebilir
              child: Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: Text(
                  "TIKTIK",
                  style: TextStyle(color: fontColor, fontSize: 30),
                ),
              ),
            ),

            //? Email / Şifre ile giriş
            _EmailPasswordForm(),

            ///TODO Google ile giriş

            _SignInProvider(
              infoText: "Google ile giriş yap",
              buttonType: Buttons.Google,
              signInMethod: () async => _signInWithGoogle(),
            ),

            divider(),
            goSignUpPage(),
          ],
        ),
      ),
    );
  }

  Widget goSignUpPage() {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  RegisterPage()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, top: 15),
          child: Row(
            children: [
              //    SizedBox(width: 60,),
              Text(
                "Hesabın yok mu ? ",
                style: TextStyle(color: Colors.black54, fontSize: 20),
              ),
              Text(
                "Kayıt ol",
                style: TextStyle(color: mainColor, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row divider() {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 15.0, right: 20.0),
            child: Divider(
              color: Colors.black,
              height: 36,
            )),
      ),
      Text("OR"),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 20.0, right: 15.0),
            child: Divider(
              color: Colors.black,
              height: 36,
            )),
      ),
    ]);
  }

  void _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(googleAuthCredential);

      final _googleUser = userCredential.user;
      currentUserID = _googleUser?.uid;
      currentUserMail = _googleUser?.email;
      currentUserName = _googleUser?.displayName;




      print(userCredential.user!.uid);
      // TODO: Kayıt İşlemi
      // Scaffold.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text("${googleUser!.displayName},Google ile giriş yapıldı."),
      //   ),
      // );
      // _messangerKey.currentState?.showSnackBar(
      //   SnackBar(
      //     duration:Duration(seconds: 2) ,
      //     content:  Text('${googleUser!.displayName},Google ile giriş yapıldı.'),
      //   ),
      // );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<ProviderUserData>(
              create: (_) => ProviderUserData.user(user: _googleUser),
              child: GreetingPage()),
        ),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());

      // TODO: Kayıt İşlemi
      // Scaffold.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text("${e.message}"),
      //   ),
      // );

    } catch (e) {
      debugPrint(e.toString());

      // // TODO: Kayıt İşlemi
      // Scaffold.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(e.toString()),
      //   ),
      // );
    }
  }
}

class _EmailPasswordForm extends StatefulWidget {
  @override
  __EmailPasswordFormState createState() => __EmailPasswordFormState();
}

class __EmailPasswordFormState extends State<_EmailPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black12, style: BorderStyle.solid),
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
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey)),
                  validator: (mail) {
                    if (mail!.isEmpty) return "Lütfen email hesabınızı giriniz";
                    return null;
                  },
                ),
              ),
            ),
            //? Şifre
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black26, style: BorderStyle.solid),
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
                  validator: (password) {
                    if (password!.isEmpty) return "Lütfen şifrenizi giriniz";
                    return null;
                  },
                  obscureText: true, //! Şifrenin görünmesini engeller.
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
                child: Text(
                  " Şifremi Unuttum",
                  style: TextStyle(fontSize: 15, color: mainColor),
                ),
                onTap: () {
                  print("password reset pressed");
                  if (_emailController.text == null) {
                    // TODO: Kayıt İşlemi
                    // Scaffold.of(context).showSnackBar(SnackBar(
                    //   content: Text(
                    //       "Lütfen geçerli email hesabınızı giriniz !"),
                    // ));
                  } else {
                    // TODO: Kayıt İşlemi
                    // Scaffold.of(context).showSnackBar(SnackBar(
                    //   content: (_emailController.text.isEmpty) ?
                    //   Text("Lütfen geçerli bir email hesabı giriniz !")   :
                    //   Text("Hesabınıza şifre yenileme e-postası gönderildi.") ,
                    //
                    // ));
                    resetPassword(_emailController.text.trim());
                  }
                }),

            Container(
              padding: const EdgeInsets.only(top: 16.0),
              alignment: Alignment.center,
              child: SignInButton(Buttons.Email, text: "Giriş yap",
                  onPressed: () async {
                //   print(_emailController.text);
                //   print(_passwordController.text);
                // print("Sign in button pressed");
                if (_formKey.currentState!.validate()) {
                  // print("validate");
                  _signInWithEmailAndPassword();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text("Mail account user not found"),
      // ));

      debugPrint("Şifre yenilerken hata oluştu ! ");
    }
  }

  /// [Email] ve [Password] ile kullanıcı girişi yapar.
  void _signInWithEmailAndPassword() async {
    //print(  "_signInWithEmailAndPassword");
    try {
      final user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trimRight(),
        password: _passwordController.text.trimRight(),
      ))
          .user;

      currentUserID = user?.uid;
      currentUserMail = user?.email;
      currentUserName = user?.displayName;
      print(currentUserID! + " " + currentUserMail! + " " + currentUserName!);



      SharedPreferences prefs = await SharedPreferences.getInstance();


      prefs.setString('currentUserID', currentUserID.toString());
      prefs.setString('currentUserName', currentUserName.toString());
      prefs.setString('currentUserMail', currentUserMail.toString());


      // TODO: Kayıt İşlemi
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   duration: Duration(seconds: 2),
      //   content: Text("${user?.email} giriş yaptı."),
      // ));

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ChangeNotifierProvider<ProviderUserData>(
      //         create: (_) => ProviderUserData.user(user: user)),
      //   ),
      // );

      Navigator.pushNamed(context, '/navigationPage');

      _emailController.text = "";
      _passwordController.text = "";
    } on FirebaseAuthException catch (e) {
      print("Auth problem");
      debugPrint(e.toString());
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text("${e.message}"),
      // ));
    } catch (e) {
      print("General Problem");
      debugPrint(e.toString());

      // TODO: Kayıt İşlemi
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text("Bu email ve şifre ile giriş yapılırken hata oluştu"),
      // ));
    }
  }
}

class _SignInProvider extends StatefulWidget {
  final String infoText;
  final Buttons buttonType;
  final Function signInMethod;

  const _SignInProvider({
    Key? key,
    required this.infoText,
    required this.buttonType,
    required this.signInMethod,
  }) : super(key: key);

  @override
  __SignInProviderState createState() => __SignInProviderState();
}

class __SignInProviderState extends State<_SignInProvider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16.0),
            alignment: Alignment.center,
            child: SignInButton(
              widget.buttonType,
              text: widget.infoText,
              onPressed: () async => widget.signInMethod(),
            ),
          ),
        ],
      ),
    );
  }
}

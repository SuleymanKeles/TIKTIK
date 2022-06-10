import 'package:flutter/material.dart';
import 'package:tiktik/NavigationPage.dart';
import 'package:tiktik/main.dart';
import 'package:tiktik/screen/KitchenAddScreen.dart';
import 'package:tiktik/screen/UserProfileScreen.dart';

import '../Auth/signin_page.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String butonMessage = "Sipariş Vermeye Başla";
    String buton1Message = "Mutfak Aç";
    String greetingMessage = "Üyeliğiniz Oluşturuldu";

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/icons/greeting.png'),
              width: 200,
              height: 200,
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavigationPage(index: 1),
                        ),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0)),
                    child: Text(
                      butonMessage,
                      style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    )),

                ///
                SizedBox(width: 20),

                ///
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => KitchenAddScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0)),
                    child: Text(
                      buton1Message,
                      style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

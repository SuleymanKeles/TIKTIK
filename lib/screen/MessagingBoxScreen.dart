import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tiktik/screen/MessagingScreen.dart';

import '../data/modal/Message.dart';

class MessagingBoxScreen extends StatefulWidget {
  const MessagingBoxScreen({Key? key}) : super(key: key);

  @override
  _MessagingBoxScreenState createState() => _MessagingBoxScreenState();
}

class _MessagingBoxScreenState extends State<MessagingBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Container(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: Text(
                  "Mesajlar",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/messagingScreen');
          },

          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Row(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg"),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.68,
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Izzet Kavak",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Devam ediyor...",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: Text(
                                  "Bu yemeğinizde süt ve süt ürünü kullandınız mı?"),
                            )
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Container(
            child: Text(
              "Tüm mesajları gördünüz.",
            ),
          ),
        )
      ],
    )));
  }
}

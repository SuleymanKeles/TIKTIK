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
        Container(
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
        Container(
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
                      "http://thenewcode.com/assets/images/thumbnails/sarah-parmenter.jpeg"),
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
                              "Yeşim Kahya",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Tamamlandı",
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
                                "Çok teşekkür ederim."),
                          )
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
        Container(
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
                      "https://i.pinimg.com/originals/de/64/80/de64801f0275c1ab2ea5a9e2bb3ce7bc.jpg"),
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
                              "Yağmur Gökalp",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Tamamlandı",
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
                                "Çocuklarım çok beğendi elinize sağlık."),
                          )
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
        Container(
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
                      "https://xsgames.co/randomusers/assets/avatars/male/46.jpg"),
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
                              "Ilker Çaglayan",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Tamamlandı",
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
                                "Çok memnun kaldık bundan sonra da sipariş vereceğiz."),
                          )
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
        Container(
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
                      "https://xsgames.co/randomusers/assets/avatars/male/30.jpg"),
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
                              "Pelin Çetin",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Tamamlandı",
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
                                "Sipariş elime ulaştı teşekkürler."),
                          )
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top:30),child: Container(child: Text("Tüm mesajları gördünüz.",),),)
      ],
    )));
  }
}

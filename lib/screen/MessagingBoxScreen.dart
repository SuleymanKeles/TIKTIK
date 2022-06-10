import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tiktik/main.dart';
import 'package:tiktik/screen/HomeScreen.dart';
import 'package:tiktik/screen/MessagingScreen.dart';

import '../data/modal/Message.dart';

class MessagingBoxScreen extends StatefulWidget {
  const MessagingBoxScreen({Key? key}) : super(key: key);

  @override
  _MessagingBoxScreenState createState() => _MessagingBoxScreenState();
}

List tabs = ["SATICILAR", "ALICILAR"];
int selectedIndex = 0;
int satici_ya_da_alici = 0;
String currentChatID = "";
String selectedFriend = "";

String buyerUserID = "";
String sellerUserID = "";

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
            child:


            Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      tabs.length,
                          (index) => GestureDetector(
                        onTap: () => setState(() {
                          satici_ya_da_alici = index;
                        }),
                        child: Container(
                          height: 35.0,
                          width: 164.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: satici_ya_da_alici == index
                                  ? Colors.redAccent[400]
                                  : Colors.red[100],
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Text(
                            tabs[index],
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),

                if (satici_ya_da_alici == 0)
                  Column(children: [
                    Row(
                      children: const [
                        Text("Satıcılarla Olan Görüşmeler",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w200,
                                color: Colors.black)),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),



                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.62,
                      child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            Container(
                            ),
                        StreamBuilder<QuerySnapshot>(
                          stream:FirebaseFirestore.instance.collection('messages')
                              .where(
                              'buyer', isEqualTo:
                          "$currentUserID"
                          )
                              .where('active', isNotEqualTo: 0).orderBy('active', descending: true).orderBy('date', descending: true)
                              .snapshots(),
                          builder: (
                              BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot,
                              ) {
                            if (snapshot.hasError) {
                              return const Text("error");
                            }
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Text("loading");
                            }
                            final data = snapshot.requireData;
                            return ListView.builder(
                              primary: false,
                              itemCount: data.size,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    currentChatID = data.docs[index].id;
                                    sellerUserID = data.docs[index]['seller'];
                                    buyerUserID = data.docs[index]['buyer'];
                                    Navigator.pushNamed(context, '/messagingScreen');

                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        child:

                                        StreamBuilder<DocumentSnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(data.docs[index]['seller'])
                                                .snapshots(),

                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return new Text("Loading");
                                              } else {
                                                final data = snapshot.requireData;
                                                return  CircleAvatar(
                                                  radius: 35,
                                                  backgroundImage: NetworkImage(
                                                      data['image']),
                                                );
                                              }
                                            }),


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
                                                    StreamBuilder<DocumentSnapshot>(
                                                        stream: FirebaseFirestore.instance
                                                            .collection('users')
                                                            .doc(data.docs[index]['seller'])
                                                            .snapshots(),

                                                        builder: (context, snapshot) {
                                                          if (!snapshot.hasData) {
                                                            return new Text("Loading");
                                                          } else {
                                                            final data = snapshot.requireData;
                                                            return  Text(
                                                              data['kitchenName'],
                                                              style: TextStyle(fontWeight: FontWeight.bold),
                                                            );
                                                          }
                                                        }),



                                                    Text(
                                                      DateTime.fromMicrosecondsSinceEpoch(data.docs[index]['date'].microsecondsSinceEpoch).toString().substring(0,10),
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
                                                        "${data.docs[index]['lastMessage'].toString()}"),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),]),)

                  ])
                else
                  Column(children: [
                    Row(
                      children: const [
                        Text("Alıcılarla Olan Görüşmeler",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w200,
                                color: Colors.black)),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.62,
                      child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            Container(
                            ),
                        StreamBuilder<QuerySnapshot>(
                          stream:FirebaseFirestore.instance.collection('messages')
                              .where(
                              'seller', isEqualTo:
                          "$currentUserID"
                          )
                              .where('active', isNotEqualTo: 0).orderBy('active', descending: true).orderBy('date', descending: true)
                              .snapshots(),
                          builder: (
                              BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot,
                              ) {
                            if (snapshot.hasError) {
                              return const Text("error");
                            }
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Text("loading");
                            }
                            final data = snapshot.requireData;
                            return ListView.builder(
                              primary: false,
                              itemCount: data.size,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: GestureDetector(
                                    onTap: (){
                                      currentChatID = data.docs[index].id;
                                      sellerUserID = data.docs[index]['seller'];
                                      buyerUserID = data.docs[index]['buyer'];
                                      Navigator.pushNamed(context, '/messagingScreen');

                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          child:

                                          StreamBuilder<DocumentSnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(data.docs[index]['buyer'])

                                                  .snapshots(),

                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return new Text("Loading");
                                                } else {
                                                  final data = snapshot.requireData;
                                                  return  CircleAvatar(
                                                    radius: 35,
                                                    backgroundImage: NetworkImage(
                                                        data['image']),
                                                  );
                                                }
                                              }),


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

                                                      StreamBuilder<DocumentSnapshot>(
                                                          stream: FirebaseFirestore.instance
                                                              .collection('users')
                                                              .doc(data.docs[index]['buyer'])
                                                              .snapshots(),

                                                          builder: (context, snapshot) {
                                                            if (!snapshot.hasData) {
                                                              return new Text("Loading");
                                                            } else {
                                                              final data = snapshot.requireData;
                                                              return  Text(
                                                                data['name'],
                                                                style: TextStyle(fontWeight: FontWeight.bold),
                                                              );
                                                            }
                                                          }),



                                                      Text(
                                                        DateTime.fromMicrosecondsSinceEpoch(data.docs[index]['date'].microsecondsSinceEpoch).toString().substring(0,10),
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
                                                          "${data.docs[index]['lastMessage'].toString()}"),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                  padding: EdgeInsets.only(bottom: 20),
                                );
                              },
                            );
                          },
                        )]),)
                  ])
              ],
            )


/*

            StreamBuilder<QuerySnapshot>(
              stream:FirebaseFirestore.instance.collection('messages')
                  .where(
                  'buyer', isEqualTo:
              "$currentUserID"
              ).snapshots(),
              builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                  ) {
                if (snapshot.hasError) {
                  return const Text("error");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("loading");
                }
                final data = snapshot.requireData;
                return ListView.builder(
                  primary: false,
                  itemCount: data.size,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
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
                    );
                  },
                );
              },
            )*/




        ),
      ],
    )));
  }
}

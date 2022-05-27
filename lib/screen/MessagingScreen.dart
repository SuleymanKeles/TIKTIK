import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tiktik/main.dart';
import 'package:tiktik/screen/MessagingBoxScreen.dart';

import 'HomeScreen.dart';

String currentText = "";


class MessagingScreen extends StatefulWidget {
  const MessagingScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  final myController = TextEditingController();

  bool _isEnable = true;


  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }




  void _setIsEneble(bool isEnable) {
    setState(() {
      debugPrint(_isEnable.toString());
      _isEnable = isEnable;
      debugPrint(_isEnable.toString());
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              centerTitle: true,
              title:

              StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('messages')
                      .doc("$buyerUserID-$sellerUserID")
                      .snapshots(),

                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return new Text("Loading");
                    } else {
                      final data = snapshot.requireData;
                      return  (data['seller'] == currentUserID) ? StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(buyerUserID)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return new Text("Loading");
                            } else {
                              final data = snapshot.requireData;
                              return  RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [

                                  TextSpan(
                                      text: data['name'],
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(text: "\n"),
                                  TextSpan(
                                      text: "Alıcısı ile konuşuyorsunuz.",
                                      style: TextStyle(fontSize: 11, color: Colors.black)),
                                ]),
                              );
                            }
                          }): StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(sellerUserID)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return new Text("Loading");
                            } else {
                              final data = snapshot.requireData;
                              return


                                RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [

                                  TextSpan(
                                      text: data['kitchenName'],
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(text: "\n"),
                                  TextSpan(
                                      text: "Satıcısı ile konuşuyorsunuz",
                                      style: TextStyle(fontSize: 11, color: Colors.black)),
                                ]),

                              );
                            }
                          });
                    }
                  }),


            ),
            floatingActionButton: Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.1),
              child: AnimatedOpacity(
                opacity: _isEnable ? 0.0 : 1.0,
                duration: Duration(milliseconds: 1000),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/orderConformationScreen',
                    );

                    _setIsEneble(true);
                  },
                  label: const Text("Şiparişi Tamamla"),
                  icon: const Icon(Icons.check),
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.82- MediaQuery.of(context).viewInsets.bottom,
                        child: ListView(
                          reverse: true,
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              Container(
                              ),
                              StreamBuilder<QuerySnapshot>(
                                stream:FirebaseFirestore.instance.collection('messages').doc(currentChatID).collection('messages').where('active', isNotEqualTo: 0)
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
                                      return Column(
                                        children: [
                                          Container(
                                            alignment: (data.docs[index]['author'] == currentUserID) ? Alignment.topRight : Alignment.topLeft,
                                            child: Container(
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                  MediaQuery.of(context).size.width * 0.8),
                                              padding: EdgeInsets.all(10),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 20),
                                              decoration: BoxDecoration(
                                                  color: (data.docs[index]['author'] == currentUserID) ? Colors.redAccent : Colors.white,
                                                  borderRadius: BorderRadius.circular(15),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey.withOpacity(1),
                                                      spreadRadius: 0.1,
                                                      blurRadius: 5,
                                                    )
                                                  ]),
                                              child: Text(
                                                  data.docs[index]['message'],
                                              style: TextStyle(color: (data.docs[index]['author'] == currentUserID) ? Colors.white : Colors.black),
                                              ),

                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),]),),















/*
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.8),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(1),
                                      spreadRadius: 0.1,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Text(
                                "text ever since the 1500s, when an unknown printer took a galley",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),*/

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 70,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                            controller: myController,
                        decoration: InputDecoration.collapsed(
                            hintText: "Bir mesaj gönderin."),

                      )),
                      IconButton(
                        onPressed: () async {

                          debugPrint(myController.text);
                          currentText = myController.text;


                          var currentTime = DateTime.now().toString();

                          final docMessage =
                          FirebaseFirestore.instance.collection('messages').doc("$buyerUserID-$sellerUserID");
                          final docMessages =
                          FirebaseFirestore.instance.collection('messages').doc("$buyerUserID-$sellerUserID").collection('messages').doc("$currentTime");


                          var json = {
                            'date': DateTime.now(),
                            'seller': '',
                            'buyer' : '',
                            'lastMessage' : '',

                          'active' : 1
                          };

                          var json2 = {
                            'message': '',
                            'author': '',
                          'active' : 1

                          };

                          json['buyer'] = buyerUserID.toString();
                          json['lastMessage'] = currentText;
                          json['seller'] = sellerUserID.toString();
                          json2['message'] = currentText;
                          json2['author'] = currentUserID!;

                          await docMessage.update(json);
                          await docMessages.set(json2);
                          myController.text = "";


                        },
                        icon: Icon(Icons.send),
                        color: Colors.redAccent,
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}

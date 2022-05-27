import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktik/StyleProvider.dart';
import 'package:tiktik/screen/HomeScreen.dart';
import 'package:tiktik/screen/MessagingBoxScreen.dart';

import '../data/modal/screenArguments.dart';
import '../main.dart';
import '../profileWidget.dart';

String selectedUserID = "";

class ProductDetailScreen extends StatefulWidget {

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Text("$selectedProductName",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Ink.image(
                      image: NetworkImage('$selectedProductImage'),
                      fit: BoxFit.fill,
                      width: 350.0,
                      height: 160.0,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                /*Row(
                  children: <Widget>[
                    SizedBox(width: 6),
                    Icon(Icons.star_border, color: mainColor, size: 30.0),
                    SizedBox(width: 5),
                    Text('1'),
                    SizedBox(width: 40),
                    Icon(Icons.directions_car_filled,
                        color: mainColor, size: 30.0),
                    SizedBox(width: 5),
                    Text('Ücretsiz'),
                    SizedBox(width: 40),
                    Icon(Icons.access_time, color: mainColor, size: 30.0),
                    SizedBox(width: 5),
                    Text('20 dk')
                  ],
                ),*/

                Row(
                  children: [
                     const Icon(
                      Icons.price_change_outlined,
                      size: 18,
                      color: Color(0xFFFF1744),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),



                    Text(
                      "$selectedProductPrice ₺",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black),
                    ),







                    const SizedBox(
                      width: 20.0,
                    ),
                    Icon(
                      (selectedProductService == "Adrese Teslim") ? Icons.delivery_dining_outlined : Icons.directions_walk_outlined ,
                      size: 18,
                      color: Color(0xFFFF1744),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      selectedProductService,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),


                  ],
                ),


                const SizedBox(height: 10),
                Row(children: const <Widget>[
                  SizedBox(width: 6),
                  Text(
                      "                    "
                      "                    "
                      "                       "
                      "                       "
                      "      ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.lineThrough,
                      ),
                      textAlign: TextAlign.start),
                ]),
                GestureDetector(
                  child: Row(
                    children:  <Widget>[
                      SizedBox(width: 6),


                      StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(selectedProductUserID)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return new Text("Loading");
                            } else {
                              final data = snapshot.requireData;
                              return  CircleAvatar(
                                backgroundImage: NetworkImage(data['image']),
                                radius: 25,
                              );
                            }
                          }),




                      SizedBox(width: 15),
                      StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(selectedProductUserID)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return new Text("Loading");
                            } else {
                              final data = snapshot.requireData;
                              return (data['kitchenName'].isEmpty)
                                  ? Text('Mutfak adı yok',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Ubuntu"))
                                  : Text(data['kitchenName'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Ubuntu"));
                            }
                          }),


                      SizedBox(width: 70),
                      Icon(
                        Icons.chevron_right,
                      )
                    ],
                  ),
                  onTap: (){
                    selectedUserID = selectedProductUserID;
                    Navigator.pushNamed(
                      context,
                      '/kitchenDetailScreen',
                    );
                  },
                ),
                const SizedBox(height: 40),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 6),
                    Text('$selectedProductName',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Ubuntu"))
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children:  <Widget>[
                    SizedBox(width: 20),
                    Text("$selectedProductDescription",
                        style: TextStyle(fontSize: 15))
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    child:  Center(
                      child: (selectedProductUserID == currentUserID) ?
                          GestureDetector(
                            child: Text(
                              "ÜRÜNÜ DÜZENLE",
                              style: TextStyle(fontSize: 18.0, color: Colors.white),
                            ),
                            onTap: (){
                              Navigator.pushNamed(context, '/productEditScreen');

                            },
                          )
                          :


                      StreamBuilder<QuerySnapshot>(
                        stream:FirebaseFirestore.instance.collection('messages')
                            .where(
                            'messageID', isEqualTo:
                        "$buyerUserID-$sellerUserID"
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
                            itemCount: 1,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Center(child: Text(
                                  "SİPARİŞ VER",
                                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                                ),),
                                onTap: () async {
                                  buyerUserID = currentUserID! ;
                                  sellerUserID = selectedProductUserID ;






                                  if(data.size > 0) {


                                    currentChatID = "$buyerUserID-$sellerUserID";
                                    sellerUserID = data.docs[index]['seller'];
                                    buyerUserID = data.docs[index]['buyer'];
                                    Navigator.pushNamed(context, '/messagingScreen');

                                  } else {



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
                                      'status' : 'Devam ediyor.',
                                      'active' : 0,
                                      'messageID' : ''
                                    };

                                    var json2 = {
                                      'message': '',
                                      'author': '',
                                      'active' : 0,
                                    };
                                    json['messageID'] = "$buyerUserID-$sellerUserID";

                                    json['buyer'] = buyerUserID.toString();
                                    json['seller'] = sellerUserID.toString();
                                    json2['author'] = currentUserID!;

                                    await docMessage.set(json);
                                    await docMessages.set(json2);


                                    currentChatID = "$buyerUserID-$sellerUserID";
                                    sellerUserID = data.docs[index]['seller'];
                                    buyerUserID = data.docs[index]['buyer'];
                                    Navigator.pushNamed(context, '/messagingScreen');

                                  }



                                },
                              );
                            },
                          );
                        },
                      )





                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

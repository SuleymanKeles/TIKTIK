import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tiktik/data/modal/Kitchen.dart';

import '../data/modal/Product.dart';
import '../data/modal/User.dart';
import '../data/modal/screenArguments.dart';
import '../main.dart';
import '../widget/profile_widget.dart';
import '../widget/textfield_widget.dart';
import 'HomeScreen.dart';
import 'ProductDetailScreen.dart';

class KitchenDetailScreen extends StatefulWidget {
  const KitchenDetailScreen({Key? key}) : super(key: key);

  @override
  _KitchenDetailScreenState createState() => _KitchenDetailScreenState();
}

class _KitchenDetailScreenState extends State<KitchenDetailScreen> {
  int selectedIndex = 0;
  int hazirda_yada_hazirlat = 0;
  List tabs = ["HAZIRDA", "HAZIRLAT"];
  Kitchen kitchen = Kitchen(
      KitchenID: "KitchenID",
      UserID: "UserID",
      KitchenName: "KitchenName",
      Point: "Point",
      ProductList: "ProductList",
      CoverPhoto:
          "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj");
  User user = const User(
      userID: "userID",
      mailAddress: "mailAddress",
      password: "password",
      firstName: "firstName",
      lastName: "lastName",
      birthDate: "birthDate",
      biography: "biography",
      photo:
          "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj",
      address: "address");
  List HazirdaList = [
    {
      "image": "assets/images/sarma.png",
      "name": "Zeytinyağlı Yaprak Sarma ",
      "score": "4.7"
    },
    {
      "image": "assets/images/mercimekköftesi.png",
      "name": "Mercimek Köftesi ",
      "score": "4.6"
    },
  ];
  List HazirlatList = [
    {
      "image": "assets/images/sarma.png",
      "name": "Zeytinyağlı Yaprak Sarma ",
      "score": "4.7",
      "cooked_by": "Selma'nin mutfağı"
    },
    {
      "image": "assets/images/mercimekköftesi.png",
      "name": "Mercimek Köftesi ",
      "score": "4.6",
      "cooked_by": "Murat'ın mutfağı"
    },
  ];

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: StreamBuilder<DocumentSnapshot>(
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
                        ? Text("Ad yok")
                        : Text(data['kitchenName']);
                  }
                }),
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Ink.image(
                      image: AssetImage('assets/images/mutfak.png'),
                      fit: BoxFit.fill,
                      width: 350.0,
                      height: 160.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(children: [


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
                              ? Text("Ad yok",
                              style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left) //mutfak ismi
                              : Text(data['kitchenName'],
                              style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left);//mutfak ismi;
                        }
                      }),



                  const SizedBox(height: 20),


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
                          return (data['kitchenAbout'].isEmpty)
                              ? Text("açıklama yok",
                              style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                              textAlign: TextAlign.left) //description
                              : Text(data['kitchenAbout'],
                              style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                              textAlign: TextAlign.left);//description
                        }
                      }),


                  const SizedBox(height: 20),

                ]),
                const SizedBox(height: 40),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      tabs.length,
                      (index) => GestureDetector(
                        onTap: () => setState(() {
                          hazirda_yada_hazirlat = index;
                        }),
                        child: Container(
                          height: 35.0,
                          width: 164.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: hazirda_yada_hazirlat == index
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
                hazirda_yada_hazirlat == 0
                    ?
                    //HAZIRDA
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.44,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream:FirebaseFirestore.instance.collection('products')
                              .where('userID', isEqualTo: selectedProductUserID)
                              .where(
                              'type', isEqualTo:
                            "Hazırda"
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
                                return GestureDetector(
                                    onTap: () {


                                      selectedProductName =
                                      "${data.docs[index]['name']}";

                                      selectedProductDescription =
                                      "${data.docs[index]['description']}";

                                      selectedProductUserID =
                                      "${data.docs[index]['userID']}";

                                      selectedProductImage =
                                      "${data.docs[index]['image']}";

                                      Navigator.pushNamed(context, '/productDetailScreen');
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.width*0.5,
                                          width: MediaQuery.of(context).size.width,

                                          //padding: EdgeInsets.only(bottom: 24.0),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(8.0),
                                                      child: Image.network(
                                                        '${data.docs[index]['image']}',
                                                        //'assets/images/sarma.png',
                                                        height: MediaQuery.of(context).size.width*0.3,
                                                        width: MediaQuery.of(context).size.width*0.87,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ]),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Row(children: [
                                                Text(
                                                  '${data.docs[index]['name']}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w300,
                                                      color: Colors.black),
                                                )
                                              ]),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Row(
                                                children: [
                                                  const ImageIcon(
                                                    AssetImage(
                                                        "assets/icons/star.png"),
                                                    size: 18,
                                                    color: Color(0xFFFF1744),
                                                  ),
                                                  const SizedBox(
                                                    width: 5.0,
                                                  ),

                                                  StreamBuilder<DocumentSnapshot>(
                                                      stream: FirebaseFirestore.instance
                                                          .collection('users')
                                                          .doc(data.docs[index]['userID'])
                                                          .snapshots(),

                                                      builder: (context, snapshot) {
                                                        if (!snapshot.hasData) {
                                                          return new Text("Loading");
                                                        } else {
                                                          final data = snapshot.requireData;
                                                          return  Text(
                                                            data['name'],
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                color: Colors.black),
                                                          );
                                                        }
                                                      }),

                                                  const SizedBox(
                                                    width: 20.0,
                                                  ),
                                                  const ImageIcon(
                                                    AssetImage(
                                                        "assets/icons/truck.png"),
                                                    size: 18,
                                                    color: Color(0xFFFF1744),
                                                  ),
                                                  const SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Text(
                                                    '${data.docs[index]['service']}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w300,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                );
                              },
                            );
                          },
                        )]),)

                    //HAZIRLAT
                    : SizedBox(
                  height: MediaQuery.of(context).size.height*0.42,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream:FirebaseFirestore.instance.collection('products')
                              .where('userID', isEqualTo: selectedProductUserID)
                              .where(
                              'type', isEqualTo:
                            "Hazırlat"
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
                                return GestureDetector(
                                    onTap: () {

                                      selectedProductName =
                                      "${data.docs[index]['name']}";

                                      selectedProductDescription =
                                      "${data.docs[index]['description']}";

                                      selectedProductUserID =
                                      "${data.docs[index]['userID']}";

                                      selectedProductImage =
                                      "${data.docs[index]['image']}";

                                      Navigator.pushNamed(context, '/productDetailScreen');
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.width*0.5,
                                          width: MediaQuery.of(context).size.width,

                                          //padding: EdgeInsets.only(bottom: 24.0),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(8.0),
                                                      child: Image.network(
                                                        '${data.docs[index]['image']}',
                                                        //'assets/images/sarma.png',
                                                        height: MediaQuery.of(context).size.width*0.3,
                                                        width: MediaQuery.of(context).size.width*0.87,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ]),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Row(children: [
                                                Text(
                                                  '${data.docs[index]['name']}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w300,
                                                      color: Colors.black),
                                                )
                                              ]),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Row(
                                                children: [
                                                  const ImageIcon(
                                                    AssetImage(
                                                        "assets/icons/star.png"),
                                                    size: 18,
                                                    color: Color(0xFFFF1744),
                                                  ),
                                                  const SizedBox(
                                                    width: 5.0,
                                                  ),

                                                  StreamBuilder<DocumentSnapshot>(
                                                      stream: FirebaseFirestore.instance
                                                          .collection('users')
                                                          .doc(data.docs[index]['userID'])
                                                          .snapshots(),

                                                      builder: (context, snapshot) {
                                                        if (!snapshot.hasData) {
                                                          return new Text("Loading");
                                                        } else {
                                                          final data = snapshot.requireData;
                                                          return  Text(
                                                            data['name'],
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                color: Colors.black),
                                                          );
                                                        }
                                                      }),

                                                  const SizedBox(
                                                    width: 20.0,
                                                  ),
                                                  const ImageIcon(
                                                    AssetImage(
                                                        "assets/icons/truck.png"),
                                                    size: 18,
                                                    color: Color(0xFFFF1744),
                                                  ),
                                                  const SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Text(
                                                    '${data.docs[index]['service']}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w300,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                );
                              },
                            );
                          },
                        )]),)
              ],
            ))),
          ),
        ),
      );
}

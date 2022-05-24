import 'package:flutter/material.dart';
import 'package:tiktik/data/modal/Kitchen.dart';

import '../data/modal/Product.dart';
import '../data/modal/User.dart';
import '../data/modal/screenArguments.dart';
import '../widget/profile_widget.dart';
import '../widget/textfield_widget.dart';

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
            title: const Text(
              "Mutfak Detayı",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
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
                  const Text("Selma'nin mutfağı",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left), //mutfak ismi
                  const SizedBox(height: 20),
                  const Text("harika yemekler",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left), //description
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      ImageIcon(
                        AssetImage("assets/icons/star.png"),
                        size: 18,
                        color: Color(0xFFFF1744),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "4.6",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      ImageIcon(
                        AssetImage("assets/icons/truck.png"),
                        size: 18,
                        color: Color(0xFFFF1744),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Gel Al",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      )
                    ],
                  ),
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
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: HazirdaList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context, '/productDetailScreen',
                                    // Screen Arguments class used with navigator.
                                    arguments: ScreenArguments(
                                      dataType: 'product',
                                      data: '0005314',
                                    ),
                                  );

                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    HazirdaList[index]["image"],
                                    //'assets/images/sarma.png',
                                    width: MediaQuery.of(context).size.width * 1,
                                    height:
                                        MediaQuery.of(context).size.width * 0.4,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(children: [
                                Text(
                                  HazirdaList[index]["name"],
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
                                    AssetImage("assets/icons/star.png"),
                                    size: 18,
                                    color: Color(0xFFFF1744),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    HazirdaList[index]["score"],
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  const ImageIcon(
                                    AssetImage("assets/icons/truck.png"),
                                    size: 18,
                                    color: Color(0xFFFF1744),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  const Text(
                                    "Gel Al",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.width * 0.1,
                              ),
                            ],
                          );
                        })

                    //HAZIRLAT
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: HazirlatList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * 0.1,
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    HazirdaList[index]["image"],
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height:
                                        MediaQuery.of(context).size.width * 0.4,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(children: [
                                  Text(
                                    HazirdaList[index]["name"],
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
                                      AssetImage("assets/icons/star.png"),
                                      size: 18,
                                      color: Color(0xFFFF1744),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      HazirdaList[index]["score"],
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    const ImageIcon(
                                      AssetImage("assets/icons/truck.png"),
                                      size: 18,
                                      color: Color(0xFFFF1744),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    const Text(
                                      "Gel Al",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    const ImageIcon(
                                      AssetImage("assets/icons/chef.png"),
                                      size: 18,
                                      color: Color(0xFFFF1744),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      HazirlatList[index]["cooked_by"],
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        })
              ],
            ))),
          ),
        ),
      );
}

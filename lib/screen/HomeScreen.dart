import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // void _openDrawer() {
  //   _scaffoldKey.currentState!.openDrawer();
  // }
  //
  // void _closeDrawer() {
  //   Navigator.of(context).pop();
  // }

  int selectedIndex = 0;
  int hazirda_yada_hazirlat = 0;
  String dropdownvalue = 'Marmara Kampüs';

  // List of items in our dropdown menu (veri tabanından çekilecek)
  var items = [
    'Marmara Kampüs',
    'Ev',
    'Göztepe',
  ];

  List users = [" Selam Neval"];
  List tabs = ["HAZIRDA", "HAZIRLAT"];

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
      "cooked_by": "Ayşe'nin mutfağı"
    },
    {
      "image": "assets/images/mercimekköftesi.png",
      "name": "Mercimek Köftesi ",
      "score": "4.6",
      "cooked_by": "Murat'ın mutfağı"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,

      //appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          width: 48,
        ),
        leading: Container(),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 25, top: 10),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              radius: 25,
            ),
          ),
        ],
      ),
// drawer: NavigationDrawer(),
      //body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //il satır: menü, gönderim adresi, profil resmi
                const SizedBox(height: 15.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Merhaba Emine,", //veritabanından çekilecek
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black))
                    ])),
                    Column(children: [
                      const Text(
                        "Gönderim Adresi",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.redAccent),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: SizedBox(
                          height: 20.0,
                          child: DropdownButton(
                            // Initial Value
                            value: dropdownvalue,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 18,
                            underline:
                                DropdownButtonHideUnderline(child: Container()),
                            isExpanded: false,

                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              );
                            }).toList(),

                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
                //search
                const SizedBox(height: 25.0),
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

                if (hazirda_yada_hazirlat == 0)
                  Column(children: [
                    Row(
                      children: const [
                        Text("Hazırda Bekleyen Lezzetler",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w200,
                                color: Colors.black)),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: HazirdaList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ClipRRect(
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
                  ])
                else
                  Column(children: [
                    Row(
                      children: const [
                        Text("Sevdiğin Lezzetleri Sipariş Ver",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w200,
                                color: Colors.black)),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: HazirlatList.length,
                        padding: const EdgeInsets.only(bottom: 20),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  HazirdaList[index]["image"],
                                  width: MediaQuery.of(context).size.width * 1,
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
                                  )
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.width * 0.1,
                              ),
                            ],
                          );
                        })
                  ])
              ],
            ),
          ),
        ),
      ),

      //bottom navigation bar
    );
  }
}

// class NavigationDrawer extends StatelessWidget {
//   const NavigationDrawer({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             buildHeader(context),
//             buildMenuItems(context),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildHeader(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.only(
//           left: 20.0, top: 40 + MediaQuery.of(context).padding.top, bottom: 40),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               const CircleAvatar(
//                 backgroundImage: AssetImage('assets/images/avatar.png'),
//                 radius: 35,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 30.0),
//                 child: Column(
//                   children: const [
//                     Text(
//                       "Derin Deniz",
//                       style: TextStyle(fontSize: 20.0, color: Colors.black),
//                     ),
//                     Text(
//                       "aşçı",
//                       style: TextStyle(fontSize: 15.0, color: Colors.black),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 20.0,
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget buildMenuItems(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//             height: 200.0,
//             width: 270.0,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.0),
//                 color: const Color(0xFFEEEEEE)),
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               ListTile(
//                 leading: const CircleAvatar(
//                   child: ImageIcon(
//                     AssetImage("assets/icons/personalinfo.png"),
//                     size: 20,
//                     color: Color(0xFFFF1744),
//                   ),
//                   backgroundColor: Colors.white,
//                   radius: 20.0,
//                 ),
//                 title: const Text('Kişisel Bilgiler'),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: const CircleAvatar(
//                   child: ImageIcon(
//                     AssetImage("assets/icons/map.png"),
//                     size: 20,
//                     color: Color(0xFFFF1744),
//                   ),
//                   backgroundColor: Colors.white,
//                   radius: 20.0,
//                 ),
//                 title: const Text('Adreslerim'),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: const CircleAvatar(
//                   child: ImageIcon(
//                     AssetImage("assets/icons/settings.png"),
//                     size: 20,
//                     color: Color(0xFFFF1744),
//                   ),
//                   backgroundColor: Colors.white,
//                   radius: 20.0,
//                 ),
//                 title: const Text('Ayarlar'),
//                 onTap: () {},
//               )
//             ])),
//         const SizedBox(
//           height: 50.0,
//         ),
//         ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//                 primary: Colors.redAccent[400],
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0)),
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 85.0, vertical: 15.0)),
//             child: const Text(
//               "MUTFAK AÇ",
//               style: TextStyle(fontSize: 18.0, color: Colors.white),
//             ))
//       ],
//     );
//   }
// }

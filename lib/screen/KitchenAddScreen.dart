import 'package:tiktik/services/storage_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tiktik/data/modal/Kitchen.dart';

import '../data/modal/User.dart';
import '../main.dart';
import '../services/storage_service.dart';
import '../widget/profile_widget.dart';
import '../widget/textfield_widget.dart';
import 'HomeScreen.dart';


String kitchenName ="";
String kitchenAbout ="";
String kitchenMeals ="";

class KitchenAddScreen extends StatefulWidget {
  const KitchenAddScreen({Key? key}) : super(key: key);

  @override
  _KitchenAddScreenState createState() => _KitchenAddScreenState();
}


class _KitchenAddScreenState extends State<KitchenAddScreen> {


  final TextEditingController _kitchenNameController = TextEditingController();
  final TextEditingController _kitchenAboutController = TextEditingController();


  Kitchen kitchen = Kitchen(
    KitchenID: "KitchenID",
    UserID: "UserID",
    KitchenName: "Selma'nin Mutfağı",
    Point: "Point",
    ProductList: "Zeytinyağlı Yaprak Sarma",
    CoverPhoto:
        "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj",
  );
  User user = const User(
      userID: "userID",
      mailAddress: "mailAddress",
      password: "password",
      firstName: "firstName",
      lastName: "lastName",
      birthDate: "birthDate",
      biography:
          "Özenle yapılan el emeği ürünleri... Siparişlerinizi bekliyorum.",
      photo:
          "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj",
      address: "address");

  void _addKitchen() async {
    final docUser =
    FirebaseFirestore.instance.collection('users').doc(currentUserID);

    var json = {
      'kitchenName': '',
      'kitchenAbout': '',
      'kitchenMeals': '',
      'hasKitchen': 1,
      'kitchenImage': '',
    };

    json['kitchenName'] = _kitchenNameController.text;
    json['kitchenImage'] = currentImageURL;
    json['kitchenAbout'] = _kitchenAboutController.text;


    currentImageURL = "";
    await docUser.update(json);

    Navigator.pushNamed(
      context,
      '/navigationPage',
    );
  }
  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "Mutfak Ekle",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            elevation: 0.0,
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
              children: [


                StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(currentUserID)
                        .snapshots(),

                    builder: (context, snapshot) {
                      final Storage storage = Storage();

                      if (!snapshot.hasData) {
                        return new Text("Loading");
                      } else {
                        final data = snapshot.requireData;
                        return GestureDetector(
                            child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(8.0),
                                    child: Image.network(
                                      (currentImageURL == "") ? "http://www.gergitavan.com/wp-content/uploads/2017/07/default-placeholder-1024x1024-570x321.png" : currentImageURL,
                                      //'assets/images/sarma.png',
                                      height: MediaQuery.of(context).size.width*0.3,
                                      width: MediaQuery.of(context).size.width*0.87,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ]),
                            onTap: () async {
                              final results = await FilePicker.platform.pickFiles(
                                allowMultiple: false,
                                type: FileType.custom,
                                allowedExtensions: ['png', 'jpg', 'jpeg'],
                              );

                              if (results == null) {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('görsel seçilmedi')));
                              }

                              final path = results?.files.single.path;
                              final fileName = results?.files.single.name;

                              storage.uploadProductFile(path!, fileName!)
                                  .then((value) => print('Done'));



                              print(path);
                              print(fileName);
                            }
                        );
                      }
                    }),


                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _kitchenNameController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Mutfak adını giriniz...",
                          label: Text("Mutfak Adı:"),
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Lütfen mutfak adını giriniz";
                        }
                        return null;
                      },
                    ),
                  ),
                ),


                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _kitchenAboutController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Mutfak hakkında...",
                          label: Text("Mutfak Hakkında"),
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Lütfen mutfak hakkında giriniz";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    _addKitchen();
                    selectedProductUserID = currentUserID!;
                    Navigator.pushNamed(context, '/navigationPage');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    child: const Center(
                      child: Text(
                        "MUTFAK EKLE",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ))),
          ),
        ),
      );
}

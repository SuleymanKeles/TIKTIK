import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tiktik/data/modal/Kitchen.dart';

import '../data/modal/User.dart';
import '../main.dart';
import '../widget/profile_widget.dart';
import '../widget/textfield_widget.dart';


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
    };

    json['kitchenName'] = _kitchenNameController.text;
    json['kitchenAbout'] = _kitchenAboutController.text;

    await docUser.update(json);
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
                ProfileWidget(
                  imagePath: "assets/images/mutfak.png",
                  isEdit: true,
                  onClicked: () async {},
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
                    Navigator.pushNamed(context, '/kitchenDetailScreen');
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

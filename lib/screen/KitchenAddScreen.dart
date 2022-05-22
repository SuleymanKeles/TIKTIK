import 'package:flutter/material.dart';
import 'package:tiktik/data/modal/Kitchen.dart';

import '../data/modal/User.dart';
import '../widget/profile_widget.dart';
import '../widget/textfield_widget.dart';

class KitchenAddScreen extends StatefulWidget {
  const KitchenAddScreen({Key? key}) : super(key: key);

  @override
  _KitchenAddScreenState createState() => _KitchenAddScreenState();
}

class _KitchenAddScreenState extends State<KitchenAddScreen> {
  Kitchen kitchen = Kitchen(
    KitchenID: "KitchenID",
    UserID: "UserID",
    KitchenName: "Ayşe'nin Mutfağı",
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
      biography: "Özenle yapılan el emeği ürünleri... Siparişlerinizi bekliyorum.",
      photo:
      "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj",
      address: "address");

  @override
  Widget build(BuildContext context) => Builder(
    builder: (context) => Scaffold(
      appBar: AppBar(title: const Text("Mutfak Ekle",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
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
            TextFieldWidget(
              label: 'MUTFAK ADI',
              text: "",
              onChanged: (name) {},
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              label: 'HAKKINDA',
              text: "",
              onChanged: (email) {},
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              label: 'YEMEKLER',
              text: "",
              maxLines: 3,
              onChanged: (about) {},
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              child: Container(
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
          )
          )
        ),
      ),
    ),
  );
}

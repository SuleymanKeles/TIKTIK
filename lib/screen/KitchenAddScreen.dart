import 'package:flutter/material.dart';
import 'package:tiktik/data/modal/Kitchen.dart';
import 'package:tiktik/style/Theme.dart';

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
    KitchenName: "KitchenName",
    Point: "Point",
    ProductList: "ProductList",
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
      biography: "biography",
      photo:
      "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj",
      address: "address");

  @override
  Widget build(BuildContext context) => Builder(
    builder: (context) => Scaffold(
      appBar: AppBar(title: const Text("Edit Kitchen Profile")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: kitchen.CoverPhoto,
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Kitchen Name',
            text: kitchen.KitchenName,
            onChanged: (name) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Biyografi',
            text: user.biography,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'ürünler',
            text: kitchen.ProductList,
            maxLines: 5,
            onChanged: (about) {},
          ),
          const SizedBox(height: 24),
          MaterialButton(
            onPressed: () {},
            child: const Text(
              "Ürün Ekle",
              style: TextStyle(color: Colors.white),
            ),
            color: MyThemes.primaryColor,
          )
        ],
      ),
    ),
  );
}

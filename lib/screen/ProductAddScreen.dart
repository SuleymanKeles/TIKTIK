import 'package:flutter/material.dart';
import 'package:tiktik/data/modal/Kitchen.dart';
import 'package:tiktik/data/modal/Product.dart';
import 'package:tiktik/style/Theme.dart';

import '../data/modal/User.dart';
import '../widget/profile_widget.dart';
import '../widget/textfield_widget.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({Key? key}) : super(key: key);

  @override
  _ProductAddScreenState createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  Product product = Product(
    ProductID: "ProductID",
    Name: "Name",
    Price: "Price",
    Category: "Category",
    Description: "Description",
    Label: "Label",
    Photo:
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
                imagePath: product.Photo,
                isEdit: true,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Kitchen Name',
                text: product.Name,
                onChanged: (name) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Biyografi',
                text: product.Description,
                onChanged: (email) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'ürünler',
                text: product.Description,
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

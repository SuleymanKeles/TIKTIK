import 'package:flutter/material.dart';
import 'package:tiktik/data/modal/Kitchen.dart';
import 'package:tiktik/data/modal/Product.dart';
import 'package:tiktik/style/Theme.dart';

import '../data/modal/User.dart';
import '../widget/profile_widget.dart';
import '../widget/textfield_widget.dart';

class ProductEditScreen extends StatefulWidget {
  const ProductEditScreen({Key? key}) : super(key: key);

  @override
  _ProductEditScreenState createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  Product product = Product(
    ProductID: "ProductID",
    Name: "Mercimek Köftesi",
    Price: "30.0",
    Category: "Atıştırmalık",
    Description: "Bir porsiyonda 10 tane bulunmaktadır.",
    ServiceType: "Gel-Al",
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
      appBar: AppBar(title: const Text("Ürünü Düzenle ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileWidget(
                      imagePath: "assets/images/mercimekköftesi.png",
                      isEdit: true,
                      onClicked: () async {},
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      label: 'ÜRÜN ADI',
                      text: product.Name,
                      onChanged: (name) {},
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      label: 'KATEGORİ',
                      text: product.Category,
                      onChanged: (email) {},
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      label: 'AÇIKLAMA',
                      text: product.Description,
                      maxLines: 3,
                      onChanged: (about) {},
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      label: 'SERVİS TİPİ',
                      text: product.ServiceType,
                      onChanged: (about) {},
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      label: 'ÜCRET',
                      text: product.Price,
                      onChanged: (about) {},
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent[400],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 145.0, vertical: 15.0)),
                        child: const Text(
                          "KAYDET",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ))
                  ],
                )
            )
        ),
      ),
    ),
  );
}

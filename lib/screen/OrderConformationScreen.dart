import 'package:flutter/material.dart';

import 'package:tiktik/data/modal/Product.dart';
import 'package:tiktik/data/modal/User.dart';

class OrderConformationScreen extends StatefulWidget {
  const OrderConformationScreen({Key? key}) : super(key: key);

  @override
  _OrderConformationScreenState createState() =>
      _OrderConformationScreenState();
}

class _OrderConformationScreenState extends State<OrderConformationScreen> {
  Product product = Product(
    ProductID: "ProductID",
    Name: "Product Name",
    Price: "Price",
    Category: "Category",
    Description: "Description",
    Label: "Label",
    ServiceType: "Gel-Al",
    Photo:
        "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj",
  );
  User user = User(
    userID: "userID",
    mailAddress: "mailAddress",
    password: "password",
    firstName: "firstName",
    lastName: "lastName",
    birthDate: "birthDate",
    biography: "biography",
    photo: "photo",
    address: "address",
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("OrderConformationScreen Detail Screen"),
            ),
            body: Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              child: Column(
                children: [
                  Image.network(
                    product.Photo,
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ListTile(
                    title: Text(product.Name),
                    subtitle: Text("Price: ${product.Price}"),
                  ),
                  Text(
                      "${user.firstName} & ${product.Name} Şipariş tamamlandı.")
                ],
              ),
            )));
  }
}

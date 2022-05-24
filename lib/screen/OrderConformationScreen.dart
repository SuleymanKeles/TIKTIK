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
    Name: "Zeytın Yağlı Sarma",
    Price: "50 TL",
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
    firstName: "Fatma Demir",
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
          title: const Text("Sipariş Tamamlandı"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/icons/greeting.png'),
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Text(
                    product.Name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Price: ${product.Price}"),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Text("${user.firstName} & ${product.Name} Şipariş tamamlandı."),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
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
                      "TAMAM",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

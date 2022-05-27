import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tiktik/data/modal/Kitchen.dart';
import 'package:tiktik/data/modal/Product.dart';
import 'package:tiktik/style/Theme.dart';

import '../data/modal/User.dart';
import '../main.dart';
import '../widget/profile_widget.dart';
import '../widget/textfield_widget.dart';

String dropdownValue = "Hazırda";
String dropdownValue2 = "Adrese Teslim";

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({Key? key}) : super(key: key);

  @override
  _ProductAddScreenState createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {



  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController = TextEditingController();
  final TextEditingController _productServiceController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();



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
          appBar: AppBar(
            title: const Text(
              "Ürün Ekle ",
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
                  imagePath: "assets/images/mercimekköftesi.png",
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
                      controller: _productNameController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Ürünün adını giriniz...",
                          label: Text("Ürün Adı:"),
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Lütfen ürün adı giriniz";
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
                      controller: _productDescriptionController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Ürünün açıklamasını giriniz...",
                          label: Text("Ürün Açıklaması:"),
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Lütfen ürün açıklaması giriniz";
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
                      keyboardType: TextInputType.number,
                      controller: _productPriceController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Ürünün ücretini giriniz...",
                          label: Text("Ücret:"),
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Lütfen ücret giriniz";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [const Text(
                    "Ürün Tipi:    ",
                    style: TextStyle(fontSize: 17),
                  ),
                    Align(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.redAccent),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Hazırda',
                            'Hazırlat',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 17),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      alignment: Alignment.centerRight,
                    ),],
                ),
                Row(
                  children: [const Text(
                    "Servis Tipi:    ",
                    style: TextStyle(fontSize: 17),
                  ),
                    Align(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue2,
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.redAccent),
                          underline: Container(
                            height: 2,
                            color: Colors.teal,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                            });
                          },
                          items: <String>[
                            'Gel Al',
                            'Adrese Teslim',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 17),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      alignment: Alignment.centerRight,
                    ),],
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () async {
                    final docProduct =
                    FirebaseFirestore.instance.collection('products').doc("$currentUserID-${DateTime.now()}");

                    var json = {
                      'date': new DateTime.now(),
                      'description': '',
                      'image':
                      'https://firebasestorage.googleapis.com/v0/b/tiktik-7f7e3.appspot.com/o/images%2Fdefault.jpg?alt=media&token=fde7c081-12d5-4781-ab9c-05226dced8a6',
                      'name': '',
                      'userID': '',
                      'score': 0,
                      'price': -1,
                      'service': '',
                      'type': ''
                    };

                    json['userID'] = currentUserID.toString();
                    json['price'] = int.parse(_productPriceController.text);
                    json['name'] = _productNameController.text;
                    json['description'] = _productDescriptionController.text;
                    json['service'] = dropdownValue2;
                    json['type'] = dropdownValue;

                    await docProduct.set(json);
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
                        "EKLE",
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

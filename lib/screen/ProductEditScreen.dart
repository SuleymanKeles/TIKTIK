

import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktik/screen/HomeScreen.dart';
import 'package:tiktik/services/storage_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
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

class ProductEditScreen extends StatefulWidget {

  const ProductEditScreen({Key? key}) : super(key: key);

  @override
  _ProductEditScreenState createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {

  TextEditingController _productNameController = TextEditingController();
   TextEditingController _productDescriptionController = TextEditingController();
   TextEditingController _productServiceController = TextEditingController();
   TextEditingController _productPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _productNameController = new TextEditingController(text: selectedProductName);
    _productDescriptionController = new TextEditingController(text: selectedProductDescription);
    _productPriceController = new TextEditingController(text: selectedProductPrice);
    dropdownValue2 = selectedProductService;
    dropdownValue = selectedProductType;
  }



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
          "Ürün Düzenle",
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
                                          (currentImageURL == "") ? selectedProductImage : currentImageURL,
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
                        FirebaseFirestore.instance.collection('products').doc("$selectedProductID");
                        var json = {
                          'description': '',
                          'image': '',
                          'name': '',
                          'price': -1,
                          'service': '',
                          'type': ''
                        };

                        json['price'] = int.parse(_productPriceController.text);
                        json['name'] = _productNameController.text;
                        json['description'] = _productDescriptionController.text;
                        json['service'] = dropdownValue2;
                        json['type'] = dropdownValue;
                        json['image'] = (currentImageURL == "") ? selectedProductImage : currentImageURL;

                        currentImageURL = "";

                        await docProduct.update(json);

                        Navigator.pushNamed(
                          context,
                          '/navigationPage',
                        );
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
                            "DÜZENLE",
                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: () async {
                        final docProduct =
                        FirebaseFirestore.instance.collection('products').doc("$selectedProductID");
                        var json = {
                          'active': '0',
                        };


                        currentImageURL = "";

                        await docProduct.update(json);

                        Navigator.pushNamed(
                          context,
                          '/navigationPage',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50,
                        child: const Center(
                          child: Text(
                            "Ürünü kaldır",
                            style: TextStyle(fontSize: 18.0, color: Colors.redAccent),
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

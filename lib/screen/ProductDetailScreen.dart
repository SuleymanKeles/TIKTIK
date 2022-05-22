import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktik/StyleProvider.dart';

import '../profileWidget.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Ürün Düzenle",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Ink.image(
                      image: AssetImage('assets/images/mercimekköftesi.png'),
                      fit: BoxFit.fill,
                      width: 350.0,
                      height: 160.0,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    SizedBox(width: 6),
                    Icon(Icons.star_border, color: mainColor, size: 30.0),
                    SizedBox(width: 5),
                    Text('1'),
                    SizedBox(width: 40),
                    Icon(Icons.directions_car_filled,
                        color: mainColor, size: 30.0),
                    SizedBox(width: 5),
                    Text('Ücretsiz'),
                    SizedBox(width: 40),
                    Icon(Icons.access_time, color: mainColor, size: 30.0),
                    SizedBox(width: 5),
                    Text('20 dk')
                  ],
                ),
                const SizedBox(height: 10),
                Row(children: const <Widget>[
                  SizedBox(width: 6),
                  Text(
                      "                    "
                      "                    "
                      "                       "
                      "                       "
                      "      ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.lineThrough,
                      ),
                      textAlign: TextAlign.start),
                ]),
                Row(
                  children: const <Widget>[
                    SizedBox(width: 6),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      radius: 25,
                    ),
                    SizedBox(width: 15),
                    Text('Sena\'nın Mutfağı ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Ubuntu")),
                    SizedBox(width: 90),
                    Icon(
                      Icons.chevron_right,
                    )
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  children: const <Widget>[
                    SizedBox(width: 6),
                    Text('Mercimek Köftesi',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Ubuntu"))
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: const <Widget>[
                    SizedBox(width: 20),
                    Text(
                        'Geleneksel bir lezzet olan mercimek\n köftesi '
                        'geçmişten günümüze\n lezzetini \nkorumaya '
                        'devam ediyor.Gelenek\nsel bir lezzet olan mercimek\n köftesi ',
                        style: TextStyle(fontSize: 15))
                  ],
                ),
                const SizedBox(height: 30),
                Row(children: <Widget>[
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 110.0, vertical: 15.0)),
                      child: const Text(
                        "SOHBETE BAŞLA",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ))
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

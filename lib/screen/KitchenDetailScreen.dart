import 'package:flutter/material.dart';
import 'package:tiktik/data/modal/Kitchen.dart';

import '../data/modal/Product.dart';
import '../data/modal/User.dart';

class KitchenDetailScreen extends StatefulWidget {
  const KitchenDetailScreen({Key? key}) : super(key: key);

  @override
  _KitchenDetailScreenState createState() => _KitchenDetailScreenState();
}

class _KitchenDetailScreenState extends State<KitchenDetailScreen>
      {

  @override
  Widget build(BuildContext context) {
    Kitchen kitchen = Kitchen(
        KitchenID: "KitchenID",
        UserID: "UserID",
        KitchenName: "KitchenName",
        Point: "Point",
        ProductList: "ProductList",
        CoverPhoto:
            "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj");
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
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * 0.35,
                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    tabs: <Tab>[
                      Tab(text: 'Hazirda'),
                      Tab(text: 'Hazirlat'),
                    ],
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    centerTitle: true,
                    background: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Image.network(
                            kitchen.CoverPhoto,
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          ListTile(
                            title: Text(kitchen.KitchenName),
                            subtitle: Column(
                              children: [
                                Text(user.biography),
                                Row(
                                  children: [
                                    Text("Yildiz ${kitchen.Point}"),
                                    Text("Gel al ???????"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    // Burasi Future builder ile data cekildiginde snapshot ile datanin baglanacagi kisma bir ornek/
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
                    Key key = Key(index.toString());
                    return buildListTileProduct(context, key, index, product);
                  },
                ),
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    // Burasi Future builder ile data cekildiginde snapshot ile datanin baglanacagi kisma bir ornek/
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
                    Key key = Key(index.toString());
                    return buildListTileProduct(context, key, index, product);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildListTileProduct(
      BuildContext context, Key key, int index, Product product) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
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
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tiktik/data/modal/Product.dart';
import 'package:tiktik/data/modal/User.dart';
import 'package:tiktik/screen/EditUserScreen.dart';

import '../widget/numbers_widget.dart';
import '../widget/profile_widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text("User Profile")),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.photo,
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditUserScreen()),
                );
              },
            ),
            const SizedBox(height: 24),
            buildName(user),
            const SizedBox(height: 24),
            NumbersWidget(),
            const SizedBox(height: 48),
            buildAbout(user),

          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.firstName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.mailAddress,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.biography,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );


}

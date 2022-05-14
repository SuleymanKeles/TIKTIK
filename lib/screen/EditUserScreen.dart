

import 'package:flutter/material.dart';

import '../data/modal/User.dart';
import '../widget/profile_widget.dart';
import '../widget/textfield_widget.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({Key? key}) : super(key: key);

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  User user = const User(userID: "userID",
      mailAddress: "mailAddress",
      password: "password",
      firstName: "firstName",
      lastName: "lastName",
      birthDate: "birthDate",
      biography: "biography",
      photo: "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj",
      address: "address");

  @override
  Widget build(BuildContext context) =>
    Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text("Edit User Profile")),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.photo,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.firstName,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.mailAddress,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.biography,
              maxLines: 5,
              onChanged: (about) {},
            ),
          ],
        ),
      ),
    );
}
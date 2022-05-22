
import 'package:flutter/material.dart';
import 'package:tiktik/StyleProvider.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = mainColor;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: -1,
            right: -2,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    ///TODO kullanıcının resmi firestora yüklemesini sağlamak gerekiyor
   // final image = NetworkImage(imagePath);
    final image =AssetImage(imagePath);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 70,
          height: 70,
          //child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: color,
      all: 8,
      ///todo: add functionality to the icon
      child: Icon(
        ( isEdit) ? Icons.add_a_photo : Icons.edit,
        color: Colors.white,
        size: 6,
      ),
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
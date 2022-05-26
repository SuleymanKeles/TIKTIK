import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'round_image.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;

class UserImage extends StatefulWidget {
  final Function(String imageUrl) onFileChanged;

  UserImage({required this.onFileChanged});

  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  final ImagePicker _picker = ImagePicker();

  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imageUrl == null)
          const Icon(
            Icons.image,
            size: 60,
          ),
        if (imageUrl != null)
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => _selectPhoto(),
            child: AppRoundImage.url(
              imageUrl!,
              width: 80,
              height: 80,
            ),
          ),
        InkWell(
          onTap: () => _selectPhoto(),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              imageUrl != null ? "fotograf degistir" : "fotograf sec",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.pink,
              ),
            ),
          ),
        )
      ],
    );
  }

  Future _selectPhoto() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
        onClosing: () {},
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text("Kamera"),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(
                  ImageSource.camera,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.filter),
              title: Text("Resim Seç"),
              onTap: () {
                _pickImage(
                  ImageSource.gallery,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future _pickImage(ImageSource source) async {
    final pickedFile =
        await _picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile == null) {
      return;
    }
    var file = await ImageCropper.platform.cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(
        ratioX: 1,
        ratioY: 1,
      ),
    );

    if (file == null) {
      return;
    }
    // TODO: Buraya bak
    // file = (await compressImage(file.path, 35)) as CroppedFile?;

    await _uploadFile(file.path);
  }

  Future _uploadFile(String path) async {
    // TODO: Upload kismini bilmiyorum
    gs: //tiktik-7f7e3.appspot.com/images
    final ref = storage.FirebaseStorage.instance
        .ref()
        .child('images')
        .child(DateTime.now().toIso8601String() + p.basename(path));

    final result = await ref.putFile(File(path));
    final fileUrl = await result.ref.getDownloadURL();

    setState(() {
      imageUrl = fileUrl;
    });

    widget.onFileChanged(fileUrl);
  }

  Future<File> compressImage(String path, int quality) async {
    final newPath = p.join(
      (await getTemporaryDirectory()).path,
      '${DateTime.now()}.${p.extension(path)}',
    );
    final result = await FlutterImageCompress.compressAndGetFile(
      path,
      newPath,
      quality: quality,
    );

    return result!;
  }
}

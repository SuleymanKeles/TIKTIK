import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tiktik/screen/MessagingScreen.dart';

import '../data/modal/Message.dart';

class MessagingBoxScreen extends StatefulWidget {
  const MessagingBoxScreen({Key? key}) : super(key: key);

  @override
  _MessagingBoxScreenState createState() => _MessagingBoxScreenState();
}

class _MessagingBoxScreenState extends State<MessagingBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(

              tabs: [
                Tab(child: Text("Devam Eden",style: TextStyle(color: Colors.black),)),
                Tab(child: Text("Geçmiş",style: TextStyle(color: Colors.black),)),
              ],
            ),
            title: const Text('Mesaj kutusu'),

          ),
          body: TabBarView(
            children: [
              ListView.separated(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  // Burasi Future builder ile data cekildiginde snapshot ile datanin baglanacagi kisma bir ornek/
                  Message message = new Message();

                  Key key = Key(index.toString());
                  return buildListTileMessage(context, key, index, message);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
              ListView.separated(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  // Burasi Future builder ile data cekildiginde snapshot ile datanin baglanacagi kisma bir ornek/
                  Message message = new Message();

                  Key key = Key(index.toString());
                  return buildListTileMessage(context, key, index, message);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ],
          ),
        ),
      );
  }

  ListTile buildListTileMessage(
      BuildContext context, Key key, int index, Message message) {
    return ListTile(
      leading: Image.network(
          'https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj'),
      trailing: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MessagingScreen(key: key)),
          );
        },
        icon: const Icon(Icons.arrow_forward_ios),
      ),
      title: Text(
        "Mutfak ismi gelecek key#$index",
      ),
      subtitle: Text(
        "devam etme durumu key#$index",
      ),
      minVerticalPadding: 4,
    );
  }
}

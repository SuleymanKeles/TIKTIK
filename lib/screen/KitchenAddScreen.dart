import 'package:flutter/material.dart';

class KitchenAddScreen extends StatefulWidget {
  const KitchenAddScreen({Key? key}) : super(key: key);

  @override
  _KitchenAddScreenState createState() => _KitchenAddScreenState();
}

class _KitchenAddScreenState extends State<KitchenAddScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Kitchen Screen"),
          ),
          body: const Center(child: Text("Kitchen Screen")),
        ));
  }
}

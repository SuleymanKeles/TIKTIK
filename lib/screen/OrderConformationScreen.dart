import 'package:flutter/material.dart';

class OrderConformationScreen extends StatefulWidget {
  const OrderConformationScreen({Key? key}) : super(key: key);

  @override
  _OrderConformationScreenState createState() => _OrderConformationScreenState();
}

class _OrderConformationScreenState extends State<OrderConformationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("OrderConformationScreen Detail Screen"),
          ),
          body: const Center(child: Text("OrderConformationScreen Detail Screen")),
        ));
  }
}

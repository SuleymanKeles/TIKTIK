import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Messaging Screen"),
      ),
      body: Column(
        children: [
          Center(
            child: MaterialButton(
                child: Text("Go to Navigation Page"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/navigationPage');
                }),
          ),
          Center(
            child: MaterialButton(
                child: const Text("Go to kitchenAddScreen Page"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/kitchenAddScreen');
                }),
          ),
          Center(
            child: MaterialButton(
                child: const Text("Go to kitchenDetailScreen Page"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/kitchenDetailScreen');
                }),
          ),
          Center(
            child: MaterialButton(
                child: const Text("Go to kitchenEditScreen Page"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/kitchenEditScreen');
                }),
          ),
          Center(
            child: MaterialButton(
                child: const Text("Go to messagingScreen Page"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/messagingScreen');
                }),
          ),
          Center(
            child: MaterialButton(
                child: const Text("Go to orderConformationScreen Page"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/orderConformationScreen');
                }),
          ),
          Center(
            child: MaterialButton(
                child: const Text("Go to productDetailScreen Page"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/productDetailScreen');
                }),
          ),
          Center(
            child: MaterialButton(
                child: const Text("Go to productAddScreen Page"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/productAddScreen');
                }),
          ),
          Center(
            child: MaterialButton(
                child: const Text("Go to productEditScreen Page"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/productEditScreen');
                }),
          ),
          Center(
            child: MaterialButton(
                child: const Text("Go to signIn Page"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/sign');
                }),
          ),
          Center(
            child: MaterialButton(
                child: const Text("Go to userProfileScreen Page"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/userProfileScreen');
                }),
          ),
          const Center(child: Text("Messaging Screen")),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';

class MessagingScreen extends StatefulWidget {
  const MessagingScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  bool _isEnable = true;

  void _setIsEneble(bool isEnable) {
    setState(() {
      debugPrint(_isEnable.toString());
      _isEnable = isEnable;
      debugPrint(_isEnable.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Izzet Kavak",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w700)),
                  TextSpan(text: "\n"),
                  TextSpan(
                      text: "Devam ediyor...",
                      style: TextStyle(fontSize: 11, color: Colors.black)),
                ]),
              ),
            ),
            floatingActionButton: Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.1),
              child: AnimatedOpacity(
                opacity: _isEnable ? 0.0 : 1.0,
                duration: Duration(milliseconds: 1000),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/orderConformationScreen',
                    );

                    _setIsEneble(true);
                  },
                  label: const Text("Şiparişi Tamamla"),
                  icon: const Icon(Icons.check),
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.8),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(1),
                                      spreadRadius: 0.1,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy "),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.8),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(1),
                                      spreadRadius: 0.1,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Text(
                                "text ever since the 1500s, when an unknown printer took a galley",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.8),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(1),
                                      spreadRadius: 0.1,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Text(
                                  "of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic"),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.8),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(1),
                                      spreadRadius: 0.1,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Text(
                                "text ever since the 1500s, when an unknown printer took a galley",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.8),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(1),
                                      spreadRadius: 0.1,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Text(
                                  "of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic"),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.8),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(1),
                                      spreadRadius: 0.1,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Text(
                                "text ever since the 1500s, when an unknown printer took a galley",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.8),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(1),
                                      spreadRadius: 0.1,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Text(
                                  "of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic"),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 70,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Bir mesaj gönderin."),
                      )),
                      IconButton(
                        onPressed: () {
                          _setIsEneble(false);

                          debugPrint(_isEnable.toString());
                        },
                        icon: Icon(Icons.send),
                        color: Colors.redAccent,
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}

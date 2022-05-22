import 'package:flutter/material.dart';
import 'package:tiktik/screen/HomeScreen.dart';
import 'package:tiktik/screen/MessagingBoxScreen.dart';
import 'package:tiktik/screen/UserProfileScreen.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MessagingBoxScreen(),
    HomeScreen(),
    UserProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        color: Colors.white,
        child: BottomNavigationBar(
            elevation: 0.0,
            selectedItemColor: Colors.redAccent,
            unselectedItemColor: Colors.black,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/envelope.png"),
                    size: 24,
                  ),
                  label: 'Mesajlar'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/home.png"),
                    size: 24,
                  ),
                  label: 'Ana Sayfa'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/user.png"),
                    size: 24,
                  ),
                  label: 'Profil'),
            ]),
      ),
    );
  }
}

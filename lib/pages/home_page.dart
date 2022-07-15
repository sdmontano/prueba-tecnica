import 'package:flutter/material.dart';
import 'package:prueba_tecnica/pages/post_page.dart';
import 'package:prueba_tecnica/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final screens = [
    ProfilePage(),
    PostPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orangeAccent,
        currentIndex: index,
        onTap: (i) => setState(() {
          index = i;
        }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'music')
        ],
      ),
      body: screens[index],
    );
  }
}

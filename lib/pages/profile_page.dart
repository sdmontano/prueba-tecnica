import 'package:flutter/material.dart';
import 'package:prueba_tecnica/widgets/appbar.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListTile(title: Text('Close Session')),
      ),
      appBar: NewAppBar(titl: 'Profile'),
      body: Center(child: Text('Profile Page')),
    );
  }
}

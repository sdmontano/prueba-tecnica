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
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                radius: 70,
                backgroundImage:
                    AssetImage('assets/default-profile-icon-6.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Text('Juanito Antonio')
          ],
        ),
      ),
    );
  }
}

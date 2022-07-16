import 'package:flutter/material.dart';
import 'package:prueba_tecnica/widgets/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Page to show the name of the current user

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key? key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences logindata;
  late String? email = '';

  void initialData() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      email = logindata.getString('email');
    });
  }

  @override
  void initState() {
    super.initState();
    initialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text('$email')
          ],
        ),
      ),
    );
  }
}

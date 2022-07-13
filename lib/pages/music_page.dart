import 'package:flutter/material.dart';
import 'package:prueba_tecnica/widgets/appbar.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListTile(title: Text('Close Session')),
      ),
      appBar: NewAppBar(titl: 'Music'),
      body: Center(
        child: Text('Music Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

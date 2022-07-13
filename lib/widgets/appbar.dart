import 'package:flutter/material.dart';

class NewAppBar extends StatelessWidget implements PreferredSizeWidget {
  String titl;
  NewAppBar({required this.titl});
  @override
  Size get preferredSize => Size.fromHeight(60);

  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titl),
      iconTheme: IconThemeData(color: Colors.black87),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.black87),
    );
  }
}

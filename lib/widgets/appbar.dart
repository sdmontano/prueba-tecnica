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
      actions: [
        PopupMenuButton<int>(
            icon: Icon(Icons.menu),
            itemBuilder: (context) => [
                  // popupmenu item 1
                  PopupMenuItem(
                    value: 1,
                    // row has two child icon and text.
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          // sized box with width 10
                          width: 10,
                        ),
                        Text("Log out")
                      ],
                    ),
                  ),
                ]),
      ],
    );
  }
}

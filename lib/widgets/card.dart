import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  VoidCallback ontap;
  String title;
  String body;
  Cards({required this.title, required this.body, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(body),
          trailing: GestureDetector(
            onTap: ontap,
            child: Icon(
              Icons.delete,
              color: Colors.orangeAccent,
            ),
          ),
        ),
      ),
    );
  }
}

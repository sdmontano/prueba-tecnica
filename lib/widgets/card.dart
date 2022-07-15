import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  String title;
  String body;
  Cards({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(body),
          trailing: Column(
            children: [
              Icon(
                Icons.edit,
                color: Colors.grey,
              ),
              Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

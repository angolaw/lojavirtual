import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;

  const DrawerTile({Key? key, required this.iconData, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 32,
          color: Colors.grey[700],
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        )
      ],
    );
  }
}

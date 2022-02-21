import 'package:flutter/material.dart';

Color color = const Color.fromARGB(255, 24, 98, 121);
EdgeInsets listP = EdgeInsets.only(right: 20, left: 72.0, bottom: 18.0);
Container birimListDetail(String title, String indexName, IconData icon) {
  return Container(
    // color: Color.fromARGB(255, 214, 205, 205),
    padding: listP,
    child: Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          title,
          style: TextStyle(
              color: color, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          indexName,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';

EdgeInsets listP = EdgeInsets.only(right: 20, left: 72.0, bottom: 18.0);
Container listDetail(context, String title, String indexName, IconData icon) {
  Color icColor = Theme.of(context).iconTheme.color!;
  return Container(
    // color: Color.fromARGB(255, 214, 205, 205),
    //padding: listP,
    child: Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 14,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            indexName,
            textAlign: TextAlign.start,
            overflow: TextOverflow.fade,
          ),
        )
      ],
    ),
  );
}

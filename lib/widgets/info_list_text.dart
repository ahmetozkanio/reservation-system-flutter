import 'package:flutter/material.dart';

import 'icon_widget.dart';

EdgeInsets listP = EdgeInsets.only(right: 20, left: 32.0, bottom: 0.0);
Container listDetail(context, String title, String indexName, Container icon) {
  Color icColor = Theme.of(context).iconTheme.color!;
  return Container(
    // color: Color.fromARGB(255, 214, 205, 205),
    padding: listP,
    child: Row(
      children: [
        icon,
        SizedBox(
          width: 3,
        ),
        Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
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

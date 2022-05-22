import 'package:flutter/material.dart';

Container multiSelectDialogFieldShimmer() {
  return Container(
    padding: EdgeInsets.all(
      12.0,
    ),
    alignment: Alignment.center,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 156.0,
              height: 12.0,
              color: Colors.white,
            ),
            Container(
              child: Icon(
                Icons.arrow_drop_down_outlined,
                size: 32.0,
              ),
            ),
          ],
        ),
        Divider(
          height: 5.0,
          thickness: 3.0,
          color: Colors.white,
        )
      ],
    ),
  );
}

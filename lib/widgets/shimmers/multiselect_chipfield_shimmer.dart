import 'package:flutter/material.dart';

Container multiSelectChhipFieldShimmer() {
  return Container(
    padding: EdgeInsets.all(
      12.0,
    ),
    alignment: Alignment.topLeft,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 128.0,
          height: 12.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 96.0,
              height: 32.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
            ),
            SizedBox(
              width: 4.0,
            ),
            Container(
              width: 69.0,
              height: 32.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
            ),
            SizedBox(
              width: 4.0,
            ),
            Container(
              width: 64.0,
              height: 32.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
            ),
          ],
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';

Container dropDownShimmer() {
  return Container(
      height: 64,
      decoration: BoxDecoration(
        border: Border.all(width: 4.0, color: const Color(0xFFFFFFFF)),
        borderRadius: BorderRadius.all(
          Radius.circular(
            6.0,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(
          12.0,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 274.0,
              height: 8.0,
              color: Colors.white,
            ),
          ],
        ),
      ));
}

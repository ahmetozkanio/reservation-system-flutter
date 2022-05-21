import 'package:flutter/material.dart';

Container dropDownShimmer() {
  return Container(
      height: 64,
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
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
      ));
}

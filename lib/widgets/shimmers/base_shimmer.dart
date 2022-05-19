import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer baseShimmer(Widget widget) {
  return Shimmer.fromColors(
    baseColor: Color.fromARGB(
      255,
      207,
      207,
      207,
    ),
    highlightColor: Color.fromARGB(255, 230, 229, 229),
    child: widget,
  );
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer baseShimmer(Widget widget) {
  return Shimmer.fromColors(
    baseColor: Color.fromARGB(255, 228, 228, 228),
    highlightColor: Color.fromARGB(255, 194, 193, 193),
    child: widget,
  );
}

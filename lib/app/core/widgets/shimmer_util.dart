import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUtil {
  static Widget shimmerEffect({
    required Widget child,
    Color baseColor = Colors.grey,
    Color highlightColor = Colors.grey,
    double duration = 1500,
  }) {
    return Shimmer.fromColors(
      baseColor: baseColor.withOpacity(0.3),
      highlightColor: highlightColor.withOpacity(0.5),
      period: Duration(milliseconds: duration.toInt()),
      child: child,
    );
  }
}

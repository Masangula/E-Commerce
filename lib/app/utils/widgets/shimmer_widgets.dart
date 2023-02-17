// ignore_for_file: use_key_in_widget_constructors

import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  const ShimmerWidget.rectangular(
      {required this.width, required this.height, required this.shapeBorder});

  const ShimmerWidget.circular({
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });
  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!,
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.grey[300]!,
            shape: shapeBorder,
          ),
          width: width,
          height: height,
        ),
      );
}

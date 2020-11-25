import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  /// ## Axis
  /// 1. 0 Axis : 카테고리
  /// 2. 1 Axis : n
  /// 3. 2 Axis : 모양
  List<List<List<Offset>>> data;

  /// 카테고리 페인트
  List<Paint> paints;

  Painter({data, paints});

  @override
  void paint(Canvas canvas, Size _) {
    for (var i = 0; i < data.length; i++) {
      var shapes = data[i];
      var paint = paints[i];

      for (var shape in shapes) {
        canvas.drawPoints(PointMode.polygon, shape, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    for (var i = 0; i < data.length; i++) {
      var shapes = data[i];
      var oldShapes = (oldDelegate as Painter).data[i];

      if (shapes.length != oldShapes.length) return true;
    }
    return false;
  }
}

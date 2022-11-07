import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MaskPainter extends CustomPainter {
  MaskPainter({
    required this.mask,
  });

  final ui.Image mask;
  final maskPaint = Paint()
    ..colorFilter = const ColorFilter.mode(
        Color.fromRGBO(0, 0, 255, 0.5), BlendMode.srcOut);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImageRect(
        mask,
        Rect.fromLTWH(0, 0, mask.width.toDouble(), mask.height.toDouble()),
        Rect.fromLTWH(0, 0, size.width, size.height),
        maskPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}

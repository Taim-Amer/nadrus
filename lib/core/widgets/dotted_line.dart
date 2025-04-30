import 'package:flutter/material.dart';

class TDottedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  TDottedLinePainter({
    this.color = Colors.grey,
    this.strokeWidth = 1,
    this.dashWidth = 3,
    this.dashSpace = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final radius = dashWidth / 2;
    double startY = 0;

    while (startY < size.height) {
      final centerY = startY + radius;
      canvas.drawCircle(
        Offset(0, centerY),
        radius,
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
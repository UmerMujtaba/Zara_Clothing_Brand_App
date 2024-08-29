import 'package:flutter/material.dart';

class LineWithDiamondPainter extends CustomPainter {
  final Color lineColor;

  LineWithDiamondPainter({required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintLine = Paint()
      ..color = lineColor
      ..strokeWidth = 1.0; // Adjust the line width as needed

    final double lineY = size.height / 2; // Y position of the line

    // Draw the line
    canvas.drawLine(
      Offset(0, lineY),
      Offset(size.width, lineY),
      paintLine,
    );

    // Calculate the diamond's size and position
    const double diamondSize = 20.0; // Size of the diamond
    //const double halfDiamondSize = diamondSize / 2;

    final Path diamondPath = Path();
    /*..moveTo(size.width / 2, lineY - halfDiamondSize) // Top
      ..lineTo(size.width / 2 + halfDiamondSize, lineY) // Right
      ..lineTo(size.width / 2, lineY + halfDiamondSize) // Bottom
      ..lineTo(size.width / 2 - halfDiamondSize, lineY) // Left
      ..close(); // Complete the diamond*/

    // Draw the diamond
    canvas.drawPath(diamondPath, paintLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

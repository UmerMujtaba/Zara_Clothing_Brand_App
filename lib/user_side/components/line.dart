import 'package:flutter/material.dart';

class LineWithDiamondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintLine = Paint()
      ..color = Colors.black
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
    const double halfDiamondSize = diamondSize / 2;

    // ignore: unused_local_variable
    final Path diamondPath = Path()
      ..moveTo(size.width / 2, lineY - halfDiamondSize) // Top
      ..lineTo(size.width / 2 + halfDiamondSize, lineY) // Right
      ..lineTo(size.width / 2, lineY + halfDiamondSize) // Bottom
      ..lineTo(size.width / 2 - halfDiamondSize, lineY) // Left
      ..close(); // Complete the diamond


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

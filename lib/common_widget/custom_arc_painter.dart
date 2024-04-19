import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

import '../common/color_extension.dart';

class CustomArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    var gradientColor = LinearGradient(
      colors: [
        AppColors.secondary,
        AppColors.secondary50,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    Paint activePaint = Paint()..shader = gradientColor.createShader(rect);

    activePaint.style = PaintingStyle.stroke;
    activePaint.strokeWidth = 15;
    activePaint.strokeCap = StrokeCap.round;

    Paint highestPaint = Paint();
    highestPaint.style = PaintingStyle.stroke;
    highestPaint.color = AppColors.primary500;
    highestPaint.strokeWidth = 15;
    highestPaint.strokeCap = StrokeCap.round;

    Paint lowestPaint = Paint();
    lowestPaint.style = PaintingStyle.stroke;
    lowestPaint.color = AppColors.secondaryG;
    lowestPaint.strokeWidth = 15;
    lowestPaint.strokeCap = StrokeCap.round;

    Paint backgroundPaint = Paint();
    backgroundPaint.color = AppColors.gray.withOpacity(0.5);
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = 15;
    backgroundPaint.strokeCap = StrokeCap.round;

    canvas.drawArc(rect, radians(135), radians(270), false, backgroundPaint);
    canvas.drawArc(rect, radians(135), radians(80), false, activePaint);
    canvas.drawArc(rect, radians(220), radians(120), false, highestPaint);
    canvas.drawArc(rect, radians(345), radians(60), false, lowestPaint);
  }

  @override
  bool shouldRepaint(CustomArcPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomArcPainter oldDelegate) => false;
}

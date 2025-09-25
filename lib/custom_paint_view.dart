import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomPaintView extends StatelessWidget {
  const CustomPaintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CustomPaint Example")),
      body: Center(
        child: Column(
          children: [
            CustomPaint(
              size: const Size(100, 100), // حجم الرسمة
              painter: TrapezoidPainter(),
            ),
            const SizedBox(height: 40),
            CustomPaint(
              size: const Size(100, 100), // حجم الرسمة

              painter: StarPainter(),
            ),
          ],
        ),
      ),
    );
  }
}

class TrapezoidPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    final path = Path();

    // نبدأ من النقطة العلوية اليسار
    path.moveTo(size.width * 0.25, 0); // أعلى يسار (مضغوط للداخل)
    path.lineTo(size.width * 0.75, 0); // أعلى يمين
    path.lineTo(size.width, size.height); // أسفل يمين
    path.lineTo(0, size.height); // أسفل يسار
    path.close(); // إغلاق الشكل

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;

    final path = Path();

    // مركز النجمة
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // نصف القطر الخارجي والداخلي
    final outerRadius = size.width / 2;
    final innerRadius = outerRadius / 2.5;

    // عدد الأذرع
    const numPoints = 5;
    final angle = (2 * math.pi) / numPoints;

    for (int i = 0; i < numPoints * 2; i++) {
      // لو العدد زوجي → نقطة خارجية، لو فردي → نقطة داخلية
      final radius = i.isEven ? outerRadius : innerRadius;

      final x = centerX + radius * math.cos(i * angle / 2);
      final y = centerY + radius * math.sin(i * angle / 2);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

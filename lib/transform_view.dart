import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformDemoPage extends StatelessWidget {
  const TransformDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transform Demo")),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          // ✅ 1. Translation (تحريك)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Translate"),
              Transform.translate(
                offset: const Offset(40, -20), // 40 يمين -20 فوق
                child: Container(width: 80, height: 80, color: Colors.blue),
              ),
            ],
          ),

          // ✅ 2. Rotation (دوران)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Rotate"),
              Transform.rotate(
                angle: math.pi / 6, // 30 درجة
                child: Container(width: 80, height: 80, color: Colors.green),
              ),
            ],
          ),

          // ✅ 3. Scale (تكبير/تصغير)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Scale"),
              Transform.scale(
                scale: 1.5, // 150%
                child: Container(width: 80, height: 80, color: Colors.orange),
              ),
            ],
          ),

          // ✅ 4. Skew (إمالة)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Skew"),
              Transform(
                transform: Matrix4.skewX(0.3),
                child: Container(width: 80, height: 80, color: Colors.purple),
              ),
            ],
          ),

          // ✅ 5. Combination (تجميع أكتر من Transform)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Combined"),
              Transform(
                transform: Matrix4.identity()
                  ..translate(20.0, -20.0) // تحريك
                  ..rotateZ(math.pi / 12)   // دوران
                  ..scale(1.2),             // تكبير
                child: Container(width: 80, height: 80, color: Colors.red),
              ),
            ],
          ),

          // ✅ 6. Perspective (عمق 3D بسيط)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("3D Perspective"),
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // عمق Z
                  ..rotateX(-0.4),
                alignment: Alignment.center,
                child: Container(width: 80, height: 80, color: Colors.teal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

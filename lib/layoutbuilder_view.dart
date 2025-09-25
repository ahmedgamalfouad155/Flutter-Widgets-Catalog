import 'package:flutter/material.dart';

class LayoutBuilderVsMediaQuery extends StatelessWidget {
  const LayoutBuilderVsMediaQuery({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // عرض الشاشة كله

    return Scaffold(
      appBar: AppBar(title: const Text("LayoutBuilder vs MediaQuery")),
      body: Center(
        child: Container(
          width: screenWidth * 0.8, // Container عرضه = 60% من الشاشة
          height: 200,
          color: Colors.grey[300],
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "📱 MediaQuery width: ${screenWidth.toStringAsFixed(0)}",
                    style: const TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "📐 LayoutBuilder width: ${constraints.maxWidth.toStringAsFixed(0)}",
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: constraints.maxWidth / 2,
                    height: 40,
                    color: Colors.green,
                    child: const Center(child: Text("نص عرض الـ Container")),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

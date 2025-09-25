import 'package:flutter/material.dart';

class BaselineExample extends StatelessWidget {
  const BaselineExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Baseline Example")),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Baseline(
              baseline: 100, // نفس خط الأساس
              baselineType: TextBaseline.alphabetic,
              child: const Text(
                "Hello",
                style: TextStyle(fontSize: 40, color: Colors.blue),
              ),
            ),
            Baseline(
              baseline: 100, // نفس خط الأساس
              baselineType: TextBaseline.alphabetic,
              child: const Text(
                "World",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
            Baseline(
              baseline: 100, // نفس خط الأساس
              baselineType: TextBaseline.alphabetic,
              child: Container(width: 40, height: 40, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

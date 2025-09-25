import 'package:flutter/material.dart';

class InteractiveViewerExample extends StatelessWidget {
  const InteractiveViewerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("InteractiveViewer Example")),
      body: Center(
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(200), // يسمح بالسحب برة شوية
          minScale: 0.1, // أقل تكبير
          maxScale: 10, // أكبر تكبير
          child: Image.network(
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
          ),
        ),
      ),
    );
  }
}

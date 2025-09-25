import 'package:flutter/material.dart';

class DraggableSheetExample extends StatelessWidget {
  const DraggableSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DraggableScrollableSheet Example")),
      body: Stack(
        children: [
          // الخلفية (مثلاً خريطة أو صورة)
          Container(
            color: Colors.blue.shade100,
            child: const Center(
              child: Text(
                "خلفية (ممكن تبقى خريطة أو صورة)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // الـ DraggableScrollableSheet
          DraggableScrollableSheet(
            initialChildSize: 0.3, // 20% من الشاشة
            minChildSize: 0.3, // أصغر حجم
            maxChildSize: 0.8, // أكبر حجم
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                ),
                child: ListView.builder(
                  controller: scrollController, // مهم عشان يسحب مع الـ sheet
                  itemCount: 20,
                  itemBuilder: (context, index) => ListTile(
                    leading: const Icon(Icons.place),
                    title: Text("مكان رقم ${index + 1}"),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

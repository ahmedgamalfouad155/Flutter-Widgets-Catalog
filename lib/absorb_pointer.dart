import 'package:flutter/material.dart';

class AbsorbPointerExample extends StatefulWidget {
  const AbsorbPointerExample({super.key});

  @override
  State<AbsorbPointerExample> createState() => _AbsorbPointerExampleState();
}

class _AbsorbPointerExampleState extends State<AbsorbPointerExample> {
  bool _isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AbsorbPointer Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AbsorbPointer(
              absorbing: _isDisabled, // لو true يمنع التفاعل
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Button Pressed!")),
                  );
                },
                child: const Text("Click Me"),
              ),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text("Disable Button with AbsorbPointer"),
              value: _isDisabled,
              onChanged: (val) {
                setState(() {
                  _isDisabled = val;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

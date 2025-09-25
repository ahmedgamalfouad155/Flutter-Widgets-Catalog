import 'package:flutter/material.dart';

class AutoCompleteExample extends StatelessWidget {
  const AutoCompleteExample({super.key});

  static const List<String> fruits = <String>[
    'Apple',
    'Banana',
    'Mango',
    'Orange',
    'Watermelon',
    'Pineapple',
    'Strawberry',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Autocomplete Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return fruits.where((String fruit) {
              return fruit.toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("You selected: $selection")),
            );
          },
        ),
      ),
    );
  }
}

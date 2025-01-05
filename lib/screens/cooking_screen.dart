import 'package:flutter/material.dart';
import 'package:smoothie/preparation.dart';

class CookingScreen extends StatelessWidget {
  final Preparation preparation;

  const CookingScreen({super.key, required this.preparation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cooking Steps'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              preparation.shortDescription,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: preparation.steps.length,
                itemBuilder: (context, index) {
                  final step = preparation.steps[index];
                  return CheckboxListTile(
                    title: Text(step.instruction),
                    subtitle: step.duration != null
                        ? Text('Duration: ${step.duration!.inSeconds} seconds')
                        : null,
                    value: false,
                    onChanged: (value) {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

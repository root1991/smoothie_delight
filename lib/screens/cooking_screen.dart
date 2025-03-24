import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoothie/preparation.dart';

final stepIndexProvider = StateProvider<int>((ref) => 0);

class CookingScreen extends ConsumerWidget {
  final Preparation preparation;

  const CookingScreen({super.key, required this.preparation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStepIndex = ref.watch(stepIndexProvider);
    final step = preparation.steps[currentStepIndex];

    void nextStep() {
      if (currentStepIndex < preparation.steps.length - 1) {
        ref.read(stepIndexProvider.notifier).state++;
      } else {
        ref.read(stepIndexProvider.notifier).state = 0;
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cooking Steps'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'STEP ${step.stepNumber}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    step.instruction,
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20),
                  if (step.tips.isNotEmpty && step.tips.first.isNotEmpty) ...[
                    Text(
                      'Tips:',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),
                    for (var tip in step.tips)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          '- $tip',
                          textAlign: TextAlign.start,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                  ],
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: nextStep,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    currentStepIndex < preparation.steps.length - 1
                        ? 'Next'
                        : 'Finish',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

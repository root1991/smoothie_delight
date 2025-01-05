import 'package:flutter/material.dart';

class VitaminBarWidget extends StatelessWidget {
  final Map<String, double> vitamins;

  // Maximum possible values for scaling

  final Map<String, double> maxValues = {
    'Vitamin C': 150.0,
    'Vitamin A': 90.0, // Adjusted to reflect the highest observed value
    'Vitamin B6': 1.5,
    'Vitamin D': 0.0125,
    'Calcium': 300.0,
    'Iron': 2.0,
  };

  final Map<String, Color> vitaminColors = {
    'Vitamin C': Colors.orange,
    'Vitamin A': Colors.green,
    'Vitamin B6': Colors.blue,
    'Vitamin D': Colors.yellow,
    'Calcium': Colors.purple,
    'Iron': Colors.red,
  };

  VitaminBarWidget({Key? key, required this.vitamins}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double barWidth =
        MediaQuery.of(context).size.width * 0.45; // Fixed bar width

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: vitamins.entries.map((entry) {
        final vitamin = entry.key;
        final value = entry.value;
        final maxValue = maxValues[vitamin] ?? 1.0;
        final percentage = (value / maxValue).clamp(0.0, 1.0);
        final color = vitaminColors[vitamin] ?? Colors.grey;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(vitamin, style: const TextStyle(fontSize: 16)),
              ),
              Stack(
                children: [
                  Container(
                    width: barWidth,
                    height: 20,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Container(
                    width: barWidth * percentage,
                    height: 20,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Text(
                  '${value.toStringAsFixed(1)} / ${maxValue.toStringAsFixed(1)}')
            ],
          ),
        );
      }).toList(),
    );
  }
}

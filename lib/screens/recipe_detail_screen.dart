import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoothie/main.dart';
import 'package:smoothie/models.dart';
import 'package:smoothie/screens/cooking_screen.dart';
import 'package:smoothie/vitamin_bar_widget.dart';

class SaladDetailScreen extends ConsumerWidget {
  final Salad salad;

  const SaladDetailScreen({super.key, required this.salad});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(
      favoriteNotifierProvider.select(
        (favorites) => favorites.any((r) => r.name == salad.name),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(salad.name), actions: [
        IconButton(
          onPressed: () {
            ref.read(favoriteNotifierProvider.notifier).toggleFavorite(
                  salad,
                );
          },
          icon: isFavorite
              ? const Icon(
                  Icons.favorite,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.favorite_outline,
                  color: Colors.green,
                ),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                'assets/${salad.name.toLowerCase().replaceAll(' ', '_')}.webp',
                fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                salad.description,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Calories: ${salad.calories} kcal',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Ingredients:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...salad.ingredients.map((ingredient) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  child: Text(
                    '- ${ingredient.quantity.description} ${ingredient.product.name} (${ingredient.quantity.calories} kcal)',
                    style: const TextStyle(fontSize: 16),
                  ),
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Preparation Guide:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                salad.preparation.shortDescription,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CookingScreen(
                        preparation: salad.preparation,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Let\'s Cook',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: VitaminBarWidget(vitamins: salad.vitamins),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

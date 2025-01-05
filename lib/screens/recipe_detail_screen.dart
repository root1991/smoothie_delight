import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoothie/main.dart';
import 'package:smoothie/models.dart';
import 'package:smoothie/vitamin_bar_widget.dart';

class RecipeDetailScreen extends ConsumerWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(
      favoriteNotifierProvider.select(
        (favorites) => favorites.any((r) => r.name == recipe.name),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(recipe.name), actions: [
        IconButton(
          onPressed: () {
            ref.read(favoriteNotifierProvider.notifier).toggleFavorite(
                  recipe,
                );
          },
          icon: isFavorite
              ? const Icon(Icons.favorite)
              : const Icon(
                  Icons.favorite_outline,
                ),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                'assets/${recipe.name.toLowerCase().replaceAll(' ', '_')}.webp',
                fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                recipe.description,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Calories: ${recipe.calories} kcal',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: VitaminBarWidget(vitamins: recipe.vitamins),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Ingredients:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...recipe.ingredients.map((ingredient) => Padding(
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
                recipe.preparationGuide,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

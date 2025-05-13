import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoothie/main.dart';
import 'package:smoothie/models.dart';
import 'package:smoothie/screens/recipe_detail_screen.dart';

class FavoritesTab extends ConsumerWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRecipes = ref.watch(favoriteNotifierProvider);
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: favoriteRecipes.length,
      itemBuilder: (context, index) {
        final recipe = favoriteRecipes[index];

        return Card(
          elevation: 4,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SaladDetailScreen(
                        salad: recipe,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        recipe.assetPath.contains('webp')
                            ? recipe.assetPath
                            : '${recipe.assetPath}.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        recipe.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.7), // Transparent white background
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close,
                        color: Colors.grey), // Grey close icon
                    iconSize: 20,
                    padding: EdgeInsets
                        .zero, // Remove default padding for better alignment
                    onPressed: () {
                      _removeFromFavorites(context, ref, recipe);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _removeFromFavorites(
      BuildContext context, WidgetRef ref, Salad recipe) async {
    final notifier = ref.read(favoriteNotifierProvider.notifier);

    await notifier.toggleFavorite(recipe);

    final updatedFavorites = ref.read(favoriteNotifierProvider);

    if (updatedFavorites.isEmpty) {
      ref.read(selectedIndexProvider.notifier).state = 0;
      return;
    } // Remove from favorites

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${recipe.name} removed from favorites'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            notifier.toggleFavorite(recipe); // Re-add to favorites if undone
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

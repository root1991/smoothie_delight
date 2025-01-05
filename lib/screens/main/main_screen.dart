import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoothie/main.dart';
import 'package:smoothie/screens/main/tab/categories_tab.dart';
import 'package:smoothie/screens/main/tab/daily_smoothy_tab.dart';
import 'package:smoothie/screens/main/tab/favorite_tab.dart';
import 'package:smoothie/screens/main/tab/ingredients_tab.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final favoriteRecipes = ref.watch(favoriteNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smoothie Recipes'),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          const CategoriesTab(),
          const IngredientsTab(),
          const DailySmoothyTab(),
          if (favoriteRecipes.isNotEmpty) const FavoritesTab()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
                Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(selectedIndexProvider.notifier).state = index;
        },
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.kitchen),
            label: 'Ingredients',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.view_day),
            label: 'Daily smoothy',
          ),
          if (favoriteRecipes.isNotEmpty)
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'My favorites',
            )
        ],
      ),
    );
  }
}

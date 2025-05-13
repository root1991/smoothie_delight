import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoothie/main.dart';
import 'package:smoothie/screens/main/tab/categories_tab.dart';
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
        title: Text(appbarTitle(selectedIndex)),
        //backgroundColor: Colors.green.withOpacity(0.4),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          const CategoriesTab(),
          const IngredientsTab(),
          //const DailySmoothieTab(),
          if (favoriteRecipes.isNotEmpty) const FavoritesTab()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
                Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
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

  String appbarTitle(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return 'Smoothie Categories';
      case 1:
        return 'Ingredients';
      case 2:
        return 'Smoothie of the day';
      case 3:
        return 'My favorites';
      default:
        return '';
    }
  }
}

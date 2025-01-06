import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:smoothie/db/database_manager.dart';
import 'package:smoothie/models.dart';
import 'package:smoothie/notifiers/favorite_state_notifier.dart';
import 'package:smoothie/offline_recipes.dart';
import 'package:smoothie/repository/recipe_local_data_source.dart';
import 'package:smoothie/screens/main/main_screen.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await resetDatabase();
  await initializeDatabase();
  //await saveAllRecipes();
  runApp(const ProviderScope(child: SmoothieApp()));
}

Future<void> initializeDatabase() async {
  final dbHelper = DatabaseMananger.instance;
  await dbHelper.database; // Ensures the database is initialized
}

Future<void> resetDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'smoothie_app.db');
  await deleteDatabase(path);
}

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final db = RecipeLocalDataSource();
  return await db.fetchCategories();
});

final veganRecipesByCategoryProvider =
    FutureProvider.family<List<Recipe>, String>((ref, categoryName) async {
  final db = RecipeLocalDataSource();
  return await db.fetchVeganRecipesByCategory(categoryName);
});

final ingredientCountProvider =
    FutureProvider<Map<Product, List<Recipe>>>((ref) async {
  final db = RecipeLocalDataSource();
  return await db.fetchIngredientsWithRecipes();
});

final recipesByProductProvider =
    FutureProvider.family<List<Recipe>, String>((ref, productName) async {
  final db = RecipeLocalDataSource();
  return await db.fetchRecipesByProduct(productName);
});

final favoriteNotifierProvider =
    StateNotifierProvider<FavoriteNotifier, List<Recipe>>((ref) {
  final db = RecipeLocalDataSource(); // Your db wrapper instance
  return FavoriteNotifier(db);
});

Future<void> saveAllRecipes() async {
  final db = RecipeLocalDataSource();
  for (final recipe in fruityBlendsRecipes) {
    await db.insertRecipe(recipe);
  }
  for (final recipe in greenAndHealthyRecipes) {
    await db.insertRecipe(recipe);
  }
  for (final recipe in kidsSpecialRecipes) {
    await db.insertRecipe(recipe);
  }
  await db.populateProductsFromIngredients();
  print('All recipes saved to database.');
}

final recipesProvider = Provider<Map<String, List<Recipe>>>((ref) {
  final db = RecipeLocalDataSource();
  return {
    'Fruity Blends': fruityBlendsRecipes,
    'Green & Healthy': greenAndHealthyRecipes,
    'Kids Specials': kidsSpecialRecipes,
  };
});

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class SmoothieApp extends StatelessWidget {
  const SmoothieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            textStyle: const TextStyle(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
      ),
      home: const MainScreen(),
    );
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smoothie/db/database_manager.dart';
import 'package:smoothie/manager/daily_smoothie_manager.dart';
import 'package:smoothie/models.dart';
import 'package:smoothie/notifiers/favorite_state_notifier.dart';
import 'package:smoothie/offline_recipes.dart';
import 'package:smoothie/repository/recipe_local_data_source.dart';
import 'package:smoothie/screens/main/main_screen.dart';
import 'package:smoothie/screens/main/tab/daily_smoothy_tab.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await resetDatabase();
  await initializeDatabase();
  await initPlatformState();
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

final dailySmoothieProvider = FutureProvider<Recipe>((ref) async {
  final db = RecipeLocalDataSource();
  final selectedIngredients = ref.watch(selectedIngredientsProvider);
  final mood = ref.watch(selectedMoodProvider);

  return db.getDailySmoothie(selectedIngredients, mood?.products ?? []);
});

final dailySmoothieInitProvider = FutureProvider<void>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final savedData = prefs.getString(dailySmoothieKey);
  final savedTimestamp = prefs.getInt(smoothieTimestampKey);
  if (savedData != null && savedTimestamp != null) {
    final savedDate = DateTime.fromMillisecondsSinceEpoch(savedTimestamp);
    if (!_isSameDay(savedDate, DateTime.now())) {
      await prefs.remove(dailySmoothieKey);
      await prefs.remove(smoothieTimestampKey);
    }
  }
  if (savedData == null || savedTimestamp == null) {
    final recipe = ref.read(dailySmoothieProvider);
    await prefs.setString(dailySmoothieKey, jsonEncode(recipe.value?.toMap()));
    await prefs.setInt(
        smoothieTimestampKey, DateTime.now().millisecondsSinceEpoch);
  }
});

bool _isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

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

final dailySmoothieManagerProvider = Provider<DailySmoothieManager>((ref) {
  return DailySmoothieManager();
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
  for (final recipe in breakfastBoostersRecipes) {
    await db.insertRecipe(recipe);
  }
  for (final recipe in detoxAndCleanseRecipes) {
    await db.insertRecipe(recipe);
  }

  await db.populateProductsFromIngredients();
}

final recipesProvider = Provider<Map<String, List<Recipe>>>((ref) {
  return {
    'Fruity Blends': fruityBlendsRecipes,
    'Green & Healthy': greenAndHealthyRecipes,
  };
});

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final db = RecipeLocalDataSource();
  return db.loadProducts();
});
final crossedItemsProvider = StateNotifierProvider.family<CrossedItemsNotifier,
    Set<Product>, List<Product>>((ref, missingIngredients) {
  return CrossedItemsNotifier(missingIngredients.toSet());
});

class CrossedItemsNotifier extends StateNotifier<Set<Product>> {
  CrossedItemsNotifier(super.initialItems);
  void toggleItem(Product item) {
    if (state.contains(item)) {
      state = state.difference({item});
    } else {
      state = state.union({item});
    }
  }
}

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

Future<void> initPlatformState() async {
  await Purchases.setDebugLogsEnabled(true);

  PurchasesConfiguration configuration =
      PurchasesConfiguration('goog_BDVrdZlYRIZvYIZHFgGsMywdUBW');

  await Purchases.configure(configuration);
}

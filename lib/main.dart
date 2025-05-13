import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smoothie/db/database_manager.dart'; // Keep this import
import 'package:smoothie/manager/daily_salad_manager.dart';
import 'package:smoothie/models.dart';
import 'package:smoothie/notifiers/favorite_state_notifier.dart';
import 'package:smoothie/offline_recipes.dart';
import 'package:smoothie/repository/salad_local_data_source.dart';
import 'package:smoothie/screens/main/main_screen.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await resetDatabase();
  await initializeDatabase();
  await initPlatformState();
  //await saveAllSalads();
  runApp(const ProviderScope(child: SaladApp()));
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
  final db = SaladLocalDataSource();
  return await db.fetchCategories();
});

final veganSaladsByCategoryProvider =
    FutureProvider.family<List<Salad>, String>((ref, categoryName) async {
  final db = SaladLocalDataSource();
  return await db.fetchVeganSaladsByCategory(categoryName);
});

//final dailySaladProvider = FutureProvider<Salad>((ref) async {
//  final db = SaladLocalDataSource();
  //final selectedIngredients = ref.watch(selectedIngredientsProvider);
  //final mood = ref.watch(selectedMoodProvider);

//  return db.getDailySalad(selectedIngredients, mood?.products ?? []);
//});

final dailySaladInitProvider = FutureProvider<void>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final savedData = prefs.getString(dailySaladKey);
  final savedTimestamp = prefs.getInt(saladTimestampKey);
  if (savedData != null && savedTimestamp != null) {
    final savedDate = DateTime.fromMillisecondsSinceEpoch(savedTimestamp);
    if (!_isSameDay(savedDate, DateTime.now())) { // You might want to use saladTimestampKey here too
      await prefs.remove(dailySaladKey);
      await prefs.remove(saladTimestampKey);
    }
  }
  if (savedData == null || savedTimestamp == null) {
    // final salad = ref.read(dailySaladProvider);
    // await prefs.setString(dailySaladKey, jsonEncode(salad.value?.toMap()));
    // await prefs.setInt(
        // saladTimestampKey, DateTime.now().millisecondsSinceEpoch);
  }
});

bool _isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

final ingredientCountProvider =
    FutureProvider<Map<Product, List<Salad>>>((ref) async {
  final db = SaladLocalDataSource();
  return await db.fetchIngredientsWithSalads();
});

final saladsByProductProvider =
    FutureProvider.family<List<Salad>, String>((ref, productName) async {
  final db = SaladLocalDataSource();
  return await db.fetchSaladsByProduct(productName);
});

final favoriteNotifierProvider =
    StateNotifierProvider<FavoriteNotifier, List<Salad>>((ref) {
  final db = SaladLocalDataSource(); // Your db wrapper instance
  return FavoriteNotifier(db);
});

final dailySaladManagerProvider = Provider<DailySaladManager>((ref) {
  return DailySaladManager();
});

Future<void> saveAllSalads() async {
  final db = SaladLocalDataSource();
  for (final salad in sideSaladsRecepies) {
    await db.insertSalad(salad);
  }
  for (final salad in greenSaladsRecepies) {
    await db.insertSalad(salad);
  }
  for (final salad in easySalads) {
    await db.insertSalad(salad);
  }
  for (final salad in mainCourseSalads) {
    await db.insertSalad(salad);
  }
}

final saladsProvider = Provider<Map<String, List<Salad>>>((ref) {
  return {
    'Fruity Blends': fruityBlendsSalads,
    'Green & Healthy': greenSaladsRecepies,
    'Side Salads': sideSaladsRecepies,
  };
});

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final db = SaladLocalDataSource();
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

class SaladApp extends StatelessWidget {
  const SaladApp({super.key});

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

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smoothie/models.dart';
import 'package:smoothie/preparation.dart';

// Key constants
const String dailySmoothieKey = 'dailySmoothie';
const String smoothieTimestampKey = 'smoothieTimestamp';
// Provider to manage daily smoothie
final dailySmoothieManagerProvider = Provider<DailySmoothieManager>((ref) {
  return DailySmoothieManager();
});

class DailySmoothieManager {
  Future<void> saveDailySmoothie(Recipe recipe) async {
    final prefs = await SharedPreferences.getInstance();
    final smoothieData = jsonEncode(recipe.toMap());
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    await prefs.setString(dailySmoothieKey, smoothieData);
    await prefs.setInt(smoothieTimestampKey, timestamp);
  }

  Future<Recipe?> loadDailySmoothie() async {
    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString(dailySmoothieKey);
    final savedTimestamp = prefs.getInt(smoothieTimestampKey);
    if (savedData != null && savedTimestamp != null) {
      final savedDate = DateTime.fromMillisecondsSinceEpoch(savedTimestamp);
      final currentDate = DateTime.now();
      if (!_isSameDay(savedDate, currentDate)) {
        await prefs.remove(dailySmoothieKey);
        await prefs.remove(smoothieTimestampKey);
        return null;
      }
      final recipeMap = jsonDecode(savedData);

      return Recipe.fromMap(
        recipeMap,
        preparation: Preparation(
          shortDescription: '',
          steps: [],
        ),
        loadedCategories: [],
        loadedVitamins: {},
        loadedIngredients: [],
      );
    }
    return null;
  }

  Future<void> clearDailySmoothie() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(dailySmoothieKey);
    await prefs.remove(smoothieTimestampKey);
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}

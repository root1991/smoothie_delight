import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smoothie/models.dart';
import 'package:smoothie/preparation.dart';

// Key constants
const String dailySaladKey = 'dailySalad';
const String saladTimestampKey = 'saladTimestamp';
// Provider to manage daily smoothie
final dailySaladManagerProvider = Provider<DailySaladManager>((ref) {
  return DailySaladManager();
});

class DailySaladManager {
  Future<void> saveDailySalad(Salad recipe) async {
    final prefs = await SharedPreferences.getInstance();
    final saladData = jsonEncode(recipe.toMap());
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    await prefs.setString(dailySaladKey, saladData);
    await prefs.setInt(saladTimestampKey, timestamp);
  }

  Future<Salad?> loadDailySalad() async {
    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString(dailySaladKey);
    final savedTimestamp = prefs.getInt(saladTimestampKey);
    if (savedData != null && savedTimestamp != null) {
      final savedDate = DateTime.fromMillisecondsSinceEpoch(savedTimestamp);
      final currentDate = DateTime.now();
      if (!_isSameDay(savedDate, currentDate)) {
        //await prefs.remove(dailySmoothieKey);
        //await prefs.remove(smoothieTimestampKey);
        return null;
      }
      final recipeMap = jsonDecode(savedData);

      return Salad.fromMap(
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

  Future<void> clearDailySalad() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(dailySaladKey);
    await prefs.remove(saladTimestampKey);
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}

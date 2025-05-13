import 'dart:math';

import 'package:smoothie/db/database_manager.dart';
import 'package:smoothie/models.dart' hide Preparation;
import 'package:smoothie/preparation.dart' as prep;
import 'package:sqflite/sqflite.dart';

class SaladLocalDataSource {
  final dbHelper = DatabaseMananger.instance;

  Future<int> insertDressing(Dressing dressing) async {
 final db = await dbHelper.database;
 final dressingId = await db.insert(
 'dressings',
      {'name': dressing.name},
 conflictAlgorithm: ConflictAlgorithm.replace,
    );

 for (final ingredient in dressing.ingredients) {
      await db.insert(
 'dressing_ingredients',
 ingredient.toMap(dressingId),
 conflictAlgorithm: ConflictAlgorithm.replace,
 );
    }

    await db.insert(
 'dressing_preparations',
      {
 'dressingId': dressingId,
 'shortDescription': dressing.preparation.shortDescription.isNotEmpty
 ? dressing.preparation.shortDescription
 : 'No description available',
      },
 conflictAlgorithm: ConflictAlgorithm.replace,
 );
 for (final step in dressing.preparation.steps) {
 await db.insert(
 'dressing_preparation_steps',
        {
 'dressingId': dressingId,
 'stepNumber': step.stepNumber,
 'tips': step.tips.join('|'),
 'instruction': step.instruction,
 'duration': step.duration?.inSeconds,
        },
 conflictAlgorithm: ConflictAlgorithm.replace,
 );
 }
    return dressingId;
  }

  Future<int> insertSalad(Salad salad) async {
    final db = await dbHelper.database;

 int? dressingId;
    if (salad.dressing != null) {
 dressingId = await insertDressing(salad.dressing!);
    }

    final saladMap = salad.toMap();
    if (dressingId != null) {
      saladMap['dressingId'] = dressingId;
    }

    final saladId = await db.insert(
      'salads',
      saladMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    for (final ingredient in salad.ingredients) {
      await db.insert(
        'salad_ingredients',
        ingredient.toMap(saladId),
      );
    }

    for (final entry in salad.vitamins.entries) {
      await db.insert(
        'salad_vitamins',
 {'saladId': saladId,
          'recipeId': saladId,
          'vitaminName': entry.key,
          'amount': entry.value,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }


 for (final category in salad.categories) {
      await db.insert(
        'salad_categories',
        {
 'saladId': saladId,
          'categoryName': category.name,
          'assetPath': category.assetPath,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

 await db.insert(
 'salad_preparations',
      {
        'saladId': saladId,
        'shortDescription': salad.preparation.shortDescription.isNotEmpty
            ? salad.preparation.shortDescription
            : 'No description available',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    for (final step in salad.preparation.steps) {
 await db.insert(
        'salad_preparation_steps',
        {
 'saladId': saladId,
          'stepNumber': step.stepNumber,
          'tips': step.tips.join('|'),
          'instruction': step.instruction,
          'duration': step.duration?.inSeconds,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

 return saladId;
  }

  Future<List<Product>> loadProducts() async {
    final db = await dbHelper.database;
    final result = await db.query('products');
    return result.map((map) => Product.fromMap(map)).toList();
  }

  Future<void> populateProductsFromIngredients() async {
    final db = await dbHelper.database;

    // Fetch distinct productIds that are not yet in the products table
    final result = await db.rawQuery('''
    SELECT DISTINCT ri.productId
 FROM salad_ingredients ri
    LEFT JOIN products p ON ri.productId = p.name
    WHERE p.name IS NULL
  ''');

    // Insert each missing product
    for (final row in result) {
      await db.insert(
        'products',
        {
          'name': row['productId'],
          'category': 'Uncategorized',
          'assetPath': 'assets/${row['productId']}.webp'
              .replaceAll(' ', '_')
              .toLowerCase(), // Use a default placeholder
        },
      );
    }

    print('Products populated from ingredients.');
  }

  Future<void> deleteSalad(int id) async {
 final db = await dbHelper.database;
 await db.delete('salads', where: 'id = ?', whereArgs: [id]);
 await db.delete('salad_ingredients', where: 'recipeId = ?', whereArgs: [id]);
 await db.delete('salad_vitamins', where: 'recipeId = ?', whereArgs: [id]);
 await db.delete('salad_categories', where: 'recipeId = ?', whereArgs: [id]);
  } 

  Future<int> updateSalad(Salad salad) async {
    final db = await dbHelper.database;
    final result = await db.update(
      'salads',
      salad.toMap(),
      where: 'id = ?',
      whereArgs: [salad.ranking],
    );

    await db.delete('salad_ingredients',
        where: 'recipeId = ?', whereArgs: [salad.ranking]);
 await db.delete('salad_vitamins',
        where: 'recipeId = ?', whereArgs: [salad.ranking]);
    await db.delete('salad_categories',
        where: 'recipeId = ?', whereArgs: [salad.ranking]);

    for (final ingredient in salad.ingredients) {
      await db.insert(
        'salad_ingredients',
        ingredient.toMap(salad.ranking),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    for (final entry in salad.vitamins.entries) {
      await db.insert(
        'salad_vitamins',
 {'saladId': salad.ranking,
          'recipeId': salad.ranking,
          'vitaminName': entry.key,
          'amount': entry.value,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    for (final category in salad.categories) {
      await db.insert(
        'salad_categories',
        { 'saladId': salad.ranking,
          'categoryName': category.name,
          'assetPath': category.assetPath,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    return result;
  }

  Future<List<Category>> fetchCategories() async {
    final db = await dbHelper.database;
    final result = await db.rawQuery('''
    SELECT DISTINCT categoryName, assetPath FROM salad_categories
  ''');
    
    return result.map((map) {
      return Category(
        name: (map['categoryName'] as String?) ?? 'Unknown',
        assetPath: (map['assetPath'] as String?) ?? '',
      );
    }).toList();
  }

  Future<List<Salad>> fetchVeganSaladsByCategory(String categoryName) async {
    final db = await dbHelper.database;
    final result = await db.rawQuery('''
    SELECT r.* FROM salads r
    INNER JOIN salad_categories rc ON r.id = rc.recipeId
    WHERE rc.categoryName = ? AND r.isVegan = 1
  ''', [categoryName]);

    return _mapSalads(result);
  }

  Future<List<Salad>> fetchSaladsByProduct(String productName) async {
    final db = await dbHelper.database;
    final result = await db.rawQuery('''
    SELECT r.* FROM salads r
    INNER JOIN salad_ingredients ri ON r.id = ri.recipeId
    WHERE ri.productId = ?
  ''', [productName]);

    return _mapSalads(result);
  }

  Future<Salad> getDailySalad(
      List<Product> moodIngredients, List<Product> existingIngredients) async {
    final db = await dbHelper.database;

    final existingStrings =
        existingIngredients.map((ingredient) => ingredient.name).toList();

    final moodStrings =
        moodIngredients.map((ingredient) => ingredient.name).toList();

    final prioritizedIngredients = {...existingStrings, ...moodStrings}.toSet();

    final ingredientPlaceholders =
        List.filled(prioritizedIngredients.length, '?').join(',');
    final result = await db.rawQuery('''
      SELECT r.*, COUNT(ri.productId) as matchCount
      FROM salads r
      INNER JOIN salad_ingredients ri ON r.id = ri.recipeId
      WHERE ri.productId IN ($ingredientPlaceholders)
      GROUP BY r.id
      ORDER BY matchCount DESC
    ''', prioritizedIngredients.toList());

    final topMatchCount = result.first['matchCount'] as int;

    final topMatches = result.where((row) {
      return row['matchCount'] == topMatchCount;
    }).toList();

    final smoothiesOfDay = await _mapSalads(topMatches);

    final random = Random(); // Corrected Random instantiation
 return smoothiesOfDay[random.nextInt(smoothiesOfDay.length)]; // Corrected index access
  }

 Future<List<Salad>> fetchSaladsByCategory(String categoryName) async {
    final db = await dbHelper.database; // Query to get recipes by category

    // Query to get recipes by category
    final result = await db.rawQuery('''
    SELECT r.* FROM salads r
    INNER JOIN salad_categories rc ON r.id = rc.recipeId
    WHERE rc.categoryName = ?
  ''', [categoryName]);
    return _mapSalads(result);
  }

  Future<List<Salad>> _mapSalads(List<Map<String, Object?>> result) async {
    final db = await dbHelper.database;

    List<Salad> salads = [];

    for (final saladMap in result) {
      final saladId = saladMap['id'] as int;
      final dressingId = saladMap['dressingId'] as int?;
 // Fetch Dressing if dressingId is available
      Dressing? dressing;
 if (dressingId != null) {
 dressing = await fetchDressing(dressingId);
      }
      // Fetch Ingredients for the current salad
      final ingredientResults = await db.query(
        'salad_ingredients',
 where: 'saladId = ?', // Corrected where clause
        whereArgs: [saladId],
      );
      final ingredients = ingredientResults.map((map) {
        return Ingredient.fromMap(map);
      }).toList();

      final vitaminResults = await db.query(
 // Fetch Vitamins for the current salad
        'salad_vitamins',
        where: 'saladId = ?',
        whereArgs: [saladId],
      );
      final vitamins = {
        for (var v in vitaminResults)
          v['vitaminName'] as String: v['amount'] as double
      };

      final categoryResults = await db.query(
 // Fetch Categories for the current salad
        'salad_categories',
        where: 'saladId = ?',
        whereArgs: [saladId],
      );
      final categories = categoryResults.map((map) {
        return Category(
          name: (map['categoryName'] as String?) ?? 'Unknown',
          assetPath: (map['assetPath'] as String?) ?? '',
        );
      }).toList();

      // Fetch Preparation for the current salad
      final preparationResult = await db.query(
        'salad_preparations',
        where: 'saladId = ?',
        whereArgs: [saladId],
      );

      final stepResults = await db.query(
        'salad_preparation_steps',
        where: 'saladId = ?',
        whereArgs: [saladId],
      );

      final steps = stepResults.map((map) => prep.Step.fromMap(map)).toList();

      final preparation = preparationResult.isNotEmpty
          ? prep.Preparation(
              shortDescription:
                  preparationResult.first['shortDescription'] as String,
              steps: steps,
            )
          : prep.Preparation(shortDescription: '', steps: []);
      // Create Salad object with all fetched data

      salads.add(
        Salad.fromMap(
          saladMap,
          loadedIngredients: ingredients,
          loadedVitamins: vitamins,
          loadedCategories: categories,
          preparation: preparation,
 dressing: dressing,
        ),
      );
    }

 return salads;
  }

  Future<List<Salad>> fetchFavoriteSalads() async {
    final db = await dbHelper.database;

    final result = await db.query(
      'salads',
      where: 'isFavorite = ?',
      whereArgs: [1]
    );

    return _mapSalads(result);
  }

  Future<void> toggleFavoriteStatus(String recipeName) async {
    final db = await dbHelper.database;

    final currentStatus = await db.query(
      'salads',
      columns: ['isFavorite'],
      where: 'name = ?', 
      whereArgs: [recipeName],
    );

    final isCurrentlyFavorite =
        currentStatus.isNotEmpty && currentStatus.first['isFavorite'] == 1;
    final newStatus = isCurrentlyFavorite ? 0 : 1;

    await db.update(
      'salads',
      {'isFavorite': newStatus},
      where: 'name = ?', 
      whereArgs: [recipeName],
    );
  }

  Future<Map<Product, List<Salad>>> fetchIngredientsWithSalads() async {
    final db = await dbHelper.database;

    final result = await db.rawQuery('''
    SELECT ri.*, r.*, p.assetPath as productAssetPath, p.category as productCategory
    FROM salad_ingredients ri
    INNER JOIN salads r ON ri.saladId = r.id
    INNER JOIN products p ON ri.productId = p.name
  ''');

    final Map<Product, List<Salad>> ingredients = {};
    final Map<String, Product> productCache = {};

    for (final row in result) {
      final productId = row['productId'] as String;

      // Use cached Product if exists, otherwise create a new one
      final product = productCache.putIfAbsent(
        productId,
        () => Product(
          name: productId,
          category: row['productCategory'] as String? ?? 'Unknown',
          assetPath: row['productAssetPath'] as String? ?? '',
        ),
      );

      // Parse Salad
      final salad = Salad(
 name: row['name'] as String,
        description: row['description'] as String,
        calories: row['calories'] as int,
        preparation: prep.Preparation(shortDescription: '', steps: []),
        assetPath: row['assetPath'] as String,
        ingredients: [],
        vitamins: {},
 categories: [],
      );

      // Update Ingredient-Recipe Mapping
      ingredients.update(
        product,
        (existing) => existing..add(salad),
        ifAbsent: () => [salad],
 );
    }

    return ingredients;
  }
  
  Future<Dressing?> fetchDressing(int dressingId) async {
  final db = await dbHelper.database;

  final result = await db.query(
    'dressings', // Assuming you have a 'dressings' table
    where: 'id = ?',
    whereArgs: [dressingId],
  );

  if (result.isNotEmpty) {
    final dressingMap = result.first;
    // You'll need to fetch ingredients and preparation for the dressing as well
    final ingredients = await fetchIngredientsForDressing(dressingId); // You'll need to implement this
    final preparationResult = await db.query(
      'dressing_preparations',
      where: 'dressingId = ?',
      whereArgs: [dressingId],
    );
    final stepsResult = await db.query(
      'dressing_preparation_steps',
      where: 'dressingId = ?',
      whereArgs: [dressingId],
      orderBy: 'stepNumber',
    );

    final steps = stepsResult
        .map((stepMap) => prep.Step(
              stepNumber: stepMap['stepNumber'] as int,
              instruction: stepMap['instruction'] as String,
              duration: stepMap['duration'] != null ? Duration(seconds: stepMap['duration'] as int) : null,
              tips: (stepMap['tips'] as String).split('|'),
            ))
        .toList();

    final preparation = preparationResult.isNotEmpty
        ? prep.Preparation(
            shortDescription: preparationResult.first['shortDescription'] as String,
            steps: steps,
          )
        : prep.Preparation(shortDescription: '', steps: []);


    return Dressing.fromMap(dressingMap, ingredients: ingredients, preparation: preparation); // Use the updated fromMap
  }

  return null; // Return null if no dressing is found
}

// You'll also need to implement fetchIngredientsForDressing(int dressingId)
Future<List<Ingredient>> fetchIngredientsForDressing(int dressingId) async {
  final db = await dbHelper.database;

  final result = await db.rawQuery('''
    SELECT i.* FROM ingredients i
    INNER JOIN dressing_ingredients di ON i.id = di.ingredientId
    WHERE di.dressingId = ?
  ''', [dressingId]);

  return result.map((ingredientMap) => Ingredient.fromMap(ingredientMap)).toList();
}
}

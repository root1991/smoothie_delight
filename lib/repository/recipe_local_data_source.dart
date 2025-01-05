import 'package:smoothie/db/database_manager.dart';
import 'package:smoothie/models.dart';
import 'package:smoothie/preparation.dart';
import 'package:sqflite/sqflite.dart';

class RecipeLocalDataSource {
  final dbHelper = DatabaseMananger.instance;

  Future<int> insertRecipe(Recipe recipe) async {
    final db = await dbHelper.database;
    final recipeId = await db.insert(
      'recipes',
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    for (final ingredient in recipe.ingredients) {
      await db.insert(
        'recipe_ingredients',
        ingredient.toMap(recipeId),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    for (final entry in recipe.vitamins.entries) {
      await db.insert(
        'recipe_vitamins',
        {
          'recipeId': recipeId,
          'vitaminName': entry.key,
          'amount': entry.value,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    for (final category in recipe.categories) {
      await db.insert(
        'recipe_categories',
        {
          'recipeId': recipeId,
          'categoryName': category.name,
          'assetPath': category.assetPath,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await db.insert(
      'preparations',
      {
        'recipeId': recipeId,
        'shortDescription': recipe.preparation.shortDescription.isNotEmpty
            ? recipe.preparation.shortDescription
            : 'No description available',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    for (final step in recipe.preparation.steps) {
      print('Inserting step \${step.stepNumber} for recipe ID: \$recipeId');
      await db.insert(
        'preparation_steps',
        {
          'recipeId': recipeId,
          'stepNumber': step.stepNumber,
          'instruction': step.instruction,
          'duration': step.duration?.inMinutes,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    return recipeId;
  }

  Future<void> populateProductsFromIngredients() async {
    final db = await dbHelper.database;

    // Fetch distinct productIds that are not yet in the products table
    final result = await db.rawQuery('''
    SELECT DISTINCT ri.productId
    FROM recipe_ingredients ri
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

  Future<List<Recipe>> fetchAllRecipes() async {
    final db = await dbHelper.database;
    final recipeResults = await db.query('recipes');

    return _mapRecipes(recipeResults);
  }

  Future<void> deleteRecipe(int id) async {
    final db = await dbHelper.database;
    await db.delete('recipes', where: 'id = ?', whereArgs: [id]);
    await db
        .delete('recipe_ingredients', where: 'recipeId = ?', whereArgs: [id]);
    await db.delete('recipe_vitamins', where: 'recipeId = ?', whereArgs: [id]);
    await db
        .delete('recipe_categories', where: 'recipeId = ?', whereArgs: [id]);
  }

  Future<int> updateRecipe(Recipe recipe) async {
    final db = await dbHelper.database;
    final result = await db.update(
      'recipes',
      recipe.toMap(),
      where: 'id = ?',
      whereArgs: [recipe.ranking],
    );

    await db.delete('recipe_ingredients',
        where: 'recipeId = ?', whereArgs: [recipe.ranking]);
    await db.delete('recipe_vitamins',
        where: 'recipeId = ?', whereArgs: [recipe.ranking]);
    await db.delete('recipe_categories',
        where: 'recipeId = ?', whereArgs: [recipe.ranking]);

    for (final ingredient in recipe.ingredients) {
      await db.insert(
        'recipe_ingredients',
        ingredient.toMap(recipe.ranking),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    for (final entry in recipe.vitamins.entries) {
      await db.insert(
        'recipe_vitamins',
        {
          'recipeId': recipe.ranking,
          'vitaminName': entry.key,
          'amount': entry.value,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    for (final category in recipe.categories) {
      await db.insert(
        'recipe_categories',
        {
          'recipeId': recipe.ranking,
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
    SELECT DISTINCT categoryName, assetPath FROM recipe_categories
  ''');

    return result.map((map) {
      return Category(
        name: (map['categoryName'] as String?) ?? 'Unknown',
        assetPath: (map['assetPath'] as String?) ?? '',
      );
    }).toList();
  }

  Future<List<Recipe>> fetchVeganRecipesByCategory(String categoryName) async {
    final db = await dbHelper.database;
    final result = await db.rawQuery('''
    SELECT r.* FROM recipes r
    INNER JOIN recipe_categories rc ON r.id = rc.recipeId
    WHERE rc.categoryName = ? AND r.isVegan = 1
  ''', [categoryName]);

    return _mapRecipes(result);
  }

  Future<List<Recipe>> fetchRecipesByProduct(String productName) async {
    final db = await dbHelper.database;
    final result = await db.rawQuery('''
    SELECT r.* FROM recipes r
    INNER JOIN recipe_ingredients ri ON r.id = ri.recipeId
    WHERE ri.productId = ?
  ''', [productName]);

    return _mapRecipes(result);
  }

  Future<List<Recipe>> fetchRecipesByCategory(String categoryName) async {
    final db = await dbHelper.database;

    // Query to get recipes by category
    final result = await db.rawQuery('''
    SELECT r.* FROM recipes r
    INNER JOIN recipe_categories rc ON r.id = rc.recipeId
    WHERE rc.categoryName = ?
  ''', [categoryName]);
    return _mapRecipes(result);
  }

  Future<List<Recipe>> _mapRecipes(List<Map<String, Object?>> result) async {
    final db = await dbHelper.database;

    List<Recipe> recipes = [];

    for (final recipeMap in result) {
      final recipeId = recipeMap['id'];

      final ingredientResults = await db.query(
        'recipe_ingredients',
        where: 'recipeId = ?',
        whereArgs: [recipeId],
      );
      final ingredients = ingredientResults.map((map) {
        return Ingredient.fromMap(map);
      }).toList();

      final vitaminResults = await db.query(
        'recipe_vitamins',
        where: 'recipeId = ?',
        whereArgs: [recipeId],
      );
      final vitamins = {
        for (var v in vitaminResults)
          v['vitaminName'] as String: v['amount'] as double
      };

      final categoryResults = await db.query(
        'recipe_categories',
        where: 'recipeId = ?',
        whereArgs: [recipeId],
      );
      final categories = categoryResults.map((map) {
        return Category(
          name: (map['categoryName'] as String?) ?? 'Unknown',
          assetPath: (map['assetPath'] as String?) ?? '',
        );
      }).toList();

      // Fetch Preparation
      final preparationResult = await db.query(
        'preparations',
        where: 'recipeId = ?',
        whereArgs: [recipeId],
      );

      final stepResults = await db.query(
        'preparation_steps',
        where: 'recipeId = ?',
        whereArgs: [recipeId],
      );

      final steps = stepResults.map((map) => Step.fromMap(map)).toList();

      final preparation = preparationResult.isNotEmpty
          ? Preparation(
              shortDescription:
                  preparationResult.first['shortDescription'] as String,
              steps: steps,
            )
          : Preparation(shortDescription: '', steps: []);

      recipes.add(
        Recipe.fromMap(
          recipeMap,
          loadedIngredients: ingredients,
          loadedVitamins: vitamins,
          loadedCategories: categories,
          preparation: preparation,
        ),
      );
    }

    return recipes;
  }

  Future<List<Recipe>> fetchFavoriteRecipes() async {
    final db = await dbHelper.database;

    final result = await db.query(
      'recipes',
      where: 'isFavorite = ?',
      whereArgs: [1],
    );

    return _mapRecipes(result);
  }

  Future<void> toggleFavoriteStatus(String recipeName) async {
    final db = await dbHelper.database;

    final currentStatus = await db.query(
      'recipes',
      columns: ['isFavorite'],
      where: 'name = ?',
      whereArgs: [recipeName],
    );

    final isCurrentlyFavorite =
        currentStatus.isNotEmpty && currentStatus.first['isFavorite'] == 1;
    final newStatus = isCurrentlyFavorite ? 0 : 1;

    await db.update(
      'recipes',
      {'isFavorite': newStatus},
      where: 'name = ?',
      whereArgs: [recipeName],
    );
  }

  Future<Map<Product, List<Recipe>>> fetchIngredientsWithRecipes() async {
    final db = await dbHelper.database;

    final result = await db.rawQuery('''
    SELECT ri.*, r.*, p.assetPath as productAssetPath, p.category as productCategory
    FROM recipe_ingredients ri
    INNER JOIN recipes r ON ri.recipeId = r.id
    INNER JOIN products p ON ri.productId = p.name
  ''');

    final Map<Product, List<Recipe>> ingredients = {};
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

      // Parse Recipe
      final recipe = Recipe(
        name: row['name'] as String,
        description: row['description'] as String,
        calories: row['calories'] as int,
        preparation: Preparation(shortDescription: '', steps: []),
        assetPath: row['assetPath'] as String,
        ingredients: [],
        vitamins: {},
        categories: [],
      );

      // Update Ingredient-Recipe Mapping
      ingredients.update(
        product,
        (existing) => existing..add(recipe),
        ifAbsent: () => [recipe],
      );
    }

    return ingredients;
  }
}

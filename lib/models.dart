// Models
class Quantity {
  final String description;
  final int weightInGrams;
  final int calories;

  Quantity({
    required this.description,
    required this.weightInGrams,
    required this.calories,
  });
}

class Product {
  final String name;
  final String category;
  final String assetPath;

  Product({
    required this.name,
    required this.category,
    required this.assetPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'assetPath': assetPath,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      category: map['category'],
      assetPath: map['assetPath'],
    );
  }
}

class Ingredient {
  final Product product;
  final Quantity quantity;

  Ingredient({
    required this.product,
    required this.quantity,
  });

  Map<String, dynamic> toMap(int recipeId) {
    return {
      'recipeId': recipeId,
      'productId': product.name,
      'quantity': quantity.description,
      'weightInGrams': quantity.weightInGrams,
      'calories': quantity.calories,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      product: Product(
        name: map['productId'],
        category: '', // Can be fetched separately
        assetPath: '',
      ),
      quantity: Quantity(
        description: map['quantity'],
        weightInGrams: map['weightInGrams'],
        calories: map['calories'],
      ),
    );
  }
}

class Category {
  final String name;
  final String assetPath;

  Category({
    required this.name,
    required this.assetPath,
  });
}

class Recipe {
  final String name;
  final String description;
  final List<Ingredient> ingredients;
  final int calories;
  final String preparationGuide;
  final Map<String, double> vitamins;
  final List<Category> categories;
  final String assetPath;
  final bool isVegan;
  final bool isChilled;
  final bool isOffline;
  final int ranking;
  final bool isFavorite;

  Recipe({
    required this.assetPath,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.calories,
    required this.preparationGuide,
    required this.vitamins,
    required this.categories,
    this.isVegan = true,
    this.isChilled = false,
    this.isOffline = true,
    this.ranking = -1,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'calories': calories,
      'preparationGuide': preparationGuide,
      'assetPath': assetPath,
      'isVegan': isVegan ? 1 : 0,
      'isChilled': isChilled ? 1 : 0,
      'isOffline': isOffline ? 1 : 0,
      'ranking': ranking,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  /// Converts Vitamins to Map (for storing in a separate table)
  Map<String, dynamic> vitaminsToMap(int recipeId) {
    return vitamins.map((key, value) => MapEntry(key, {
          'recipeId': recipeId,
          'vitaminName': key,
          'amount': value,
        }));
  }

  /// Factory Method to Convert Map to Recipe
  factory Recipe.fromMap(
    Map<String, dynamic> map, {
    required List<Ingredient> loadedIngredients,
    required Map<String, double> loadedVitamins,
    required List<Category> loadedCategories,
  }) {
    return Recipe(
      name: map['name'],
      description: map['description'],
      calories: map['calories'],
      preparationGuide: map['preparationGuide'],
      assetPath: map['assetPath'],
      ingredients: loadedIngredients,
      vitamins: loadedVitamins,
      categories: loadedCategories,
      isVegan: map['isVegan'] == 1,
      isChilled: map['isChilled'] == 1,
      isOffline: map['isOffline'] == 1,
      ranking: map['ranking'] ?? -1,
      isFavorite: map['isFavorite'] == 1,
    );
  }
}

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseMananger {
  static final DatabaseMananger instance = DatabaseMananger._init();
  static Database? _database;

  DatabaseMananger._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('smoothie_app.db');
    return _database!;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<Database> _initDB(String fileName) async {
    // Get the path to the internal storage
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    // Check if the database already exists
    final exists = await databaseExists(path);

    if (!exists) {
      try {
        // Load the database from the assets folder
        final data = await rootBundle.load('assets/$fileName');
        final bytes = data.buffer.asUint8List();

        // Write the database to the internal storage
        await File(path).writeAsBytes(bytes, flush: true);
      } catch (e) {
        rethrow;
      }
    }
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    // Create Dressings Table
    await db.execute('''
    CREATE TABLE dressings (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL
    )
  ''');

    await db.execute('''
    CREATE TABLE salad_categories (
      saladId INTEGER,
      categoryName TEXT,
      assetPath TEXT,
      PRIMARY KEY (recipeId, categoryName),
      -- Renamed from recipeId to saladId
      FOREIGN KEY (recipeId) REFERENCES recipes (id) ON DELETE CASCADE
    )
  ''');

    await db.execute('''
    CREATE TABLE products (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      category TEXT,
      assetPath TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE salads (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      description TEXT,
      calories INTEGER,
      assetPath TEXT,
      dressingId INTEGER, -- New column for dressing
      isVegan INTEGER,
      -- isSmoothie INTEGER, -- Renamed to isSalad?
      isChilled INTEGER,
      isOffline INTEGER,
      ranking INTEGER,
      isFavorite INTEGER
    )
  ''');

    // Create Recipe Ingredients Linking Table
    await db.execute('''
    CREATE TABLE recipe_ingredients (
      recipeId INTEGER,
      productId INTEGER,
      quantity TEXT,
      weightInGrams INTEGER,
      calories INTEGER,
      PRIMARY KEY (recipeId, productId),
      FOREIGN KEY (recipeId) REFERENCES recipes (id) ON DELETE CASCADE,
      FOREIGN KEY (productId) REFERENCES products (id) ON DELETE CASCADE
    )
  ''');
    // Create Vitamins Table
    await db.execute('''
    CREATE TABLE recipe_vitamins (
      recipeId INTEGER,
      vitaminName TEXT,
      amount REAL,
      PRIMARY KEY (recipeId, vitaminName),
      FOREIGN KEY (recipeId) REFERENCES recipes (id) ON DELETE CASCADE
    )
  ''');

    await db.execute('''
    CREATE TABLE preparations (
      recipeId INTEGER,
      shortDescription TEXT,
      PRIMARY KEY (recipeId),
      FOREIGN KEY (recipeId) REFERENCES recipes (id) ON DELETE CASCADE
    )
  ''');

    await db.execute('''
    CREATE TABLE preparation_steps (
      recipeId INTEGER,
      stepNumber INTEGER,
      instruction TEXT,
      duration INTEGER,
      tips TEXT,
      PRIMARY KEY (recipeId, stepNumber),
      FOREIGN KEY (recipeId) REFERENCES recipes (id) ON DELETE CASCADE
    )
  ''');
  }
}

import 'package:smoothie/dressing.dart';
import 'package:smoothie/models.dart';
import 'package:smoothie/offline_categories.dart';
import 'package:smoothie/preparation.dart';
import 'package:smoothie/products.dart';

final greenSaladsRecepies = <Salad>[
  Salad(
    assetPath: 'assets/classic_caesar_salad.webp', // Corrected asset path to match filename
    name: 'Classic Caesar Salad',
    description:
        'A timeless favorite with crisp romaine lettuce and creamy Caesar dressing.',
    ingredients: [
      Ingredient(
        product: romaineLettuce,
        quantity:
            Quantity(description: '2 cups', weightInGrams: 60, calories: 10),
      ),
      Ingredient(
        product: croutons,
        quantity:
            Quantity(description: '1/2 cup', weightInGrams: 30, calories: 110),
      ),
      Ingredient(
        product: parmesanCheese,
        quantity:
            Quantity(description: '2 tbsp', weightInGrams: 10, calories: 40),
      ),
    ],
    calories: 320,
    preparation: Preparation(
      shortDescription:
          'Toss romaine with croutons, parmesan, and Caesar dressing.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Wash and chop the romaine lettuce. Place in a large bowl.',
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Add croutons and shredded or shaved parmesan cheese to the bowl.',
        ),
        Step(
          stepNumber: 3,
          instruction: 'Pour Caesar dressing over the ingredients.',
        ),
        Step(
          stepNumber: 4,
          instruction:
              'Toss gently until all ingredients are coated with dressing.',
        ),
        Step(
          stepNumber: 5,
          instruction: 'Serve immediately.',
        ),
      ],
    ),
    vitamins: {
      'Vitamin A': 45.0,
      'Vitamin K': 102.0,
      'Calcium': 150.0, // Added Calcium as per typical nutritional info
      'Sodium': 320.0,
    },
    categories: [greenSalads],
    isVegan: false,
    isChilled: true,
    isOffline: true,
    ranking: 4,
    dressing: caesarDressing,
  ),
  Salad(
    assetPath: 'assets/spinach_berry_salad.webp', // Corrected asset path to match filename
    name: 'Spinach Berry Salad',
    description:
        'A refreshing salad with fresh spinach, mixed berries, and a light vinaigrette.',
    ingredients: [
      Ingredient(
        product: spinach,
        quantity:
            Quantity(description: '2 cups', weightInGrams: 60, calories: 14),
      ),
      Ingredient(
        product: mixedBerries,
        quantity:
            Quantity(description: '1 cup', weightInGrams: 150, calories: 80),
      ),
      Ingredient(
        product: almonds,
        quantity:
            Quantity(description: '1/4 cup', weightInGrams: 30, calories: 170),
      ),
    ],
    calories: 384,
    preparation: Preparation(
      shortDescription:
          'Combine spinach and berries, top with almonds and poppy seed dressing.',
      steps: [
        Step(
          stepNumber: 1,
          instruction: 'Wash the spinach and place it in a bowl.',
        ),
        Step(
          stepNumber: 2,
          instruction: 'Add the mixed berries to the bowl with the spinach.',
        ),
        Step(
          stepNumber: 3,
          instruction: 'Sprinkle sliced almonds over the salad.',
        ),
        Step(
          stepNumber: 4,
          instruction: 'Drizzle poppy seed dressing over the ingredients.',
        ),
        Step(
          stepNumber: 5,
          instruction: 'Toss gently to combine and serve.',
        ),
      ],
    ),
    vitamins: {
      'Vitamin C': 60.0,
      'Vitamin A': 90.0,
      'Fiber': 8.0,
      'Iron': 2.5,
    },
    categories: [greenSalads],
    isVegan: true,
    isChilled: true,
    isOffline: true,
    ranking: 5,
    dressing: poppySeedDressing,
  ),
  Salad(
    assetPath: 'assets/greek_green_salad.webp', // Corrected asset path to match filename
    name: 'Greek Green Salad',
    description:
        'A vibrant salad with crisp greens, tomatoes, cucumbers, olives, and feta cheese.',
    ingredients: [
      Ingredient(
        product: mixedGreens,
        quantity:
            Quantity(description: '3 cups', weightInGrams: 90, calories: 15),
      ),
      Ingredient(
        product: cherryTomatoes,
        quantity:
            Quantity(description: '1 cup', weightInGrams: 150, calories: 27),
      ),
      Ingredient(
        product: cucumber,
        quantity: Quantity(
            description: '1/2 cup sliced', weightInGrams: 50, calories: 8),
      ),
      Ingredient(
        product: kalamataOlives,
        quantity:
            Quantity(description: '1/4 cup', weightInGrams: 30, calories: 60),
      ),
      Ingredient(
        product: fetaCheese,
        quantity: Quantity(
            description: '1/4 cup crumbled', weightInGrams: 30, calories: 75),
      ),
    ],
    calories: 305,
    preparation: Preparation(
      shortDescription:
          'Combine greens, vegetables, olives, and feta, then dress with Greek vinaigrette.',
      steps: [
        Step(
          stepNumber: 1,
          instruction: 'Place the mixed greens in a large bowl.',
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Add the halved cherry tomatoes, sliced cucumber, and Kalamata olives.',
        ),
        Step(
          stepNumber: 3,
          instruction: 'Crumble the feta cheese over the salad.',
        ),
        Step(
          stepNumber: 4,
          instruction: 'Pour Greek dressing over the ingredients.',
        ),
        Step(
          stepNumber: 5,
          instruction: 'Toss gently to coat everything evenly.',
        ),
        Step(
          stepNumber: 6,
          instruction: 'Serve immediately.',
        ),
      ],
    ),
    vitamins: {
      'Vitamin C': 40.0,
      'Vitamin K': 95.0,
      'Calcium': 110.0,
      'Sodium': 450.0,
    },
    categories: [greenSalads],
    isVegan: false,
    isChilled: true,
    isOffline: true,
    ranking: 4,
    dressing: greekDressing,
  ),
  Salad(
    assetPath: 'assets/arugula_parmesan_salad.webp', // Corrected asset path to match filename
    name: 'Arugula Parmesan Salad',
    description:
        'A peppery arugula salad with shaved parmesan and a lemon vinaigrette.',
    ingredients: [
      Ingredient(
        product: arugula,
        quantity:
            Quantity(description: '4 cups', weightInGrams: 80, calories: 20),
      ),
      Ingredient(
        product: parmesanCheese,
        quantity: Quantity(
            description: '1/4 cup shaved', weightInGrams: 15, calories: 60),
      ),
      Ingredient(
        product: lemonJuice,
        quantity:
            Quantity(description: '1 tbsp', weightInGrams: 15, calories: 4),
      ),
      Ingredient(
        product: oliveOil,
        quantity:
            Quantity(description: '2 tbsp', weightInGrams: 30, calories: 240),
      ),
      Ingredient(
        product: blackPepper,
        quantity: Quantity(description: 'pinch', weightInGrams: 1, calories: 0),
      ),
    ],
    calories: 324,
    preparation: Preparation(
      shortDescription:
          'Toss arugula with parmesan and a simple lemon and olive oil dressing.', // Fixed typo in previous edit
      steps: [
        Step(
          stepNumber: 1,
          instruction: 'Place the arugula in a medium bowl.',
        ),
        Step(
          stepNumber: 2,
          instruction: 'Shave parmesan cheese over the arugula.',
        ),
        Step(
          stepNumber: 3,
          instruction:
              'In a small bowl, whisk together lemon juice and olive oil. Season with black pepper.',
        ),
        Step(
          stepNumber: 4,
          instruction: 'Pour the dressing over the salad.',
        ),
        Step(
          stepNumber: 5,
          instruction: 'Toss gently to combine and serve.',
        ),
      ],
    ),
    vitamins: {
      'Vitamin C': 25.0,
      'Vitamin K': 120.0,
      'Calcium': 180.0,
    },
    categories: [greenSalads],
    isVegan: false,
    isChilled: true,
    isOffline: true,
    ranking: 3,
    dressing: lemonVinaigrette,
  ),
  Salad(
    assetPath: 'assets/broccoli_salad.webp', // Corrected asset path to match filename
    name: 'Broccoli Salad',
    description:
        'A hearty and crunchy salad with broccoli florets, bacon, cheese, and a creamy dressing.',
    ingredients: [
      Ingredient(
        product: broccoliFlorets,
        quantity:
            Quantity(description: '4 cups', weightInGrams: 340, calories: 110),
      ),
      Ingredient(
        product: cookedBacon,
        quantity: Quantity(
            description: '4 slices crumbled', weightInGrams: 20, calories: 100),
      ),
      Ingredient(
        product: cheddarCheese,
        quantity: Quantity(
            description: '1/2 cup shredded', weightInGrams: 60, calories: 240),
      ),
      Ingredient(
        product: redOnion,
        quantity: Quantity(
            description: '1/4 cup finely chopped',
            weightInGrams: 25,
            calories: 10),
      ),
    ],
    calories: 1365,
    preparation: Preparation(
      shortDescription:
          'Combine broccoli, bacon, cheese, and onion with a creamy dressing.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Cut the broccoli into small florets. Place in a large bowl.',
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Add the crumbled cooked bacon, shredded cheddar cheese, and finely chopped red onion to the bowl.',
        ),
        Step(
          stepNumber: 3,
          instruction:
              'In a separate bowl, whisk together the mayonnaise, sugar, and apple cider vinegar until smooth.',
        ),
        Step(
          stepNumber: 4,
          instruction: 'Pour the dressing over the broccoli mixture.',
        ),
        Step(
          stepNumber: 5,
          instruction: 'Stir gently until all ingredients are coated.',
        ),
        Step(
          stepNumber: 6,
          instruction:
              'Cover and chill for at least 30 minutes before serving to allow flavors to meld.',
        ),
      ],
    ),
    vitamins: {
      'Vitamin C': 120.0,
      'Vitamin K': 200.0,
      'Calcium': 200.0,
    },
    categories: [greenSalads],
    isVegan: false,
    isChilled: true,
    isOffline: true,
    ranking: 5,
    dressing: creamyDressing,
  ),
];

final fruityBlendsSalads = <Salad>[];
final mainCourseSalads = <Salad>[];
final sideSaladsRecepies = <Salad>[];
final easySalads = <Salad>[];

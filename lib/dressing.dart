import 'package:smoothie/models.dart';
import 'package:smoothie/preparation.dart';
import 'package:smoothie/products.dart';

final caesarDressing = Dressing(
  name: 'Caesar Dressing',
  ingredients: [
    // Based on Classic Caesar Salad in lib/offline_recipes.dart, which only lists the dressing itself as an ingredient.
    Ingredient(
      product: oliveOil,
      quantity:
          Quantity(description: '2 tbsp', weightInGrams: 30, calories: 240),
    ),
    Ingredient(
        product: lemonJuice,
        quantity:
            Quantity(description: '1 tbsp', weightInGrams: 15, calories: 4)),
    Ingredient(
        product: garlic,
        quantity:
            Quantity(description: '1 clove', weightInGrams: 3, calories: 4)),
  ],
  preparation: Preparation(
    shortDescription: 'Classic Caesar dressing.',
    steps: [
      Step(
        stepNumber: 1,
        instruction:
            'Use prepared Caesar dressing or make your own according to a separate recipe.',
      ),
    ],
  ),
);

final poppySeedDressing = Dressing(
  name: 'Poppy Seed Dressing',
  // Based on Spinach Berry Salad in lib/offline_recipes.dart
  ingredients: [
    Ingredient(
        product: mayonnaise,
        quantity:
            Quantity(description: '2 tbsp', weightInGrams: 30, calories: 200)),
    Ingredient(
        product: sugar,
        quantity:
            Quantity(description: '1 tbsp', weightInGrams: 12, calories: 48)),
    Ingredient(
        product: whiteVinegar,
        quantity:
            Quantity(description: '1 tbsp', weightInGrams: 15, calories: 3)),
    Ingredient(
        product: poppySeeds,
        quantity:
            Quantity(description: '1 tsp', weightInGrams: 5, calories: 13)),
  ],
  preparation: Preparation(
    shortDescription: 'Light and sweet poppy seed dressing.',
    steps: [
      Step(stepNumber: 1, instruction: 'Use prepared poppy seed dressing.'),
    ],
  ),
);

final greekDressing = Dressing(
  name: 'Greek Dressing',
  // Assuming Greek dressing is made of olive oil, lemon juice, red wine vinegar, dried oregano, garlic, salt, and pepper,
  // and these products are defined in products.dart
  // Based on Greek Green Salad in lib/offline_recipes.dart
  ingredients: [
    Ingredient(
        product: oliveOil,
        quantity:
            Quantity(description: '2 tbsp', weightInGrams: 30, calories: 240)),
    Ingredient(
        product: lemonJuice,
        quantity:
            Quantity(description: '1 tbsp', weightInGrams: 15, calories: 4)),
    Ingredient(
        product: redWineVinegar,
        quantity:
            Quantity(description: '1 tbsp', weightInGrams: 15, calories: 3)),
    Ingredient(
        product: driedOregano,
        quantity:
            Quantity(description: '1 tsp', weightInGrams: 1, calories: 3)),
    Ingredient(
        product: garlic,
        quantity:
            Quantity(description: '1 clove', weightInGrams: 3, calories: 4)),
    Ingredient(
        product: salt,
        quantity:
            Quantity(description: 'to taste', weightInGrams: 1, calories: 0)),
    Ingredient(
        product: blackPepper,
        quantity:
            Quantity(description: 'to taste', weightInGrams: 1, calories: 0)),
  ],
  preparation: Preparation(
    shortDescription: 'Tangy Greek vinaigrette.',
    steps: [
      Step(stepNumber: 1, instruction: 'Use prepared Greek dressing.'),
    ],
  ),
);

final lemonVinaigrette = Dressing(
  name: 'Lemon Vinaigrette',
  // Based on Arugula Parmesan Salad in lib/offline_recipes.dart
  ingredients: [
    Ingredient(
        product: lemonJuice,
        quantity:
            Quantity(description: '1 tbsp', weightInGrams: 15, calories: 4)),
    Ingredient(
        product: oliveOil,
        quantity:
            Quantity(description: '2 tbsp', weightInGrams: 30, calories: 240)),
    Ingredient(
        product: blackPepper,
        quantity:
            Quantity(description: 'pinch', weightInGrams: 1, calories: 0)),
  ],
  preparation: Preparation(
    shortDescription: 'Simple lemon and olive oil vinaigrette.',
    steps: [
      Step(
          stepNumber: 1,
          instruction:
              'In a small bowl, whisk together lemon juice and olive oil.'),
      Step(stepNumber: 2, instruction: 'Season with black pepper.'),
    ],
  ),
);

final creamyDressing = Dressing(
  name: 'Creamy Dressing',
  // Based on Broccoli Salad in lib/offline_recipes.dart
  ingredients: [
    Ingredient(
      product: mayonnaise,
      quantity: Quantity(
          description: '1/2 cup',
          weightInGrams: 120,
          calories: 800), // mayonnaise, sugar, apple cider vinegar calories
    ),
    Ingredient(
        product: sugar,
        quantity:
            Quantity(description: '2 tbsp', weightInGrams: 25, calories: 100)),
    Ingredient(
        product: appleCiderVinegar,
        quantity:
            Quantity(description: '1 tbsp', weightInGrams: 15, calories: 5)),
  ],
  preparation: Preparation(
    shortDescription: 'Hearty and creamy dressing.',
    steps: [
      Step(
          stepNumber: 1,
          instruction:
              'Whisk together the mayonnaise, sugar, and apple cider vinegar until smooth.'),
    ],
  ),
);

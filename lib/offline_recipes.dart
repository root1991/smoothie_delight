import 'package:smoothie/models.dart';
import 'package:smoothie/offline_categories.dart';
import 'package:smoothie/products.dart';

final fruityBlendsRecipes = [
  Recipe(
    assetPath: 'assets/berry_blast',
    categories: [fruityBlends],
    name: 'Berry Blast',
    isVegan: false,
    description: 'A refreshing mix of berries and yogurt.',
    ingredients: [
      Ingredient(
          product: strawberry,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 150, calories: 50)),
      Ingredient(
          product: blueberries,
          quantity: Quantity(
              description: '1/2 cup', weightInGrams: 75, calories: 42)),
      Ingredient(
          product: yogurt,
          quantity: Quantity(
              description: '1 cup', weightInGrams: 245, calories: 150)),
      Ingredient(
          product: honey,
          quantity:
              Quantity(description: '1 tbsp', weightInGrams: 21, calories: 64)),
    ],
    calories: 250,
    preparationGuide:
        'Blend all the ingredients until smooth. Serve immediately.',
    vitamins: {
      'Vitamin C': 58.9,
      'Vitamin A': 65.0,
      'Vitamin B6': 0.21,
      'Calcium': 130.0,
      'Iron': 0.6
    },
  ),
  Recipe(
    assetPath: 'assets/berry_bonanza',
    categories: [fruityBlends],
    name: 'Berry Bonanza',
    isVegan: false,
    isChilled: true,
    description: 'A refreshing blend of mixed berries and yogurt.',
    ingredients: [
      Ingredient(
          product: strawberry,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 150, calories: 50)),
      Ingredient(
          product: blueberries,
          quantity: Quantity(
              description: '1/2 cup', weightInGrams: 75, calories: 42)),
      Ingredient(
          product: yogurt,
          quantity: Quantity(
              description: '1 cup', weightInGrams: 245, calories: 150)),
    ],
    calories: 242,
    preparationGuide: 'Blend all ingredients until smooth. Serve chilled.',
    vitamins: {
      'Vitamin C': 58.9,
      'Vitamin A': 65.0,
      'Vitamin B6': 0.21,
      'Calcium': 130.0,
      'Iron': 0.6
    },
  ),
  Recipe(
    assetPath: 'assets/mango_tango',
    categories: [fruityBlends],
    name: 'Mango Tango',
    description: 'A tropical delight with mango and pineapple.',
    ingredients: [
      Ingredient(
          product: mango,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 165, calories: 99)),
      Ingredient(
          product: pineapple,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 165, calories: 82)),
      Ingredient(
          product: coconutWater,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 240, calories: 46)),
    ],
    calories: 227,
    preparationGuide:
        'Blend mango and pineapple with coconut water until smooth. Enjoy!',
    vitamins: {
      'Vitamin C': 60.1,
      'Vitamin A': 89.0,
      'Vitamin B6': 0.26,
      'Calcium': 120.0,
      'Iron': 0.5
    },
  ),
  Recipe(
    assetPath: 'assets/citrus_burst',
    categories: [fruityBlends],
    name: 'Citrus Burst',
    isVegan: false,
    isChilled: true,
    description: 'A zesty mix of citrus fruits.',
    ingredients: [
      Ingredient(
          product: oranges,
          quantity: Quantity(
              description: '2 medium', weightInGrams: 260, calories: 124)),
      Ingredient(
          product: lemonJuice,
          quantity:
              Quantity(description: '2 tbsp', weightInGrams: 30, calories: 8)),
      Ingredient(
          product: honey,
          quantity:
              Quantity(description: '1 tbsp', weightInGrams: 21, calories: 64)),
    ],
    calories: 196,
    preparationGuide:
        'Juice the oranges and blend with lemon juice and honey. Serve chilled.',
    vitamins: {
      'Vitamin C': 75.0,
      'Vitamin A': 60.0,
      'Vitamin B6': 0.2,
      'Calcium': 110.0,
      'Iron': 0.3
    },
  ),
  Recipe(
    assetPath: 'assets/pineapple_paradise',
    categories: [fruityBlends],
    name: 'Pineapple Paradise',
    description: 'A tropical mix of pineapple and banana.',
    ingredients: [
      Ingredient(
          product: pineapple,
          quantity: Quantity(
              description: '1.5 cups', weightInGrams: 248, calories: 124)),
      Ingredient(
          product: banana,
          quantity: Quantity(
              description: '1 large', weightInGrams: 136, calories: 121)),
      Ingredient(
          product: ice,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 237, calories: 0)),
    ],
    calories: 245,
    preparationGuide:
        'Blend all ingredients until smooth. Pour into a glass and serve.',
    vitamins: {
      'Vitamin C': 78.9,
      'Vitamin A': 58.0,
      'Vitamin B6': 0.24,
      'Calcium': 150.0,
      'Iron': 0.4
    },
  ),
  Recipe(
    assetPath: 'assets/apple_delight',
    categories: [fruityBlends],
    name: 'Apple Delight',
    description: 'A crisp and sweet apple smoothie.',
    ingredients: [
      Ingredient(
          product: apple,
          quantity: Quantity(
              description: '1 large', weightInGrams: 200, calories: 104)),
      Ingredient(
          product: spinach,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 30, calories: 7)),
      Ingredient(
          product: almondMilk,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 240, calories: 60)),
    ],
    calories: 171,
    preparationGuide:
        'Chop the apple and blend with spinach and almond milk until smooth.',
    vitamins: {
      'Vitamin C': 15.2,
      'Vitamin A': 55.0,
      'Vitamin B6': 0.15,
      'Calcium': 140.0,
      'Iron': 0.7
    },
  ),
  Recipe(
    assetPath: 'assets/tropical_bliss',
    categories: [fruityBlends],
    name: 'Tropical Bliss',
    isChilled: true,
    description: 'A vibrant mix of papaya, mango, and banana.',
    ingredients: [
      Ingredient(
          product: papaya,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 145, calories: 62)),
      Ingredient(
          product: mango,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 165, calories: 99)),
      Ingredient(
          product: banana,
          quantity: Quantity(
              description: '1 medium', weightInGrams: 120, calories: 105)),
    ],
    calories: 266,
    preparationGuide:
        'Blend papaya, mango, and banana until smooth. Serve with ice.',
    vitamins: {
      'Vitamin C': 65.0,
      'Vitamin A': 80.0,
      'Vitamin B6': 0.32,
      'Calcium': 140.0,
      'Iron': 0.6
    },
  ),
  Recipe(
    assetPath: 'assets/berry_breeze',
    categories: [fruityBlends],
    name: 'Berry Breeze',
    description: 'A light and refreshing strawberry and raspberry smoothie.',
    ingredients: [
      Ingredient(
          product: strawberry,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 150, calories: 50)),
      Ingredient(
          product: raspberries,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 123, calories: 64)),
    ],
    calories: 174,
    preparationGuide:
        'Blend strawberries and raspberries with almond milk until smooth.',
    vitamins: {
      'Vitamin C': 70.5,
      'Vitamin A': 63.0,
      'Vitamin B6': 0.27,
      'Calcium': 100.0,
      'Iron': 0.5
    },
  ),
  Recipe(
    assetPath: 'assets/melon_medley',
    categories: [fruityBlends],
    name: 'Melon Medley',
    isChilled: true,
    description: 'A sweet mix of watermelon and cantaloupe.',
    ingredients: [
      Ingredient(
          product: watermelon,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 152, calories: 46)),
      Ingredient(
          product: cantaloupe,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 160, calories: 54)),
    ],
    calories: 100,
    preparationGuide:
        'Blend watermelon and cantaloupe until smooth. Serve chilled.',
    vitamins: {
      'Vitamin C': 71.2,
      'Vitamin A': 2.1, // IU converted to mg
      'Vitamin B6': 0.16,
      'Calcium': 25.0,
      'Iron': 0.7,
    },
  ),
  Recipe(
    assetPath: 'assets/peachy_keen',
    categories: [fruityBlends],
    name: 'Peachy Keen',
    description: 'A delightful peach and banana smoothie.',
    ingredients: [
      Ingredient(
          product: peach,
          quantity: Quantity(
              description: '1 large', weightInGrams: 175, calories: 68)),
      Ingredient(
          product: banana,
          quantity: Quantity(
              description: '1 medium', weightInGrams: 120, calories: 105)),
    ],
    calories: 173,
    preparationGuide: 'Blend peach and banana until creamy.',
    vitamins: {
      'Vitamin C': 55.0,
      'Vitamin A': 75.0,
      'Vitamin B6': 0.22,
      'Calcium': 110.0,
      'Iron': 0.4
    },
  ),
  Recipe(
    assetPath: 'assets/kiwi_fusion',
    categories: [fruityBlends],
    name: 'Kiwi Fusion',
    description: 'A tangy kiwi and grape smoothie.',
    ingredients: [
      Ingredient(
          product: kiwi,
          quantity: Quantity(
              description: '2 medium', weightInGrams: 148, calories: 90)),
      Ingredient(
          product: grapes,
          quantity: Quantity(
              description: '1 cup', weightInGrams: 151, calories: 104)),
    ],
    calories: 194,
    preparationGuide: 'Blend kiwi and grapes until smooth. Serve immediately.',
    vitamins: {
      'Vitamin C': 74.0,
      'Vitamin A': 50.0,
      'Vitamin B6': 0.29,
      'Calcium': 95.0,
      'Iron': 0.6
    },
  ),
];

final greenAndHealthyRecipes = [
  Recipe(
    assetPath: 'assets/green_detox',
    categories: [greenAndHealthy],
    name: 'Green Detox',
    description: 'A healthy green smoothie packed with nutrients.',
    ingredients: [
      Ingredient(
          product: spinach,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 30, calories: 7)),
      Ingredient(
          product: banana,
          quantity:
              Quantity(description: '1', weightInGrams: 118, calories: 105)),
      Ingredient(
          product: almondMilk,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 240, calories: 60)),
      Ingredient(
          product: chiaSeeds,
          quantity:
              Quantity(description: '1 tbsp', weightInGrams: 12, calories: 58)),
    ],
    calories: 180,
    preparationGuide:
        'Blend spinach, banana, and almond milk until smooth. Sprinkle chia seeds on top before serving.',
    vitamins: {
      'Vitamin C': 45.0,
      'Vitamin A': 80.0,
      'Vitamin B6': 0.35,
      'Vitamin D': 0.0025,
      'Calcium': 180.0,
      'Iron': 1.0
    },
  ),
  Recipe(
    assetPath: 'assets/green_detox_delight.png',
    name: 'Green Detox Delight',
    description:
        'A refreshing blend of greens and fruits for a nutrient boost.',
    ingredients: [
      Ingredient(
        product: spinach,
        quantity: Quantity(
          description: '1 cup',
          weightInGrams: 30,
          calories: 7,
        ),
      ),
      Ingredient(
        product: cucumber,
        quantity: Quantity(
          description: '1/2 cucumber',
          weightInGrams: 150,
          calories: 16,
        ),
      ),
      Ingredient(
        product: greenApple,
        quantity: Quantity(
          description: '1 medium',
          weightInGrams: 200,
          calories: 95,
        ),
      ),
    ],
    calories: 118,
    preparationGuide:
        'Blend spinach, cucumber, and green apple until smooth. Serve chilled.',
    vitamins: {
      'Vitamin C': 52.0,
      'Vitamin A': 85.0,
      'Vitamin K': 102.0,
      'Iron': 1.5,
    },
    categories: [
      greenAndHealthy,
    ],
    isVegan: true,
    isChilled: true,
    isOffline: true,
    ranking: 5,
  ),
  Recipe(
    assetPath: 'assets/tropical_green_boost',
    name: 'Tropical Green Boost',
    description:
        'A tropical twist to your greens for a sweet and tangy flavor.',
    ingredients: [
      Ingredient(
        product: pineapple,
        quantity: Quantity(
          description: '1 cup',
          weightInGrams: 165,
          calories: 82,
        ),
      ),
      Ingredient(
        product: spinach,
        quantity:
            Quantity(description: '1 cup', weightInGrams: 30, calories: 7),
      ),
      Ingredient(
        product: coconutWater,
        quantity: Quantity(
          description: '1 cup',
          weightInGrams: 240,
          calories: 45,
        ),
      ),
    ],
    calories: 134,
    preparationGuide:
        'Blend pineapple, spinach, and coconut water until smooth. Enjoy cold.',
    vitamins: {
      'Vitamin C': 72.0,
      'Vitamin A': 65.0,
      'Calcium': 58.0,
      'Manganese': 1.2,
    },
    categories: [
      greenAndHealthy,
    ],
    isVegan: true,
    isChilled: true,
    isOffline: true,
    ranking: 5,
  ),
  Recipe(
    assetPath: 'assets/avocado_power_shake',
    name: 'Avocado Power Shake',
    description: 'Creamy and rich, packed with healthy fats and nutrients.',
    ingredients: [
      Ingredient(
        product: avocado,
        quantity: Quantity(
            description: '1/2 avocado', weightInGrams: 100, calories: 160),
      ),
      Ingredient(
        product: kale,
        quantity:
            Quantity(description: '1 cup', weightInGrams: 67, calories: 33),
      ),
      Ingredient(
        product: almondMilk,
        quantity:
            Quantity(description: '1 cup', weightInGrams: 240, calories: 60),
      ),
    ],
    calories: 253,
    preparationGuide:
        'Blend avocado, kale, and almond milk until creamy. Serve immediately.',
    vitamins: {
      'Vitamin E': 25.0,
      'Vitamin K': 112.0,
      'Calcium': 120.0,
      'Potassium': 485.0,
    },
    categories: [
      greenAndHealthy,
    ],
    isVegan: true,
    isChilled: true,
    isOffline: true,
    ranking: 4,
  ),
  Recipe(
    assetPath: 'assets/green_detox_delight.png',
    name: 'Green Detox Delight',
    description:
        'A refreshing blend of greens and fruits for a nutrient boost.',
    ingredients: [
      Ingredient(
        product: spinach,
        quantity: Quantity(
          description: '1 cup',
          weightInGrams: 30,
          calories: 7,
        ),
      ),
      Ingredient(
        product: cucumber,
        quantity: Quantity(
          description: '1/2 cucumber',
          weightInGrams: 150,
          calories: 16,
        ),
      ),
      Ingredient(
        product: greenApple,
        quantity: Quantity(
          description: '1 medium',
          weightInGrams: 200,
          calories: 95,
        ),
      ),
    ],
    calories: 118,
    preparationGuide:
        'Blend spinach, cucumber, and green apple until smooth. Serve chilled.',
    vitamins: {
      'Vitamin C': 52.0,
      'Vitamin A': 85.0,
      'Vitamin K': 102.0,
      'Iron': 1.5,
    },
    categories: [
      greenAndHealthy,
    ],
    isVegan: true,
    isChilled: true,
    isOffline: true,
    ranking: 5,
  )
];

final kidsSpecialRecipes = [
  Recipe(
    assetPath: 'assets/banana_choco_smoothie',
    categories: [kidsSpecials],
    name: 'Banana Choco Smoothie',
    isVegan: false,
    description: 'A creamy blend of banana and chocolate milk.',
    ingredients: [
      Ingredient(
          product: banana,
          quantity: Quantity(
              description: '1 medium', weightInGrams: 120, calories: 105)),
      Ingredient(
          product: chocolateMilk,
          quantity: Quantity(
              description: '1 cup', weightInGrams: 250, calories: 208)),
    ],
    calories: 313,
    vitamins: {
      'Vitamin C': 10.3,
      'Vitamin A': 76.0,
      'Vitamin B6': 0.43,
      'Vitamin D': 0.0025,
      'Calcium': 250.0,
      'Iron': 1.2
    },
    preparationGuide:
        'Blend banana and chocolate milk until smooth. Serve immediately.',
  ),
  Recipe(
    assetPath: 'assets/mango_magic',
    categories: [kidsSpecials],
    name: 'Mango Magic',
    isVegan: false,
    description: 'A sweet and fruity mango smoothie kids will love.',
    vitamins: {
      'Vitamin C': 60.1,
      'Vitamin A': 89.0,
      'Vitamin B6': 0.26,
      'Calcium': 120.0,
      'Iron': 0.5
    },
    ingredients: [
      Ingredient(
          product: mango,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 165, calories: 99)),
      Ingredient(
          product: milk,
          quantity: Quantity(
              description: '1 cup', weightInGrams: 240, calories: 103)),
    ],
    calories: 202,
    preparationGuide: 'Blend mango and milk until smooth. Serve fresh.',
  ),
  Recipe(
    assetPath: 'assets/peachy_delight',
    categories: [kidsSpecials],
    name: 'Peachy Delight',
    description: 'A delicious smoothie made with peaches and orange juice.',
    vitamins: {
      'Vitamin C': 40.8,
      'Vitamin A': 72.5,
      'Vitamin B6': 0.18,
      'Calcium': 110.0,
      'Iron': 0.3
    },
    ingredients: [
      Ingredient(
          product: peach,
          quantity: Quantity(
              description: '1 large', weightInGrams: 175, calories: 68)),
      Ingredient(
          product: oranges,
          quantity: Quantity(
              description: '1 cup', weightInGrams: 248, calories: 112)),
    ],
    calories: 180,
    preparationGuide:
        'Blend peach and orange juice until smooth. Serve immediately.',
  ),
  Recipe(
    assetPath: 'assets/pineapple_party',
    categories: [kidsSpecials],
    name: 'Pineapple Party',
    isChilled: true,
    description: 'A tropical smoothie with pineapple and coconut milk.',
    ingredients: [
      Ingredient(
          product: pineapple,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 165, calories: 82)),
      Ingredient(
          product: coconutWater,
          quantity: Quantity(
              description: '1 cup', weightInGrams: 240, calories: 230)),
    ],
    calories: 312,
    vitamins: {
      'Vitamin C': 78.9,
      'Vitamin A': 58.0,
      'Vitamin B6': 0.24,
      'Calcium': 150.0,
      'Iron': 0.4
    },
    preparationGuide:
        'Blend pineapple and coconut milk until smooth. Serve chilled.',
  ),
  Recipe(
    assetPath: 'assets/apple_cinnamon_smoothie',
    categories: [kidsSpecials],
    name: 'Apple Cinnamon Smoothie',
    isVegan: false,
    description: 'A fall-inspired smoothie with apple and cinnamon.',
    vitamins: {
      'Vitamin C': 15.2,
      'Vitamin A': 55.0,
      'Vitamin B6': 0.15,
      'Calcium': 140.0,
      'Iron': 0.7
    },
    ingredients: [
      Ingredient(
          product: apple,
          quantity: Quantity(
              description: '1 large', weightInGrams: 200, calories: 104)),
      Ingredient(
          product: cinnamon,
          quantity:
              Quantity(description: '1 tsp', weightInGrams: 3, calories: 6)),
      Ingredient(
          product: milk,
          quantity: Quantity(
              description: '1 cup', weightInGrams: 240, calories: 103)),
    ],
    calories: 213,
    preparationGuide:
        'Blend apple, cinnamon, and milk until smooth. Serve fresh.',
  ),
  Recipe(
    assetPath: 'assets/strawberry_dream',
    categories: [kidsSpecials],
    name: 'Strawberry Dream',
    isVegan: false,
    description: 'A simple strawberry smoothie perfect for kids.',
    vitamins: {
      'Vitamin C': 58.9,
      'Vitamin A': 65.0,
      'Vitamin B6': 0.21,
      'Calcium': 130.0,
      'Iron': 0.6
    },
    ingredients: [
      Ingredient(
          product: strawberry,
          quantity:
              Quantity(description: '1 cup', weightInGrams: 150, calories: 50)),
      Ingredient(
          product: milk,
          quantity: Quantity(
              description: '1 cup', weightInGrams: 240, calories: 103)),
    ],
    calories: 153,
    preparationGuide:
        'Blend strawberries and milk until smooth. Serve immediately.',
  )
];

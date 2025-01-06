import 'package:smoothie/models.dart';
import 'package:smoothie/offline_categories.dart';
import 'package:smoothie/preparation.dart';
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
    preparation: Preparation(
      shortDescription: 'Blend all ingredients for a smooth, refreshing drink.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Add the strawberries, blueberries, yogurt, and honey to a blender. Make sure to layer the soft ingredients at the bottom and harder ones on top for easier blending.',
          tips: [
            'For a thicker smoothie, use frozen berries.',
            'Add honey gradually and taste to adjust sweetness.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Blend on high speed until all the ingredients are fully combined and the texture is creamy. Pause occasionally to scrape down the sides of the blender.',
          duration: const Duration(seconds: 45),
          tips: [
            'If the mixture is too thick, add a splash of water or milk.',
            'Blend in pulses for better consistency.'
          ],
        ),
        Step(
          stepNumber: 3,
          instruction:
              'Pour the smoothie into a chilled glass and serve immediately. Garnish with a few whole berries on top if desired.',
          tips: [
            'For an extra refreshing touch, chill the glass before serving.',
            'Add ice cubes while blending for a colder drink.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend mixed berries and yogurt for a creamy, chilled smoothie.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Add strawberries, blueberries, and yogurt into the blender. Ensure the yogurt is evenly distributed over the berries.',
          tips: [
            'Use Greek yogurt for a thicker texture.',
            'Freeze the berries beforehand for an extra cold smoothie.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Blend on high speed until smooth and creamy. Stop occasionally to scrape down the sides if needed.',
          duration: const Duration(seconds: 45),
          tips: [
            'Add a splash of milk if the mixture is too thick.',
            'Taste and adjust sweetness by adding honey or a banana.'
          ],
        ),
        Step(
          stepNumber: 3,
          instruction:
              'Pour the smoothie into a chilled glass and serve immediately.',
          tips: ['Garnish with fresh berries or a mint leaf for presentation.'],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend tropical fruits with coconut water for a smooth, refreshing drink.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Peel and chop the mango and pineapple into small chunks for easier blending. Place them in the blender.',
          tips: [
            'Use ripe mangoes and pineapples for maximum sweetness.',
            'Chop the fruits evenly for smoother blending.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Pour coconut water over the fruit in the blender. Ensure the liquid covers at least half of the fruit.',
          tips: [
            'Adjust the amount of coconut water based on your desired consistency.',
            'Chill the coconut water beforehand for a colder drink.'
          ],
        ),
        Step(
          stepNumber: 3,
          instruction:
              'Blend on high speed until the mixture is smooth and creamy. Stop occasionally to scrape down the sides if necessary.',
          duration: const Duration(seconds: 45),
          tips: [
            'Add a few ice cubes for a frostier texture.',
            'Pulse a few times before blending continuously for better consistency.'
          ],
        ),
        Step(
          stepNumber: 4,
          instruction:
              'Pour into a glass and enjoy immediately. Optionally, garnish with a pineapple wedge or a mint leaf.',
          tips: [
            'Serve with a reusable straw for a fun presentation.',
            'Store leftovers in the fridge for up to 24 hours. Shake before serving.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend fresh citrus juices with honey for a zesty, refreshing drink.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Juice the oranges and pour the fresh juice into the blender. Add lemon juice and honey.',
          tips: [
            'Use freshly squeezed oranges for the best flavor.',
            'Adjust honey to taste for sweetness.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Blend on medium speed until well combined and the honey is fully dissolved.',
          duration: const Duration(seconds: 30),
          tips: ['Do not over-blend to preserve the citrus freshness.'],
        ),
        Step(
          stepNumber: 3,
          instruction:
              'Pour into a glass filled with ice and serve immediately.',
          tips: ['Garnish with a slice of lemon or orange for presentation.'],
        ),
      ],
    ),
    vitamins: {
      'Vitamin C': 75.0,
      'Vitamin A': 60.0,
      'Vitamin B6': 0.2,
      'Calcium': 110.0,
      'Iron': 0.3
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
    preparation: Preparation(
      shortDescription:
          'Blend crisp apple with spinach and almond milk for a refreshing, healthy smoothie.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Core and slice the apple into small pieces. Place them into the blender.',
          tips: [
            'Leave the skin on for extra fiber and nutrients.',
            'Use a sweet apple variety like Honeycrisp or Fuji.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Add the spinach and almond milk to the blender. Ensure the spinach is packed loosely.',
          tips: [
            'Use fresh spinach for the best flavor.',
            'Add more almond milk if you prefer a thinner smoothie.'
          ],
        ),
        Step(
          stepNumber: 3,
          instruction:
              'Blend on high speed until the mixture is smooth and vibrant green.',
          duration: const Duration(seconds: 45),
          tips: [
            'Stop to scrape down the sides for even blending.',
            'Add ice if you prefer a chilled smoothie.'
          ],
        ),
        Step(
          stepNumber: 4,
          instruction: 'Pour the smoothie into a glass and serve immediately.',
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription: 'Blend tropical fruits into a smooth, chilled drink.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Peel and dice the papaya, mango, and banana into small chunks. Add them to the blender.',
          tips: [
            'Use ripe fruits for a naturally sweet taste.',
            'Chill the fruits beforehand for an even colder drink.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Blend the papaya, mango, and banana on high speed until the texture is smooth and consistent.',
          duration: const Duration(seconds: 45),
          tips: [
            'Pause and scrape down the sides for even blending.',
            'Add a splash of coconut water for a thinner consistency.'
          ],
        ),
        Step(
          stepNumber: 3,
          instruction:
              'Pour the smoothie into a glass and serve immediately with ice cubes.',
          tips: [
            'Garnish with a slice of mango or banana on the rim for presentation.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend strawberries and raspberries for a light, fruity smoothie.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Rinse the strawberries and raspberries thoroughly. Remove the stems from the strawberries.',
          tips: [
            'Use fresh or frozen berries based on your preference.',
            'Frozen berries create a thicker smoothie.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction: 'Place the strawberries and raspberries in the blender.',
        ),
        Step(
          stepNumber: 3,
          instruction: 'Blend on high speed until smooth and fully combined.',
          duration: const Duration(seconds: 40),
          tips: ['Stop blending to scrape down the sides if necessary.'],
        ),
        Step(
          stepNumber: 4,
          instruction: 'Pour into a glass and serve immediately.',
          tips: ['Garnish with a few whole berries or mint for presentation.'],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend watermelon and cantaloupe for a sweet, refreshing smoothie.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Cut the watermelon and cantaloupe into small chunks, removing any seeds. Place them into the blender.',
          tips: [
            'Use chilled fruit for a more refreshing drink.',
            'Ensure the fruit is ripe for maximum sweetness.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction: 'Blend on high speed until smooth and well combined.',
          duration: const Duration(seconds: 40),
          tips: ['Stop blending to scrape down the sides if necessary.'],
        ),
        Step(
          stepNumber: 3,
          instruction:
              'Pour the smoothie into a chilled glass and serve immediately.',
          tips: [
            'Garnish with a small melon ball or mint leaf for decoration.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription: 'Blend peach and banana into a smooth, creamy delight.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Peel and slice the peach and banana into small pieces. Place them in the blender.',
          tips: [
            'Use ripe peaches for a sweeter flavor.',
            'Freeze the banana beforehand for a thicker smoothie.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Blend on high speed until the mixture is smooth and creamy.',
          duration: const Duration(seconds: 45),
          tips: [
            'Pause and scrape down the sides if necessary.',
            'Add a splash of almond milk if the mixture is too thick.'
          ],
        ),
        Step(
          stepNumber: 3,
          instruction: 'Pour into a glass and enjoy immediately.',
          tips: [
            'Garnish with a peach slice or banana wheel for presentation.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend kiwi and grapes into a tangy, refreshing smoothie.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Peel the kiwis and slice them into quarters. Rinse the grapes thoroughly and add both to the blender.',
          tips: [
            'Use seedless grapes for a smoother texture.',
            'Chill the fruits beforehand for a colder smoothie.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Blend on high speed until the mixture is smooth and well combined.',
          duration: const Duration(seconds: 40),
          tips: [
            'Scrape down the sides to ensure even blending.',
            'Add ice cubes if a frostier texture is desired.'
          ],
        ),
        Step(
          stepNumber: 3,
          instruction: 'Pour into a glass and serve immediately.',
          tips: [
            'Garnish with a slice of kiwi or a few grapes for decoration.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend spinach, banana, and almond milk for a nutrient-packed green smoothie.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Add spinach, banana, and almond milk to the blender. Ensure the spinach is loosely packed to avoid clogging.',
          tips: [
            'Use fresh spinach for a vibrant flavor.',
            'Freeze the banana for a thicker smoothie.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction: 'Blend on high speed until smooth and creamy.',
          duration: const Duration(seconds: 45),
          tips: ['Scrape down the sides if necessary to ensure even blending.'],
        ),
        Step(
          stepNumber: 3,
          instruction:
              'Pour the smoothie into a glass and sprinkle chia seeds on top before serving.',
          tips: [
            'Let the chia seeds sit for a few minutes to soften and add texture.',
            'Stir the chia seeds to distribute them evenly.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend pineapple, spinach, and coconut water for a tropical, refreshing smoothie.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Chop the pineapple into chunks. Rinse the spinach thoroughly and add both to the blender.',
          tips: [
            'Use fresh pineapple for a sweeter taste.',
            'Chill the pineapple before blending for a colder smoothie.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Pour coconut water into the blender over the pineapple and spinach.',
          tips: [
            'Adjust the amount of coconut water to achieve your desired consistency.'
          ],
        ),
        Step(
          stepNumber: 3,
          instruction:
              'Blend on high speed until the mixture is smooth and creamy.',
          duration: const Duration(seconds: 45),
          tips: [
            'Scrape down the sides as needed for even blending.',
            'Add ice for a frostier smoothie.'
          ],
        ),
        Step(
          stepNumber: 4,
          instruction: 'Pour into a glass and enjoy immediately.',
          tips: [
            'Garnish with a small pineapple wedge or a mint leaf for decoration.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend avocado, kale, and almond milk for a creamy, nutrient-packed shake.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Scoop out the avocado flesh and chop the kale into smaller pieces. Add both to the blender.',
          tips: [
            'Use ripe avocado for the creamiest texture.',
            'Remove tough kale stems to improve smoothness.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Pour almond milk into the blender over the avocado and kale.',
          tips: ['Adjust the almond milk to achieve your desired consistency.'],
        ),
        Step(
          stepNumber: 3,
          instruction:
              'Blend on high speed until the mixture is smooth and creamy.',
          duration: const Duration(seconds: 45),
          tips: [
            'Pause to scrape down the sides for even blending.',
            'Add ice for a colder shake.'
          ],
        ),
        Step(
          stepNumber: 4,
          instruction: 'Pour into a glass and serve immediately.',
          tips: [
            'Garnish with chia seeds or a sprinkle of cinnamon for extra flavor.'
          ],
        ),
      ],
    ),
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
  ),
  Recipe(
    assetPath: 'assets/green_detox_delight',
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
    preparation: Preparation(
      shortDescription:
          'Blend spinach, cucumber, and green apple for a refreshing, nutrient-packed smoothie.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Core and slice the green apple. Peel the cucumber if desired and cut into chunks. Rinse the spinach thoroughly and add all ingredients to the blender.',
          tips: [
            'Leave the apple skin on for added fiber and nutrients.',
            'Use cold ingredients to keep the smoothie chilled.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Blend on high speed until the mixture is smooth and well combined.',
          duration: const Duration(seconds: 45),
          tips: [
            'Add ice cubes for a colder smoothie.',
            'Scrape down the sides of the blender if needed for even blending.'
          ],
        ),
        Step(
          stepNumber: 3,
          instruction: 'Pour into a glass and serve immediately.',
          tips: [
            'Garnish with a cucumber slice or apple wedge for presentation.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend banana and chocolate milk for a rich, creamy smoothie.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Peel the banana and break it into chunks. Add the banana and chocolate milk to the blender.',
          tips: [
            'Use frozen banana for a thicker texture.',
            'Opt for dark chocolate milk for a richer flavor.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction: 'Blend on high speed until smooth and creamy.',
          duration: const Duration(seconds: 30),
          tips: [
            'Stop and scrape down the sides if needed to ensure even blending.'
          ],
        ),
        Step(
          stepNumber: 3,
          instruction: 'Pour into a glass and serve immediately.',
          tips: [
            'Top with whipped cream or chocolate shavings for extra indulgence.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend mango and milk for a sweet and creamy smoothie kids will love.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Peel and chop the mango into small chunks. Add the mango and milk to the blender.',
          tips: [
            'Use ripe mangoes for the sweetest flavor.',
            'Chill the mango beforehand for a colder smoothie.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction: 'Blend on high speed until smooth and creamy.',
          duration: const Duration(seconds: 40),
          tips: [
            'Stop and scrape down the sides if necessary.',
            'Add ice for a frostier texture.'
          ],
        ),
        Step(
          stepNumber: 3,
          instruction: 'Pour into a glass and serve immediately.',
          tips: [
            'Garnish with a mango slice or a sprinkle of cinnamon for extra flavor.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend peach and orange juice for a sweet, fruity smoothie.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Peel and slice the peach into chunks. Juice the oranges and pour the juice into the blender.',
          tips: [
            'Use ripe peaches for the best flavor.',
            'Chill the oranges beforehand for a colder smoothie.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction:
              'Blend the peach and orange juice on high speed until smooth and well combined.',
          duration: const Duration(seconds: 40),
          tips: [
            'Scrape down the sides as needed to ensure a consistent blend.'
          ],
        ),
        Step(
          stepNumber: 3,
          instruction: 'Pour the smoothie into a glass and serve immediately.',
          tips: [
            'Garnish with a peach slice or an orange twist for decoration.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend pineapple and coconut milk for a tropical, creamy smoothie.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Chop the pineapple into chunks and add it to the blender. Pour in the coconut milk.',
          tips: [
            'Use fresh pineapple for the best flavor.',
            'Chill the coconut milk before blending for a colder smoothie.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction: 'Blend on high speed until smooth and creamy.',
          duration: const Duration(seconds: 45),
          tips: ['Pause and scrape down the sides if necessary.'],
        ),
        Step(
          stepNumber: 3,
          instruction: 'Pour into a chilled glass and serve immediately.',
          tips: [
            'Garnish with a pineapple wedge or a sprinkle of coconut flakes.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend apple, cinnamon, and milk for a creamy, fall-inspired smoothie.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Core and slice the apple into small chunks. Add the apple, cinnamon, and milk to the blender.',
          tips: [
            'Use a sweet apple variety for enhanced flavor.',
            'Add a pinch of nutmeg for extra spice.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction: 'Blend on high speed until smooth and well combined.',
          duration: const Duration(seconds: 40),
          tips: ['Pause to scrape down the sides if needed.'],
        ),
        Step(
          stepNumber: 3,
          instruction: 'Pour into a glass and serve immediately.',
          tips: [
            'Garnish with a sprinkle of cinnamon or an apple slice on the rim.'
          ],
        ),
      ],
    ),
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
    preparation: Preparation(
      shortDescription:
          'Blend strawberries and milk for a simple, kid-friendly smoothie.',
      steps: [
        Step(
          stepNumber: 1,
          instruction:
              'Rinse the strawberries thoroughly and remove the stems. Add the strawberries and milk to the blender.',
          tips: [
            'Use frozen strawberries for a thicker smoothie.',
            'Opt for whole milk for a creamier texture.'
          ],
        ),
        Step(
          stepNumber: 2,
          instruction: 'Blend on high speed until smooth and creamy.',
          duration: const Duration(seconds: 40),
          tips: ['Stop and scrape down the sides of the blender if necessary.'],
        ),
        Step(
          stepNumber: 3,
          instruction: 'Pour into a glass and serve immediately.',
          tips: ['Garnish with a strawberry slice on the rim for a fun touch.'],
        ),
      ],
    ),
  )
];

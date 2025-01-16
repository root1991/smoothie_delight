import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoothie/main.dart';
import 'package:smoothie/models.dart';
import 'package:smoothie/products.dart';

class Mood {
  final String name;
  final String assetImage;
  final List<Product> products;

  Mood({
    required this.name,
    required this.assetImage,
    required this.products,
  });
}

final pageIndexProvider = StateProvider<int>((ref) => 0);
final selectedIngredientsProvider = StateProvider<List<Product>>((ref) => []);
final selectedMoodProvider = StateProvider<Mood?>((ref) => null);
final moods = [
  Mood(
    name: 'Energetic',
    assetImage: 'assets/energetic.webp',
    products: [
      oranges,
      spinach,
      kiwi,
      pineapple,
      greenApple,
      watermelon,
      strawberry
    ],
  ),
  Mood(
    name: 'Happy',
    assetImage: 'assets/happy.webp',
    products: [
      banana,
      strawberry,
      blueberries,
      peach,
      coconutWater,
      honey,
      mango,
      pineapple,
    ],
  ),
  Mood(
    name: 'Sad',
    assetImage: 'assets/sad.webp',
    products: [
      spinach,
      chocolateMilk,
      pineapple,
      oranges,
      banana,
      strawberry,
      blueberries
    ],
  ),
  Mood(
    name: 'Relaxed',
    assetImage: 'assets/relaxed.webp',
    products: [
      honey,
      avocado,
      chiaSeeds,
      almondMilk,
      coconutWater,
      cucumber,
      spinach,
      pineapple,
      papaya,
      mango,
      banana,
      peach
    ],
  ),
  Mood(
    name: 'Stressed',
    assetImage: 'assets/stressed.webp',
    products: [
      blueberries,
      banana,
      avocado,
      oranges,
      kiwi,
      spinach,
      chiaSeeds,
      honey,
    ],
  ),
];

class DailySmoothieTab extends ConsumerWidget {
  const DailySmoothieTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();
    final currentPage = ref.watch(pageIndexProvider);

    void nextPage() {
      if (currentPage < 4) {
        ref.read(pageIndexProvider.notifier).state++;
        pageController.animateToPage(
          currentPage + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }

    void back() {
      if (currentPage != 0) {
        ref.read(pageIndexProvider.notifier).state--;

        pageController.animateToPage(
          currentPage - 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          LetsDoItPage(nextPage: nextPage),
          IngredientSelectionPage(nextPage, back),
          MoodSelectionPage(nextPage, back),
          DailySmoothieResultPage(index: 4, nextPage: nextPage),
        ],
      ),
    );
  }
}

class DailySmoothieResultPage extends ConsumerWidget {
  final int index;
  final VoidCallback nextPage;

  const DailySmoothieResultPage({
    super.key,
    required this.index,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailySmoothie = ref.watch(dailySmoothieProvider);

    return dailySmoothie.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
      data: (recipe) => Column(
        children: [
          Center(
            child: Text(
              recipe.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: nextPage,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoodSelectionPage extends ConsumerWidget {
  final VoidCallback nextPage;
  final VoidCallback back;

  const MoodSelectionPage(this.nextPage, this.back, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMood = ref.watch(selectedMoodProvider);
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: back,
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
              child: Text(
                'How do you feel?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: moods.length,
              itemBuilder: (context, index) {
                final mood = moods[index];
                final isSelected = selectedMood == mood;
                return GestureDetector(
                    onTap: () {
                      ref.read(selectedMoodProvider.notifier).state =
                          isSelected ? null : mood;
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 250,
                          child: Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      mood.assetImage,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Text(
                                  mood.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (isSelected)
                          Container(
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check,
                                size: 48,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ));
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: nextPage,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class IngredientSelectionPage extends ConsumerWidget {
  const IngredientSelectionPage(this.nextPage, this.back, {super.key});
  final VoidCallback nextPage;
  final VoidCallback back;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);
    final selectedIngredients = ref.watch(selectedIngredientsProvider);

    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: back,
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
              child: Text(
                'What do you have at home?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: productsAsync.when(
            data: (products) => GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final isSelected = selectedIngredients.contains(product);

                return GestureDetector(
                  onTap: () {
                    ref.read(selectedIngredientsProvider.notifier).state = [
                      ...selectedIngredients.where((item) => item != product),
                      if (!isSelected) product,
                    ];
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 250,
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    product.assetPath,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isSelected)
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              size: 48,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: nextPage,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LetsDoItPage extends StatelessWidget {
  final VoidCallback nextPage;

  const LetsDoItPage({
    super.key,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Let us suggest you smoothie for today',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Give us some information and we will find something for you',
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Image.asset(
              'assets/daily.webp',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            onPressed: nextPage,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ),
            ),
            child: const Text(
              'Let\'s do it!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

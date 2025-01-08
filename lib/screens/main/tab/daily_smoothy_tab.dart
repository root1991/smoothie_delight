import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoothie/main.dart';

final pageIndexProvider = StateProvider<int>((ref) => 0);
final selectedIngredientsProvider = StateProvider<List<String>>((ref) => []);

class DailySmoothieTab extends ConsumerWidget {
  const DailySmoothieTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();
    final currentPage = ref.watch(pageIndexProvider);

    void nextPage() {
      if (currentPage < 5) {
        ref.read(pageIndexProvider.notifier).state++;
        pageController.animateToPage(
          currentPage + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        //Navigator.pop(context);
      }
    }

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          LetsDoItPage(nextPage: nextPage),
          IngredientSelectionPage(),
          GoalPage(index: 3, nextPage: nextPage),
          GoalPage(index: 4, nextPage: nextPage),
          GoalPage(index: 5, nextPage: nextPage),
        ],
      ),
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

class IngredientSelectionPage extends ConsumerWidget {
  const IngredientSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);
    final selectedIngredients = ref.watch(selectedIngredientsProvider);

    return productsAsync.when(
      data: (products) => ListView(
        children: products.map((product) {
          final isSelected = selectedIngredients.contains(product.name);
          return CheckboxListTile(
            title: Text(product.name),
            value: isSelected,
            onChanged: (selected) {
              ref.read(selectedIngredientsProvider.notifier).state = [
                ...selectedIngredients.where((item) => item != product.name),
                if (selected == true) product.name,
              ];
            },
          );
        }).toList(),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}

class GoalPage extends StatelessWidget {
  final int index;
  final VoidCallback nextPage;

  const GoalPage({
    super.key,
    required this.index,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    List<String> goalTitles = [
      'Energy Boost',
      'Recovery',
      'Detox',
      'Immunity Boost',
      'Healthy Skin',
      'Bone Health'
    ];

    return Column(
      children: [
        Center(
          child: Text(
            goalTitles[index],
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
    );
  }
}

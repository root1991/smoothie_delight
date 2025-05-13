import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoothie/models.dart';
import 'package:smoothie/repository/salad_local_data_source.dart';

class FavoriteNotifier extends StateNotifier<List<Salad>> {
  final SaladLocalDataSource recipeLocalDataSource;

  FavoriteNotifier(this.recipeLocalDataSource) : super([]) {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final favoriteRecipes = await recipeLocalDataSource.fetchFavoriteSalads();
    state = favoriteRecipes;
  }
g
  Future<void> toggleFavorite(Salad recipe) async {
    final isNowFavorite = !state.any((r) => r.name == recipe.name);

    await recipeLocalDataSource.toggleFavoriteStatus(recipe.name);

    if (isNowFavorite) {
      state = [...state, recipe]; // Add to favorites
    } else {
      state = state.where((r) => r.name != recipe.name).toList();
    }
  }

  bool isFavorite(String recipeName) {
    return state.any((recipe) => recipe.name == recipeName);
  }
}

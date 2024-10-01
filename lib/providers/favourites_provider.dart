import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delievery/models/combined_model.dart';

class FavouritesNotifier extends StateNotifier<List<products_model>> {
  FavouritesNotifier() : super([]);

  void addFavourite(products_model product) {
    state = [...state, product];
  }

  void removeFavourite(products_model product) {
    state = state.where((item) => item != product).toList();
  }

  bool isFavourite(products_model product) {
    return state.contains(product);
  }
}

final favouritesProvider = StateNotifierProvider<FavouritesNotifier, List<products_model>>((ref) {
  return FavouritesNotifier();
});

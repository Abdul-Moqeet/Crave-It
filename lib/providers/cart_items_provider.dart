import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delievery/models/combined_model.dart';

class CartItemsNotifier extends StateNotifier<List<products_model>> {
  CartItemsNotifier() : super([]);

  void addCartItems(products_model product) {
    final index = state.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      final updatedProduct = state[index].copyWith(quantity: state[index].quantity + 1);
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index) updatedProduct else state[i]
      ];
    } else {
      state = [...state, product];
    }
  }

  void removeCartItems(products_model product) {
    final index = state.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      if (state[index].quantity > 1) {
        final updatedProduct = state[index].copyWith(quantity: state[index].quantity - 1);
        state = [
          for (int i = 0; i < state.length; i++)
            if (i == index) updatedProduct else state[i]
        ];
      } else {
        state = state.where((item) => item != product).toList();
      }
    }
  }

  bool inCart(products_model product) {
    return state.any((item) => item.name == product.name);
  }

  double ProductTotalAmount() {
    return state.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  double GstAmount() {
    double subtotal = state.fold(0, (sum, item) => sum + item.price * item.quantity);
    double gst = subtotal * 0.15;
    return gst;
  }

  double TotalAmount() {
    double subtotal = state.fold(0, (sum, item) => sum + item.price * item.quantity);
    double gst = subtotal * 0.15;
    return gst + subtotal;
  }
}

final CartProvider = StateNotifierProvider<CartItemsNotifier, List<products_model>>((ref) {
  return CartItemsNotifier();
});

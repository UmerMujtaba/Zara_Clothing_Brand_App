import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zara/model/product.dart';

class CartItem {
  final Product product;
  final String color;
  final String size;
  final int quantity;

  CartItem({
    required this.product,
    required this.color,
    required this.size,
    this.quantity = 1,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItem &&
        other.product == product &&
        other.color == color &&
        other.size == size &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return product.hashCode ^
        color.hashCode ^
        size.hashCode ^
        quantity.hashCode;
  }

  double get totalPrice => product.price * quantity;
}

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(CartItem item) {
    state = [...state, item];
  }

  void removeItem(CartItem item) {
    state = state.where((cartItem) => cartItem != item).toList();
  }

  void clearCart() {
    state = [];
  }

  void updateQuantity(CartItem item, int newQuantity) {
    state = state.map((cartItem) {
      if (cartItem == item) {
        return CartItem(
          product: cartItem.product,
          color: cartItem.color,
          size: cartItem.size,
          quantity: newQuantity,
        );
      }
      return cartItem;
    }).toList();
  }

  int get itemCount => state.length;
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

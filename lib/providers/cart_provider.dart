import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};
  String _appliedPromoCode = '';
  double _discountPercentage = 0.0;

  Map<String, CartItem> get items => {..._items};

  int get itemCount {
    int total = 0;
    _items.forEach((key, item) {
      total += item.quantity;
    });
    return total;
  }

  double get subtotalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.totalPrice;
    });
    return total;
  }

  double get discountAmount {
    return subtotalAmount * _discountPercentage;
  }

  double get shippingFee => _items.isEmpty ? 0.0 : (subtotalAmount > 300 ? 0.0 : 15.00);

  double get totalAmount {
    return (subtotalAmount - discountAmount) + shippingFee;
  }

  String get appliedPromoCode => _appliedPromoCode;

  void addItem({
    required Product product,
    required String selectedColor,
    required String selectedSize,
  }) {
    final cartId = '${product.id}_${selectedColor}_$selectedSize';
    if (_items.containsKey(cartId)) {
      _items.update(
        cartId,
        (existing) => CartItem(
          product: existing.product,
          selectedColor: existing.selectedColor,
          selectedSize: existing.selectedSize,
          quantity: existing.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        cartId,
        () => CartItem(
          product: product,
          selectedColor: selectedColor,
          selectedSize: selectedSize,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeSingleItem(String cartId) {
    if (!_items.containsKey(cartId)) return;
    if (_items[cartId]!.quantity > 1) {
      _items.update(
        cartId,
        (existing) => CartItem(
          product: existing.product,
          selectedColor: existing.selectedColor,
          selectedSize: existing.selectedSize,
          quantity: existing.quantity - 1,
        ),
      );
    } else {
      _items.remove(cartId);
    }
    notifyListeners();
  }

  void removeItemCompletely(String cartId) {
    _items.remove(cartId);
    notifyListeners();
  }

  bool applyPromoCode(String code) {
    final cleaned = code.trim().toUpperCase();
    if (cleaned == 'NEXUS10' || cleaned == 'FLUTTER2026') {
      _appliedPromoCode = cleaned;
      _discountPercentage = 0.15; // 15% discount
      notifyListeners();
      return true;
    }
    return false;
  }

  void clearCart() {
    _items.clear();
    _appliedPromoCode = '';
    _discountPercentage = 0.0;
    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';
import '../models/product.dart';

class WishlistProvider with ChangeNotifier {
  final List<Product> _wishlistItems = [];

  List<Product> get wishlistItems => [..._wishlistItems];

  int get wishlistCount => _wishlistItems.length;

  bool isFavorite(String productId) {
    return _wishlistItems.any((item) => item.id == productId);
  }

  void toggleFavorite(Product product) {
    final existingIndex =
        _wishlistItems.indexWhere((item) => item.id == product.id);
    if (existingIndex >= 0) {
      _wishlistItems.removeAt(existingIndex);
    } else {
      _wishlistItems.add(product);
    }
    notifyListeners();
  }
}

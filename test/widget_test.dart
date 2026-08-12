import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:flutter_ecommerce/providers/cart_provider.dart';
import 'package:flutter_ecommerce/providers/product_provider.dart';

void main() {
  group('E-Commerce App Unit Tests', () {
    test('ProductProvider loads products and filters by category', () {
      final provider = ProductProvider();
      expect(provider.products.length, greaterThan(0));

      provider.setCategory('Electronics');
      for (final p in provider.products) {
        expect(p.category, equals('Electronics'));
      }
    });

    test('CartProvider adds items, applies promo code, and calculates total correctly', () {
      final cart = CartProvider();
      const product = Product(
        id: 'test_p1',
        title: 'Test Earbuds',
        description: 'Test Description',
        price: 100.0,
        oldPrice: 120.0,
        rating: 4.5,
        reviewCount: 10,
        category: 'Electronics',
        imageUrl: 'http://example.com/img.jpg',
        availableColors: ['Black'],
        availableSizes: ['One Size'],
      );

      cart.addItem(product: product, selectedColor: 'Black', selectedSize: 'One Size');
      expect(cart.itemCount, equals(1));
      expect(cart.subtotalAmount, equals(100.0));

      // Apply valid promo code NEXUS10 (15% discount)
      final applied = cart.applyPromoCode('NEXUS10');
      expect(applied, isTrue);
      expect(cart.discountAmount, equals(15.0));

      // Clear cart
      cart.clearCart();
      expect(cart.itemCount, equals(0));
    });
  });
}

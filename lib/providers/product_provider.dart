import 'package:flutter/foundation.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    const Product(
      id: 'p1',
      title: 'Nexus Pro Wireless Headphones',
      description:
          'Experience high-fidelity spatial audio with active noise cancellation, 40-hour battery life, and ultra-comfortable memory foam ear cushions.',
      price: 249.99,
      oldPrice: 299.99,
      rating: 4.9,
      reviewCount: 328,
      category: 'Electronics',
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&q=80',
      assetPath: 'assets/products/p1.jpg',
      availableColors: ['Matte Black', 'Silver Grey', 'Midnight Blue'],
      availableSizes: ['Standard'],
      isFeatured: true,
    ),
    const Product(
      id: 'p2',
      title: 'Apex Smart Watch Ultra',
      description:
          'Precision titanium casing, OLED Retina touch display, dual-frequency GPS, health sensors, and 100m water resistance.',
      price: 399.99,
      oldPrice: 449.99,
      rating: 4.8,
      reviewCount: 215,
      category: 'Electronics',
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600&q=80',
      assetPath: 'assets/products/p2.jpg',
      availableColors: ['Titanium Gray', 'Ocean Blue', 'Orange Sport'],
      availableSizes: ['45mm', '49mm'],
      isFeatured: true,
    ),
    const Product(
      id: 'p3',
      title: 'Vanguard Leather Backpack',
      description:
          'Handcrafted premium full-grain leather backpack with dedicated 16" laptop compartment, waterproof zippers, and ergonomic airflow padding.',
      price: 159.00,
      oldPrice: 199.00,
      rating: 4.7,
      reviewCount: 142,
      category: 'Fashion',
      imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=600&q=80',
      assetPath: 'assets/products/p3.jpg',
      availableColors: ['Cognac Brown', 'Obsidian Black'],
      availableSizes: ['20L', '28L'],
      isFeatured: false,
    ),
    const Product(
      id: 'p4',
      title: 'Aura Studio Wireless Speaker',
      description:
          '360-degree ambient sound system with customizable RGB lighting ring, Bluetooth 5.3, and deep bass radiator.',
      price: 189.50,
      oldPrice: 220.00,
      rating: 4.6,
      reviewCount: 98,
      category: 'Electronics',
      imageUrl: 'https://images.unsplash.com/photo-1545454675-3531b543be5d?w=600&q=80',
      assetPath: 'assets/products/p4.jpg',
      availableColors: ['Snow White', 'Dark Graphite'],
      availableSizes: ['Compact', 'Max'],
      isFeatured: true,
    ),
    const Product(
      id: 'p5',
      title: 'Urban Runner Pro Sneakers',
      description:
          'Lightweight breathable mesh upper with high-rebound responsive cushioning sole for extreme comfort and modern street style.',
      price: 129.99,
      oldPrice: 150.00,
      rating: 4.8,
      reviewCount: 412,
      category: 'Fashion',
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600&q=80',
      assetPath: 'assets/products/p5.jpg',
      availableColors: ['Crimson Red', 'Neon Lime', 'Triple Black'],
      availableSizes: ['40', '41', '42', '43', '44'],
      isFeatured: false,
    ),
    const Product(
      id: 'p6',
      title: 'ErgoDesign Desk Lamp',
      description:
          'Smart LED desk light with wireless phone charging pad, touch dimming control, and color temperature adjustment (2700K - 6500K).',
      price: 79.99,
      oldPrice: 99.99,
      rating: 4.5,
      reviewCount: 84,
      category: 'Gadgets',
      imageUrl: 'https://images.unsplash.com/photo-1534073828943-f801091bb18c?w=600&q=80',
      assetPath: 'assets/products/p6.jpg',
      availableColors: ['Brushed Aluminum', 'Matte Black'],
      availableSizes: ['Standard'],
      isFeatured: false,
    ),
  ];

  String _selectedCategory = 'All';
  String _searchQuery = '';
  double? _maxPrice;
  String _priceSort = ''; // '', 'asc', 'desc'

  List<Product> get products {
    var list = _products.where((prod) {
      final matchesCategory =
          _selectedCategory == 'All' || prod.category == _selectedCategory;
      final matchesSearch = prod.title
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          prod.description.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesPrice = _maxPrice == null || prod.price <= _maxPrice!;
      return matchesCategory && matchesSearch && matchesPrice;
    }).toList();

    if (_priceSort == 'asc') {
      list.sort((a, b) => a.price.compareTo(b.price));
    } else if (_priceSort == 'desc') {
      list.sort((a, b) => b.price.compareTo(a.price));
    }
    return list;
  }

  List<Product> get featuredProducts =>
      _products.where((p) => p.isFeatured).toList();

  List<String> get categories =>
      ['All', 'Electronics', 'Fashion', 'Gadgets'];

  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Product findById(String id) {
    return _products.firstWhere((prod) => prod.id == id);
  }

  double? get maxPrice => _maxPrice;
  String get priceSort => _priceSort;

  void setMaxPrice(double? value) {
    _maxPrice = value;
    notifyListeners();
  }

  void setPriceSort(String value) {
    _priceSort = value;
    notifyListeners();
  }
}

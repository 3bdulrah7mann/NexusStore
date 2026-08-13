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

    // ===== New bulk products (offline assets) =====
    const Product(
      id: 'p7',
      title: 'Lumen Wireless Earbuds',
      description:
          'Compact true-wireless earbuds with active noise cancellation, 28-hour battery, and IPX5 sweat resistance.',
      price: 89.99,
      oldPrice: 110.00,
      rating: 4.4,
      reviewCount: 256,
      category: 'Electronics',
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&q=80',
      assetPath: 'assets/products/p7.jpg',
      availableColors: ['White', 'Black'],
      availableSizes: ['Standard'],
      isFeatured: false,
    ),
    const Product(
      id: 'p8',
      title: 'Trailblazer Sneakers',
      description:
          'All-terrain running shoes with rugged grip sole, breathable mesh, and responsive cushioning.',
      price: 119.00,
      oldPrice: 145.00,
      rating: 4.3,
      reviewCount: 178,
      category: 'Fashion',
      imageUrl: 'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=600&q=80',
      assetPath: 'assets/products/p8.jpg',
      availableColors: ['Steel Blue', 'Charcoal'],
      availableSizes: ['40', '41', '42', '43', '44'],
      isFeatured: false,
    ),
    const Product(
      id: 'p9',
      title: 'Velocity Sport Sneakers',
      description:
          'Lightweight performance sneakers with carbon plate and energy-return foam for speed.',
      price: 139.99,
      oldPrice: 165.00,
      rating: 4.6,
      reviewCount: 301,
      category: 'Fashion',
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600&q=80',
      assetPath: 'assets/products/p9.jpg',
      availableColors: ['Volt', 'Black'],
      availableSizes: ['39', '40', '41', '42', '43'],
      isFeatured: false,
    ),
    const Product(
      id: 'p10',
      title: 'Pulse Fitness Smartwatch',
      description:
          'Health-focused smartwatch with SpO2, sleep tracking, and 14-day battery on a single charge.',
      price: 179.00,
      oldPrice: 210.00,
      rating: 4.5,
      reviewCount: 233,
      category: 'Electronics',
      imageUrl: 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=600&q=80',
      assetPath: 'assets/products/p10.jpg',
      availableColors: ['Graphite', 'Rose Gold'],
      availableSizes: ['41mm', '45mm'],
      isFeatured: false,
    ),
    const Product(
      id: 'p11',
      title: 'Echo Studio Monitor',
      description:
          'Studio-grade bookshelf speakers with crisp highs and deep controlled bass for audiophiles.',
      price: 229.00,
      oldPrice: 275.00,
      rating: 4.7,
      reviewCount: 144,
      category: 'Electronics',
      imageUrl: 'https://images.unsplash.com/photo-1434056886845-dac89ffe9b56?w=600&q=80',
      assetPath: 'assets/products/p11.jpg',
      availableColors: ['Walnut', 'Black'],
      availableSizes: ['Pair'],
      isFeatured: false,
    ),
    const Product(
      id: 'p12',
      title: 'Nimbus Mechanical Keyboard',
      description:
          'Hot-swappable mechanical keyboard with RGB, aluminum frame, and tactile switches.',
      price: 99.50,
      oldPrice: 120.00,
      rating: 4.6,
      reviewCount: 312,
      category: 'Gadgets',
      imageUrl: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600&q=80',
      assetPath: 'assets/products/p12.jpg',
      availableColors: ['Silver', 'Black'],
      availableSizes: ['TKL', 'Full'],
      isFeatured: false,
    ),
    const Product(
      id: 'p13',
      title: 'Vogue Leather Tote',
      description:
          'Elegant everyday leather tote with laptop sleeve and magnetic closure.',
      price: 149.00,
      oldPrice: 185.00,
      rating: 4.4,
      reviewCount: 98,
      category: 'Fashion',
      imageUrl: 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=600&q=80',
      assetPath: 'assets/products/p13.jpg',
      availableColors: ['Tan', 'Black'],
      availableSizes: ['Medium', 'Large'],
      isFeatured: false,
    ),
    const Product(
      id: 'p14',
      title: 'Aero Ultra Laptop',
      description:
          'Thin-and-light laptop with 14" retina display, 16GB RAM, and all-day battery.',
      price: 899.00,
      oldPrice: 1099.00,
      rating: 4.8,
      reviewCount: 187,
      category: 'Electronics',
      imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600&q=80',
      assetPath: 'assets/products/p14.jpg',
      availableColors: ['Space Grey', 'Silver'],
      availableSizes: ['14"'],
      isFeatured: true,
    ),
    const Product(
      id: 'p15',
      title: 'FlexFit Training Tee',
      description:
          'Moisture-wicking athletic tee with four-way stretch and anti-odor fabric.',
      price: 29.99,
      oldPrice: 39.99,
      rating: 4.2,
      reviewCount: 421,
      category: 'Fashion',
      imageUrl: 'https://images.unsplash.com/photo-1491553895911-0055eca6402d?w=600&q=80',
      assetPath: 'assets/products/p15.jpg',
      availableColors: ['Coral', 'Navy', 'White'],
      availableSizes: ['S', 'M', 'L', 'XL'],
      isFeatured: false,
    ),
    const Product(
      id: 'p16',
      title: 'Chrono Sport Watch',
      description:
          'Analog-digital chronograph with stainless steel case and 100m water resistance.',
      price: 199.00,
      oldPrice: 240.00,
      rating: 4.5,
      reviewCount: 156,
      category: 'Fashion',
      imageUrl: 'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?w=600&q=80',
      assetPath: 'assets/products/p16.jpg',
      availableColors: ['Silver', 'Gold'],
      availableSizes: ['40mm', '44mm'],
      isFeatured: false,
    ),
    const Product(
      id: 'p17',
      title: 'Optix 4K Action Cam',
      description:
          'Pocket 4K action camera with stabilization, waterproof case, and voice control.',
      price: 249.00,
      oldPrice: 299.00,
      rating: 4.6,
      reviewCount: 203,
      category: 'Gadgets',
      imageUrl: 'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=600&q=80',
      assetPath: 'assets/products/p17.jpg',
      availableColors: ['Black', 'Camo'],
      availableSizes: ['Standard'],
      isFeatured: false,
    ),
    const Product(
      id: 'p18',
      title: 'Brew Master Coffee Maker',
      description:
          'Programmable drip coffee maker with thermal carafe and built-in grinder.',
      price: 89.00,
      oldPrice: 115.00,
      rating: 4.3,
      reviewCount: 134,
      category: 'Gadgets',
      imageUrl: 'https://images.unsplash.com/photo-1485955900006-10f4d324d411?w=600&q=80',
      assetPath: 'assets/products/p18.jpg',
      availableColors: ['Steel', 'Black'],
      availableSizes: ['Standard'],
      isFeatured: false,
    ),

    // ===== Additional bulk products (unique offline assets) =====
    const Product(
      id: 'p19',
      title: 'Smart LED Strip Lights',
      description:
          'App-controlled RGB LED strip with music sync, 16M colors, and voice assistant support.',
      price: 34.99,
      oldPrice: 49.99,
      rating: 4.3,
      reviewCount: 512,
      category: 'Gadgets',
      imageUrl: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=600&q=80',
      assetPath: 'assets/products/p19.jpg',
      availableColors: ['RGB', 'White'],
      availableSizes: ['2M', '5M'],
      isFeatured: false,
    ),
    const Product(
      id: 'p20',
      title: 'Cozy Knit Sweater',
      description:
          'Soft merino wool sweater with ribbed cuffs and a relaxed fit for cold days.',
      price: 59.00,
      oldPrice: 79.00,
      rating: 4.4,
      reviewCount: 167,
      category: 'Fashion',
      imageUrl: 'https://images.unsplash.com/photo-1556906781-9a412961c28c?w=600&q=80',
      assetPath: 'assets/products/p20.jpg',
      availableColors: ['Cream', 'Olive', 'Charcoal'],
      availableSizes: ['S', 'M', 'L', 'XL'],
      isFeatured: false,
    ),
    const Product(
      id: 'p21',
      title: 'Minimalist Wristwatch',
      description:
          'Slim Japanese-quartz watch with mesh strap and minimal dial.',
      price: 109.00,
      oldPrice: 139.00,
      rating: 4.5,
      reviewCount: 221,
      category: 'Fashion',
      imageUrl: 'https://images.unsplash.com/photo-1556909212-d5b604d0c90d?w=600&q=80',
      assetPath: 'assets/products/p21.jpg',
      availableColors: ['Silver', 'Gold', 'Black'],
      availableSizes: ['38mm', '42mm'],
      isFeatured: false,
    ),
    const Product(
      id: 'p22',
      title: 'Ceramic Plant Pot Set',
      description:
          'Set of 3 matte ceramic pots with drainage trays for succulents and herbs.',
      price: 24.50,
      oldPrice: 34.00,
      rating: 4.6,
      reviewCount: 389,
      category: 'Gadgets',
      imageUrl: 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=600&q=80',
      assetPath: 'assets/products/p22.jpg',
      availableColors: ['White', 'Terracotta', 'Sage'],
      availableSizes: ['Small', 'Medium'],
      isFeatured: false,
    ),
    const Product(
      id: 'p23',
      title: 'Wireless Charging Pad',
      description:
          '15W fast wireless charger with anti-slip surface and LED indicator.',
      price: 29.99,
      oldPrice: 39.99,
      rating: 4.3,
      reviewCount: 274,
      category: 'Electronics',
      imageUrl: 'https://images.unsplash.com/photo-1512496015851-a90fb38ba796?w=600&q=80',
      assetPath: 'assets/products/p23.jpg',
      availableColors: ['Black', 'White'],
      availableSizes: ['Standard'],
      isFeatured: false,
    ),
    const Product(
      id: 'p24',
      title: 'Aqua Bottle Steel',
      description:
          'Insulated stainless steel bottle keeps drinks cold 24h / hot 12h.',
      price: 22.00,
      oldPrice: 29.00,
      rating: 4.7,
      reviewCount: 633,
      category: 'Gadgets',
      imageUrl: 'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=600&q=80',
      assetPath: 'assets/products/p24.jpg',
      availableColors: ['Steel', 'Midnight', 'Rose'],
      availableSizes: ['500ml', '750ml'],
      isFeatured: false,
    ),
    const Product(
      id: 'p25',
      title: 'Smart Plug 4-Pack',
      description:
          'WiFi smart plugs with timer and voice control, no hub required.',
      price: 39.99,
      oldPrice: 54.99,
      rating: 4.4,
      reviewCount: 458,
      category: 'Gadgets',
      imageUrl: 'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=600&q=80',
      assetPath: 'assets/products/p25.jpg',
      availableColors: ['White'],
      availableSizes: ['4-Pack'],
      isFeatured: false,
    ),
    const Product(
      id: 'p26',
      title: 'Leather Card Wallet',
      description:
          'Slim full-grain leather wallet with RFID blocking and 6 card slots.',
      price: 34.00,
      oldPrice: 45.00,
      rating: 4.5,
      reviewCount: 199,
      category: 'Fashion',
      imageUrl: 'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=600&q=80',
      assetPath: 'assets/products/p26.jpg',
      availableColors: ['Brown', 'Black'],
      availableSizes: ['Standard'],
      isFeatured: false,
    ),
    const Product(
      id: 'p27',
      title: 'Bluetooth Speaker Mini',
      description:
          'Pocket-sized waterproof speaker with 12h playtime and bass radiator.',
      price: 44.99,
      oldPrice: 59.99,
      rating: 4.4,
      reviewCount: 312,
      category: 'Electronics',
      imageUrl: 'https://images.unsplash.com/photo-1556228720-195a672e8a03?w=600&q=80',
      assetPath: 'assets/products/p27.jpg',
      availableColors: ['Coral', 'Black', 'Blue'],
      availableSizes: ['Standard'],
      isFeatured: false,
    ),
    const Product(
      id: 'p28',
      title: 'Desk Organizer Oak',
      description:
          'Wooden desk organizer with phone stand, pen holder and cable tray.',
      price: 27.50,
      oldPrice: 36.00,
      rating: 4.3,
      reviewCount: 143,
      category: 'Gadgets',
      imageUrl: 'https://images.unsplash.com/photo-1606220588913-b3aacb4d2f46?w=600&q=80',
      assetPath: 'assets/products/p28.jpg',
      availableColors: ['Oak', 'Walnut'],
      availableSizes: ['Standard'],
      isFeatured: false,
    ),
    const Product(
      id: 'p29',
      title: 'Fitness Resistance Bands',
      description:
          '5-level latex resistance bands set with door anchor and guides.',
      price: 19.99,
      oldPrice: 28.00,
      rating: 4.6,
      reviewCount: 521,
      category: 'Fashion',
      imageUrl: 'https://images.unsplash.com/photo-1611930022073-b7a4ba5fcccd?w=600&q=80',
      assetPath: 'assets/products/p29.jpg',
      availableColors: ['Multi'],
      availableSizes: ['Set'],
      isFeatured: false,
    ),
    const Product(
      id: 'p30',
      title: 'Vintage Camera Film',
      description:
          'Retro point-and-shoot 35mm camera with built-in flash and lanyard.',
      price: 89.00,
      oldPrice: 119.00,
      rating: 4.5,
      reviewCount: 188,
      category: 'Electronics',
      imageUrl: 'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=600&q=80',
      assetPath: 'assets/products/p30.jpg',
      availableColors: ['Black', 'Silver'],
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

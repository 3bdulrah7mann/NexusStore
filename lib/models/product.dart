class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final double oldPrice;
  final double rating;
  final int reviewCount;
  final String category;
  final String imageUrl;
  final List<String> availableColors;
  final List<String> availableSizes;
  final bool isFeatured;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviewCount,
    required this.category,
    required this.imageUrl,
    required this.availableColors,
    required this.availableSizes,
    this.isFeatured = false,
  });

  double get discountPercentage {
    if (oldPrice <= price) return 0;
    return (((oldPrice - price) / oldPrice) * 100).roundToDouble();
  }
}

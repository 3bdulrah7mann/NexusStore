import 'package:flutter/foundation.dart';

class OrderItem {
  final String productTitle;
  final String imageUrl;
  final double price;
  final int quantity;
  final String selectedColor;
  final String selectedSize;

  OrderItem({
    required this.productTitle,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.selectedColor,
    required this.selectedSize,
  });

  double get totalPrice => price * quantity;
}

class Order {
  final String id;
  final DateTime date;
  final List<OrderItem> items;
  final double totalAmount;
  final String address;
  final String paymentMethod;

  Order({
    required this.id,
    required this.date,
    required this.items,
    required this.totalAmount,
    required this.address,
    required this.paymentMethod,
  });
}

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  int get orderCount => _orders.length;

  void addOrder({
    required List<OrderItem> items,
    required double totalAmount,
    required String address,
    required String paymentMethod,
  }) {
    final order = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      date: DateTime.now(),
      items: items,
      totalAmount: totalAmount,
      address: address,
      paymentMethod: paymentMethod,
    );
    _orders.insert(0, order);
    notifyListeners();
  }

  void clearOrders() {
    _orders.clear();
    notifyListeners();
  }
}

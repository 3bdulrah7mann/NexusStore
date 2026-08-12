import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/product_provider.dart';
import 'providers/wishlist_provider.dart';
import 'theme/app_theme.dart';
import 'views/main_screen.dart';

void main() {
  runApp(const NexusStoreApp());
}

class NexusStoreApp extends StatelessWidget {
  const NexusStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: MaterialApp(
        title: 'Nexus Store E-Commerce',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: MainScreen(),
        ),
      ),
    );
  }
}

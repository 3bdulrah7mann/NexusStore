import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/product_provider.dart';
import 'providers/wishlist_provider.dart';
import 'providers/order_provider.dart';
import 'theme/app_theme.dart';
import 'views/main_screen.dart';
import 'views/splash_screen.dart';
import 'views/login_screen.dart';
import 'views/signup_screen.dart';

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
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MaterialApp(
        title: 'Nexus Store E-Commerce',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const Directionality(
                textDirection: TextDirection.rtl,
                child: LoginScreen(),
              ),
          '/signup': (context) => const Directionality(
                textDirection: TextDirection.rtl,
                child: SignUpScreen(),
              ),
          '/main': (context) => const Directionality(
                textDirection: TextDirection.rtl,
                child: MainScreen(),
              ),
        },
      ),
    );
  }
}

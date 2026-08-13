import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/wishlist_provider.dart';
import '../providers/order_provider.dart';
import '../theme/app_theme.dart';
import 'cart_tab.dart';
import 'home_tab.dart';
import 'wishlist_tab.dart';
import 'profile_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const HomeTab(),
    const WishlistTab(),
    const CartTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final wishlist = Provider.of<WishlistProvider>(context);
    final orders = Provider.of<OrderProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                isLabelVisible: wishlist.wishlistCount > 0,
                label: Text('${wishlist.wishlistCount}'),
                backgroundColor: AppColors.accent,
                child: const Icon(Icons.favorite_border_rounded),
              ),
              activeIcon: Badge(
                isLabelVisible: wishlist.wishlistCount > 0,
                label: Text('${wishlist.wishlistCount}'),
                backgroundColor: AppColors.accent,
                child: const Icon(Icons.favorite_rounded),
              ),
              label: 'المفضلة',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                isLabelVisible: cart.itemCount > 0,
                label: Text('${cart.itemCount}'),
                backgroundColor: AppColors.primary,
                child: const Icon(Icons.shopping_cart_outlined),
              ),
              activeIcon: Badge(
                isLabelVisible: cart.itemCount > 0,
                label: Text('${cart.itemCount}'),
                backgroundColor: AppColors.primary,
                child: const Icon(Icons.shopping_cart_rounded),
              ),
              label: 'السلة',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                isLabelVisible: orders.orderCount > 0,
                label: Text('${orders.orderCount}'),
                backgroundColor: AppColors.success,
                child: const Icon(Icons.person_outline_rounded),
              ),
              activeIcon: Badge(
                isLabelVisible: orders.orderCount > 0,
                label: Text('${orders.orderCount}'),
                backgroundColor: AppColors.success,
                child: const Icon(Icons.person_rounded),
              ),
              label: 'حسابي',
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/category_chip.dart';
import '../widgets/product_card.dart';
import '../widgets/search_bar_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;
    final categories = productProvider.categories;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final subTextColor = isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);
    final iconBg = isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0);
    final iconBorder = isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1);

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // App Header Bar
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مرحباً بك 👋',
                        style: TextStyle(
                          color: subTextColor,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Nexus Store ⚡',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: iconBg,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: iconBorder),
                    ),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: textColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Search Bar Widget
          const SliverToBoxAdapter(child: SearchBarWidget()),

          // Banner Carousel
          const SliverToBoxAdapter(child: BannerCarousel()),

          // Category Chips List
          SliverToBoxAdapter(
            child: SizedBox(
              height: 44,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return CategoryChip(
                    title: cat,
                    isSelected: cat == productProvider.selectedCategory,
                    onTap: () => productProvider.setCategory(cat),
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // Price Sort & Filter Row
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _PriceChip(
                    label: 'السعر ↑',
                    isSelected: productProvider.priceSort == 'asc',
                    onTap: () => productProvider
                        .setPriceSort(productProvider.priceSort == 'asc' ? '' : 'asc'),
                  ),
                  const SizedBox(width: 8),
                  _PriceChip(
                    label: 'السعر ↓',
                    isSelected: productProvider.priceSort == 'desc',
                    onTap: () => productProvider.setPriceSort(
                        productProvider.priceSort == 'desc' ? '' : 'desc'),
                  ),
                  const SizedBox(width: 8),
                  _PriceChip(
                    label: '< \$100',
                    isSelected: productProvider.maxPrice == 100,
                    onTap: () => productProvider
                        .setMaxPrice(productProvider.maxPrice == 100 ? null : 100),
                  ),
                  const SizedBox(width: 8),
                  _PriceChip(
                    label: '< \$200',
                    isSelected: productProvider.maxPrice == 200,
                    onTap: () => productProvider
                        .setMaxPrice(productProvider.maxPrice == 200 ? null : 200),
                  ),
                  const SizedBox(width: 8),
                  _PriceChip(
                    label: '< \$300',
                    isSelected: productProvider.maxPrice == 300,
                    onTap: () => productProvider
                        .setMaxPrice(productProvider.maxPrice == 300 ? null : 300),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المنتجات المتاحة (${products.length})',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'عرض الكل',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          // Products Grid
          products.isEmpty
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: Text(
                        'عذراً، لم يتم العثور على منتجات مطابقة لـ بحثك.',
                        style: TextStyle(
                          color: isDark ? Colors.white54 : const Color(0xFF64748B),
                        ),
                      ),
                    ),
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.72,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ProductCard(product: products[index]);
                      },
                      childCount: products.length,
                    ),
                  ),
                ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class _PriceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PriceChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final chipBg = isDark ? AppColors.darkCard : AppColors.lightCard;
    final chipBorder = isDark ? AppColors.darkCardBorder : AppColors.lightCardBorder;
    final chipText = isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: isSelected
            ? AppTheme.primaryGradientDecoration
            : BoxDecoration(
                color: chipBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: chipBorder),
              ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : chipText,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

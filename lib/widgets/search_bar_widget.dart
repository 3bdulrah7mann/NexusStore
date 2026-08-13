import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../theme/app_theme.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.darkCard : AppColors.lightCard;
    final border = isDark ? AppColors.darkCardBorder : AppColors.lightCardBorder;
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final hintColor = isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.15)
                : Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          productProvider.setSearchQuery(value);
        },
        style: TextStyle(color: textColor, fontSize: 15),
        decoration: InputDecoration(
          icon: const Icon(Icons.search, color: AppColors.primary),
          hintText: 'ابحث عن منتج، سماعات، ساعتك...',
          hintStyle: TextStyle(color: hintColor, fontSize: 14),
          border: InputBorder.none,
          suffixIcon: productProvider.searchQuery.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear,
                      color: isDark ? Colors.white70 : Colors.grey, size: 18),
                  onPressed: () {
                    productProvider.setSearchQuery('');
                  },
                )
              : Icon(Icons.tune, color: hintColor, size: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../theme/app_theme.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.darkCardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          productProvider.setSearchQuery(value);
        },
        style: const TextStyle(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
          icon: const Icon(Icons.search, color: AppColors.primary),
          hintText: 'ابحث عن منتج، سماعات، ساعتك...',
          hintStyle: const TextStyle(color: Color(0xFF64748B), fontSize: 14),
          border: InputBorder.none,
          suffixIcon: productProvider.searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white70, size: 18),
                  onPressed: () {
                    productProvider.setSearchQuery('');
                  },
                )
              : const Icon(Icons.tune, color: Color(0xFF64748B), size: 20),
        ),
      ),
    );
  }
}

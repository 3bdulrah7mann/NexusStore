import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CategoryChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  IconData _getCategoryIcon(String cat) {
    switch (cat) {
      case 'Electronics':
        return Icons.devices_other;
      case 'Fashion':
        return Icons.checkroom;
      case 'Gadgets':
        return Icons.lightbulb_outline;
      default:
        return Icons.grid_view_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final chipColor = isDark ? AppColors.darkCard : AppColors.lightCard;
    final chipBorder = isDark ? AppColors.darkCardBorder : AppColors.lightCardBorder;
    final unselColor = isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569);
    final unselText = isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: isSelected
            ? AppTheme.primaryGradientDecoration
            : BoxDecoration(
                color: chipColor,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: chipBorder),
              ),
        child: Row(
          children: [
            Icon(
              _getCategoryIcon(title),
              size: 18,
              color: isSelected ? Colors.white : unselColor,
            ),
            const SizedBox(width: 8),
            Text(
              title == 'All' ? 'الكل' : title,
              style: TextStyle(
                color: isSelected ? Colors.white : unselText,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

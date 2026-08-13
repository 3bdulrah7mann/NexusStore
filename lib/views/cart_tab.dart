import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/checkout_bottom_sheet.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final _promoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final itemsList = cart.items.values.toList();
    final itemKeys = cart.items.keys.toList();

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        title: Text('سلة التسوق (${cart.itemCount})'),
        actions: [
          if (itemsList.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              onPressed: () => cart.clearCart(),
            ),
        ],
      ),
      body: itemsList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Color(0xFF475569),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'سلة التسوق فارغة حالياً',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'قم بإضافة المنتجات المفضلة لديك لبدء الشراء.',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: itemsList.length,
                    itemBuilder: (context, index) {
                      final item = itemsList[index];
                      final cartKey = itemKeys[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.darkCard,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.darkCardBorder),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                item.product.assetPath,
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                                errorBuilder: (_, _, _) => Container(
                                  color: Colors.grey[800],
                                  child: const Icon(Icons.image_not_supported,
                                      color: Colors.white54),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.product.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'اللون: ${item.selectedColor} | المقاس: ${item.selectedSize}',
                                    style: const TextStyle(
                                      color: Color(0xFF94A3B8),
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '\$${item.product.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: AppColors.primaryGradientStart,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Quantity controls (+ / -)
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline,
                                      color: Color(0xFF94A3B8), size: 22),
                                  onPressed: () =>
                                      cart.removeSingleItem(cartKey),
                                ),
                                Text(
                                  '${item.quantity}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline,
                                      color: AppColors.primary, size: 22),
                                  onPressed: () => cart.addItem(
                                    product: item.product,
                                    selectedColor: item.selectedColor,
                                    selectedSize: item.selectedSize,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Promo code and Summary Panel
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: AppColors.darkCard,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                    border: Border(
                      top: BorderSide(color: AppColors.darkCardBorder),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Promo Code Field
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _promoController,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13),
                              decoration: InputDecoration(
                                hintText: 'أدخل كود الخصم (مثال: NEXUS10)',
                                hintStyle: const TextStyle(
                                    color: Color(0xFF64748B), fontSize: 12),
                                filled: true,
                                fillColor: AppColors.darkBackground,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 10),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.accent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              final success =
                                  cart.applyPromoCode(_promoController.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    success
                                        ? 'تم تطبيق خصم 15% بنجاح! 🎁'
                                        : 'كود الخصم غير صحيح أو منتهي الصلاحية.',
                                  ),
                                  backgroundColor: success
                                      ? AppColors.success
                                      : Colors.redAccent,
                                ),
                              );
                            },
                            child: const Text('تطبيق',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Breakdown rows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('المبلغ الفرعي:',
                              style: TextStyle(
                                  color: Color(0xFF94A3B8), fontSize: 13)),
                          Text('\$${cart.subtotalAmount.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13)),
                        ],
                      ),
                      if (cart.discountAmount > 0) ...[
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'الخصم (${cart.appliedPromoCode}):',
                              style: const TextStyle(
                                  color: AppColors.accent, fontSize: 13),
                            ),
                            Text(
                              '-\$${cart.discountAmount.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  color: AppColors.accent, fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('مصاريف الشحن:',
                              style: TextStyle(
                                  color: Color(0xFF94A3B8), fontSize: 13)),
                          Text(
                            cart.shippingFee == 0
                                ? 'مجاني 🎉'
                                : '\$${cart.shippingFee.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: cart.shippingFee == 0
                                  ? AppColors.success
                                  : Colors.white,
                              fontSize: 13,
                              fontWeight: cart.shippingFee == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                          color: AppColors.darkCardBorder, height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'الإجمالي النهائي:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${cart.totalAmount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: AppColors.primaryGradientStart,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => const CheckoutBottomSheet(),
                            );
                          },
                          child: const Text(
                            'متابعة إتمام الدفع 🚀',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/order_provider.dart';
import '../theme/app_theme.dart';
import 'order_success_dialog.dart';

class CheckoutBottomSheet extends StatefulWidget {
  const CheckoutBottomSheet({super.key});

  @override
  State<CheckoutBottomSheet> createState() => _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends State<CheckoutBottomSheet> {
  int _selectedPaymentIndex = 0;
  final _addressController =
      TextEditingController(text: 'القاهرة، مصر - شارع التحرير، بناء رقم 12');

  final List<Map<String, dynamic>> _paymentMethods = [
    {'name': 'بطاقة ائتمان / الفيزا', 'icon': Icons.credit_card},
    {'name': 'Apple Pay / Google Pay', 'icon': Icons.account_balance_wallet},
    {'name': 'الدفع عند الاستلام', 'icon': Icons.payments},
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Container(
      padding: EdgeInsets.only(
        top: 24,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: const BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'إتمام الدفع واختيار العنوان',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white54),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const Divider(color: AppColors.darkCardBorder),
          const SizedBox(height: 12),
          const Text(
            'عنوان الشحن:',
            style: TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: _addressController,
            style: const TextStyle(color: Colors.white, fontSize: 13),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.darkBackground,
              prefixIcon:
                  const Icon(Icons.location_on, color: AppColors.primary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.darkCardBorder),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'طريقة الدفع المفضلة:',
            style: TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Column(
            children: List.generate(_paymentMethods.length, (index) {
              final isSelected = _selectedPaymentIndex == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedPaymentIndex = index),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary.withValues(alpha: 0.15)
                        : AppColors.darkBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.darkCardBorder,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _paymentMethods[index]['icon'] as IconData,
                        color:
                            isSelected ? AppColors.primary : Colors.white70,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        _paymentMethods[index]['name'] as String,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        isSelected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: isSelected
                            ? AppColors.primary
                            : Colors.white38,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'المبلغ الإجمالي المطلوب:',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Text(
                '\$${cart.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: AppColors.primaryGradientStart,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
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
                // Record the order before clearing the cart.
                final orderItems = cart.items.values
                    .map((ci) => OrderItem(
                          productTitle: ci.product.title,
                          imageUrl: ci.product.imageUrl,
                          price: ci.product.price,
                          quantity: ci.quantity,
                          selectedColor: ci.selectedColor,
                          selectedSize: ci.selectedSize,
                        ))
                    .toList();
                final address = _addressController.text.trim();
                final paymentMethod =
                    _paymentMethods[_selectedPaymentIndex]['name'] as String;
                Provider.of<OrderProvider>(context, listen: false)
                    .addOrder(
                  items: orderItems,
                  totalAmount: cart.totalAmount,
                  address: address,
                  paymentMethod: paymentMethod,
                );
                Navigator.of(context).pop();
                cart.clearCart();
                showDialog(
                  context: context,
                  builder: (_) => const OrderSuccessDialog(),
                );
              },
              child: const Text(
                'تأكيد الدفع وشراء الطلب',
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
    );
  }
}

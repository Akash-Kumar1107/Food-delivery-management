import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../services/app_state.dart';
import '../../widgets/custom_button.dart';
import 'order_tracking_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final AppState appState;

  const CheckoutScreen({super.key, required this.appState});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPayment = 'UPI / Google Pay';
  final List<String> _paymentMethods = [
    'UPI / Google Pay',
    'Credit / Debit Card',
    'Cash at Counter'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Checkout', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Summary',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
                        ],
                      ),
                      child: Column(
                        children: [
                          ...widget.appState.cart.map((item) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${item.quantity}x ${item.food.name}',
                                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      '₹${item.totalPrice.toStringAsFixed(2)}',
                                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.primary),
                                    ),
                                  ],
                                ),
                              )),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                '₹${widget.appState.cartTotal.toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppColors.primary),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Payment Method',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark),
                    ),
                    const SizedBox(height: 16),
                    ..._paymentMethods.map((method) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedPayment = method),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: _selectedPayment == method ? AppColors.primary : Colors.transparent,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    _getPaymentIcon(method),
                                    color: _selectedPayment == method ? AppColors.primary : Colors.grey.shade600,
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    method,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: _selectedPayment == method ? FontWeight.bold : FontWeight.w500,
                                      color: _selectedPayment == method ? AppColors.primary : AppColors.textDark,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (_selectedPayment == method)
                                    const Icon(Icons.check_circle, color: AppColors.primary),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
                ],
              ),
              child: CustomButton(
                text: 'Confirm & Pay ₹${widget.appState.cartTotal.toStringAsFixed(2)}',
                onPressed: () {
                  final order = widget.appState.placeOrder(_selectedPayment);
                  if (order != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OrderTrackingScreen(appState: widget.appState, orderId: order.id),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getPaymentIcon(String method) {
    if (method.contains('UPI')) return Icons.qr_code_scanner;
    if (method.contains('Card')) return Icons.credit_card;
    return Icons.money;
  }
}

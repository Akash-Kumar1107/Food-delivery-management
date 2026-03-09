import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/food_model.dart';
import '../../services/app_state.dart';

class FoodDetailsScreen extends StatefulWidget {
  final FoodItem food;
  final AppState appState;

  const FoodDetailsScreen({super.key, required this.food, required this.appState});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    widget.appState.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    widget.appState.removeListener(_onStateChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final food = widget.food;
    final isWishlisted = widget.appState.isInWishlist(food.id);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        food.imageUrl,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, err, st) => Container(
                          height: 300,
                          color: Colors.grey.shade200,
                          child: const Center(child: Icon(Icons.fastfood, size: 60, color: Colors.grey)),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 8,
                        left: 16,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(12)),
                            child: const Icon(Icons.arrow_back_ios_new, size: 18),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 8,
                        right: 16,
                        child: GestureDetector(
                          onTap: () => widget.appState.toggleWishlist(food),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(12)),
                            child: Icon(
                              isWishlisted ? Icons.favorite : Icons.favorite_border,
                              color: isWishlisted ? Colors.red : Colors.grey,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: food.isVeg ? Colors.green : Colors.red.shade700,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                food.isVeg ? 'VEG' : 'NON-VEG',
                                style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                food.block,
                                style: const TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(food.name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColors.textDark)),
                        const SizedBox(height: 6),
                        Text(food.category, style: TextStyle(fontSize: 14, color: Colors.grey.shade500)),
                        const SizedBox(height: 16),
                        Text(food.description, style: const TextStyle(fontSize: 15, color: AppColors.textLight, height: 1.5)),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            _infoCard(Icons.access_time, '15-20 min', 'Delivery'),
                            const SizedBox(width: 12),
                            _infoCard(Icons.star, '4.5', 'Rating'),
                            const SizedBox(width: 12),
                            _infoCard(Icons.local_fire_department, '250 cal', 'Calories'),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            const Text('Quantity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove, size: 18),
                                    onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Text('$_quantity', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add, size: 18),
                                    onPressed: () => setState(() => _quantity++),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 15, offset: const Offset(0, -5))],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Total Price', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text(
                        '\u20B9${(food.price * _quantity).toInt()}',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.textDark),
                      ),
                    ],
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        for (int i = 0; i < _quantity; i++) {
                          widget.appState.addToCart(food);
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$_quantity x ${food.name} added to cart!'),
                            backgroundColor: AppColors.primary,
                            duration: const Duration(seconds: 1),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6))],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.shopping_bag_outlined, color: Colors.white),
                            SizedBox(width: 8),
                            Text('Add to Cart', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(IconData icon, String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary, size: 22),
            const SizedBox(height: 6),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(color: Colors.grey.shade400, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}

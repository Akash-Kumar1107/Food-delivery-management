import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/food_model.dart';
import '../../services/app_state.dart';
import 'food_details.dart';

class WishlistScreen extends StatefulWidget {
  final AppState appState;

  const WishlistScreen({super.key, required this.appState});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  AppState get appState => widget.appState;

  @override
  void initState() {
    super.initState();
    appState.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    appState.removeListener(_onStateChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wishlistItems = appState.wishlist;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textDark, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('My Wishlist', style: TextStyle(fontWeight: FontWeight.w800, color: AppColors.textDark)),
        centerTitle: true,
      ),
      body: wishlistItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  Text('Your wishlist is empty', style: TextStyle(fontSize: 18, color: Colors.grey.shade400, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text('Save your favorites for later!', style: TextStyle(fontSize: 14, color: Colors.grey.shade400)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final food = wishlistItems[index];
                return _buildWishlistTile(food);
              },
            ),
    );
  }

  Widget _buildWishlistTile(FoodItem food) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FoodDetailsScreen(food: food, appState: appState))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3))],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                food.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, st) => Container(width: 80, height: 80, color: Colors.grey.shade200, child: const Icon(Icons.fastfood, color: Colors.grey)),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.textDark), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text('${food.block} - ${food.category}', style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
                  const SizedBox(height: 8),
                  Text('\u20B9${food.price.toInt()}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.primary)),
                ],
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () => appState.toggleWishlist(food),
                  child: const Icon(Icons.favorite, color: Colors.red, size: 24),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    appState.addToCart(food);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${food.name} added to cart!'), backgroundColor: AppColors.primary, duration: const Duration(seconds: 1)),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../data/menu_data.dart';
import '../../models/food_model.dart';
import '../../services/app_state.dart';
import '../../widgets/food_card.dart';
import 'food_details.dart';
import 'cart_screen.dart';
import 'wishlist_screen.dart';
import 'orders_screen.dart';
import '../auth/login_screen.dart';
import '../admin/add_food_screen.dart';

class StudentHomeScreen extends StatefulWidget {
  final AppState appState;

  const StudentHomeScreen({super.key, required this.appState});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedCategory = '';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  AppState get appState => widget.appState;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: MenuData.blocks.length, vsync: this);
    _tabController.addListener(_onTabChanged);
    _selectedCategory = '';
    appState.addListener(_onStateChanged);
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    setState(() {
      _selectedCategory = '';
      _searchQuery = '';
      _searchController.clear();
    });
  }

  void _onStateChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    _searchController.dispose();
    appState.removeListener(_onStateChanged);
    super.dispose();
  }

  String get _currentBlock => MenuData.blocks[_tabController.index];

  List<FoodItem> get _filteredItems {
    List<FoodItem> items = MenuData.itemsForBlock(_currentBlock).toList();
    items.addAll(appState.customFoods.where((f) => f.block == _currentBlock));
    if (_selectedCategory.isNotEmpty) {
      items = items.where((i) => i.category == _selectedCategory).toList();
    }
    if (_searchQuery.isNotEmpty) {
      items = items.where((i) => i.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddFoodScreen(appState: appState))),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            _buildBlockTabs(),
            _buildCategoryChips(),
            Expanded(child: _buildFoodGrid()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hey Student!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.textDark)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => WishlistScreen(appState: appState))),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2)),
              ]),
              child: Stack(
                children: [
                  const Icon(Icons.favorite_border, color: AppColors.secondary, size: 22),
                  if (appState.wishlist.isNotEmpty)
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
                        child: Text('${appState.wishlist.length}', style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OrdersScreen(appState: appState))),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2)),
              ]),
              child: Stack(
                children: [
                  const Icon(Icons.receipt_long, color: AppColors.secondary, size: 22),
                  if (appState.activeOrders.isNotEmpty)
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
                        child: Text('${appState.activeOrders.length}', style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen(appState: appState))),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2)),
              ]),
              child: Stack(
                children: [
                  const Icon(Icons.shopping_bag_outlined, color: AppColors.primary, size: 22),
                  if (appState.cartCount > 0)
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                        child: Text('${appState.cartCount}', style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
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

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3))],
        ),
        child: TextField(
          controller: _searchController,
          onChanged: (v) => setState(() => _searchQuery = v),
          decoration: InputDecoration(
            hintText: 'Search for food...',
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
            suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(icon: const Icon(Icons.close, size: 18), onPressed: () { _searchController.clear(); setState(() => _searchQuery = ''); })
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildBlockTabs() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      labelColor: AppColors.primary,
      unselectedLabelColor: Colors.grey.shade500,
      indicatorColor: AppColors.primary,
      indicatorWeight: 3,
      labelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      tabs: MenuData.blocks.map((b) => Tab(text: b)).toList(),
    );
  }

  Widget _buildCategoryChips() {
    final cats = MenuData.categoriesForBlock(_currentBlock);
    return SizedBox(
      height: 48,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        scrollDirection: Axis.horizontal,
        itemCount: cats.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            final isSelected = _selectedCategory.isEmpty;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: const Text('All'),
                selected: isSelected,
                onSelected: (_) => setState(() => _selectedCategory = ''),
                selectedColor: AppColors.primary,
                labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.grey.shade600, fontWeight: FontWeight.w600, fontSize: 12),
                backgroundColor: Colors.white,
                side: BorderSide(color: isSelected ? AppColors.primary : Colors.grey.shade300),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            );
          }
          final cat = cats[index - 1];
          final isSelected = _selectedCategory == cat;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(cat),
              selected: isSelected,
              onSelected: (_) => setState(() => _selectedCategory = isSelected ? '' : cat),
              selectedColor: AppColors.primary,
              labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.grey.shade600, fontWeight: FontWeight.w600, fontSize: 12),
              backgroundColor: Colors.white,
              side: BorderSide(color: isSelected ? AppColors.primary : Colors.grey.shade300),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFoodGrid() {
    final items = _filteredItems;
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.no_food, size: 64, color: Colors.grey.shade300),
            const SizedBox(height: 12),
            Text('No items found', style: TextStyle(color: Colors.grey.shade400, fontSize: 16)),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final food = items[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: FoodCard(
            food: food,
            isInWishlist: appState.isInWishlist(food.id),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FoodDetailsScreen(food: food, appState: appState))),
            onAddToCart: () {
              appState.addToCart(food);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${food.name} added to cart!'), duration: const Duration(seconds: 1), backgroundColor: AppColors.primary),
              );
            },
            onToggleWishlist: () => appState.toggleWishlist(food),
          ),
        );
      },
    );
  }
}

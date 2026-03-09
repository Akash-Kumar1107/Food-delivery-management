class FoodItem {
  final String id;
  final String name;
  final String category;
  final String block;
  final double price;
  final String imageUrl;
  final String description;
  final bool isVeg;

  const FoodItem({
    required this.id,
    required this.name,
    required this.category,
    required this.block,
    required this.price,
    required this.imageUrl,
    this.description = '',
    this.isVeg = true,
  });
}

class CartItem {
  final FoodItem food;
  int quantity;

  CartItem({required this.food, this.quantity = 1});

  double get totalPrice => food.price * quantity;
}

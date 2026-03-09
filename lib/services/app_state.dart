import 'package:flutter/material.dart';
import '../models/food_model.dart';
import '../models/order_model.dart';
import 'dart:async';

class AppState extends ChangeNotifier {
  final List<CartItem> _cart = [];
  final List<FoodItem> _wishlist = [];
  final List<FoodItem> _customFoods = [];
  final List<Order> _activeOrders = []; // New

  List<CartItem> get cart => _cart;
  List<FoodItem> get wishlist => _wishlist;
  List<FoodItem> get customFoods => _customFoods;
  List<Order> get activeOrders => _activeOrders; // New

  int get cartCount => _cart.fold<int>(0, (sum, item) => sum + item.quantity);
  double get cartTotal => _cart.fold<double>(0.0, (sum, item) => sum + item.totalPrice);

  // --- Admin ---
  void addCustomFood(FoodItem food) {
    _customFoods.add(food);
    notifyListeners();
  }

  // --- Orders ---
  Order? placeOrder(String paymentMethod) {
    if (_cart.isEmpty) return null;

    final newOrder = Order(
      id: 'ORD-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}',
      items: List.from(_cart),
      totalAmount: cartTotal,
      timestamp: DateTime.now(),
      status: OrderStatus.placed,
      paymentMethod: paymentMethod,
    );

    _activeOrders.insert(0, newOrder);
    _cart.clear();
    notifyListeners();

    // Mock progress for demonstration purposes
    _simulateOrderProgress(newOrder.id);
    
    return newOrder;
  }

  void _simulateOrderProgress(String orderId) {
    // Wait 5 seconds, move to cooking
    Timer(const Duration(seconds: 5), () {
      updateOrderStatus(orderId, OrderStatus.preparing);
      
      // Wait another 10 seconds, move to ready
      Timer(const Duration(seconds: 10), () {
        updateOrderStatus(orderId, OrderStatus.ready);
      });
    });
  }

  void updateOrderStatus(String orderId, OrderStatus newStatus) {
    final index = _activeOrders.indexWhere((o) => o.id == orderId);
    if (index != -1) {
      final currentOrder = _activeOrders[index];
      _activeOrders[index] = currentOrder.copyWith(status: newStatus);
      notifyListeners();
    }
  }

  void markOrderCollected(String orderId) {
    updateOrderStatus(orderId, OrderStatus.collected);
  }

  // --- Cart ---
  void addToCart(FoodItem food) {
    final index = _cart.indexWhere((c) => c.food.id == food.id);
    if (index != -1) {
      _cart[index].quantity++;
    } else {
      _cart.add(CartItem(food: food));
    }
    notifyListeners();
  }

  void removeFromCart(String foodId) {
    _cart.removeWhere((c) => c.food.id == foodId);
    notifyListeners();
  }

  void incrementQty(String foodId) {
    final index = _cart.indexWhere((c) => c.food.id == foodId);
    if (index != -1) {
      _cart[index].quantity++;
      notifyListeners();
    }
  }

  void decrementQty(String foodId) {
    final index = _cart.indexWhere((c) => c.food.id == foodId);
    if (index != -1) {
      if (_cart[index].quantity > 1) {
        _cart[index].quantity--;
      } else {
        _cart.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // --- Wishlist ---
  bool isInWishlist(String foodId) {
    return _wishlist.any((f) => f.id == foodId);
  }

  void toggleWishlist(FoodItem food) {
    if (isInWishlist(food.id)) {
      _wishlist.removeWhere((f) => f.id == food.id);
    } else {
      _wishlist.add(food);
    }
    notifyListeners();
  }
}

import 'food_model.dart';

enum OrderStatus { placed, preparing, ready, collected }

class Order {
  final String id;
  final List<CartItem> items;
  final double totalAmount;
  final DateTime timestamp;
  final OrderStatus status;
  final String paymentMethod;

  const Order({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.timestamp,
    required this.status,
    required this.paymentMethod,
  });

  Order copyWith({
    String? id,
    List<CartItem>? items,
    double? totalAmount,
    DateTime? timestamp,
    OrderStatus? status,
    String? paymentMethod,
  }) {
    return Order(
      id: id ?? this.id,
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  String get statusText {
    switch (status) {
      case OrderStatus.placed:
        return 'Order Placed';
      case OrderStatus.preparing:
        return 'Food is Cooking';
      case OrderStatus.ready:
        return 'Notify student to get on cafe';
      case OrderStatus.collected:
        return 'Collected';
    }
  }
}

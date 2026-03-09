import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../services/app_state.dart';
import '../../models/order_model.dart';
import '../../widgets/custom_button.dart';

class OrderTrackingScreen extends StatefulWidget {
  final AppState appState;
  final String orderId;

  const OrderTrackingScreen({super.key, required this.appState, required this.orderId});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  Order? _order;

  @override
  void initState() {
    super.initState();
    _refreshOrder();
    widget.appState.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    if (mounted) {
      setState(() {
        _refreshOrder();
      });
    }
  }

  void _refreshOrder() {
    try {
      _order = widget.appState.activeOrders.firstWhere((o) => o.id == widget.orderId);
    } catch (e) {
      _order = null;
    }
  }

  @override
  void dispose() {
    widget.appState.removeListener(_onStateChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_order == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Order Not Found')),
        body: const Center(child: Text('We could not find this order.')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Order ${_order!.id}', style: const TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context), // Typically goes back to Home or Orders
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              _buildBigStatusIcon(),
              const SizedBox(height: 24),
              Text(
                _order!.statusText,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.textDark),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              if (_order!.status == OrderStatus.ready)
                const Text(
                  'Your meal is hot and waiting for you at the counter!',
                  style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              else if (_order!.status == OrderStatus.preparing)
                const Text(
                  'The chefs are putting it together...',
                  style: TextStyle(fontSize: 16, color: Colors.orange),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 48),
              _buildTimeline(),
              const SizedBox(height: 48),
              CustomButton(
                text: 'Back to Home',
                onPressed: () {
                  // Pop until student home
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBigStatusIcon() {
    IconData icon;
    Color color;

    switch (_order!.status) {
      case OrderStatus.placed:
        icon = Icons.receipt_long;
        color = Colors.blue;
        break;
      case OrderStatus.preparing:
        icon = Icons.soup_kitchen;
        color = Colors.orange;
        break;
      case OrderStatus.ready:
        icon = Icons.notifications_active;
        color = Colors.green;
        break;
      case OrderStatus.collected:
        icon = Icons.check_circle;
        color = Colors.grey;
        break;
    }

    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(icon, size: 60, color: color),
      ),
    );
  }

  Widget _buildTimeline() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          _buildTimelineStep(
            'Order Received', 
            Icons.receipt, 
            _order!.status.index >= OrderStatus.placed.index,
            isFirst: true,
          ),
          _buildTimelineStep(
            'Food is Cooking', 
            Icons.restaurant, 
            _order!.status.index >= OrderStatus.preparing.index,
          ),
          _buildTimelineStep(
            'Notify student to get on cafe', 
            Icons.notifications, 
            _order!.status.index >= OrderStatus.ready.index,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineStep(String label, IconData icon, bool isActive, {bool isFirst = false, bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: isActive ? Colors.white : Colors.grey.shade500, size: 20),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isActive ? AppColors.primary : Colors.grey.shade200,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Container(
          height: 40,
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              color: isActive ? AppColors.textDark : Colors.grey.shade400,
            ),
          ),
        ),
      ],
    );
  }
}

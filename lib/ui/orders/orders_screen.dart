import 'package:flutter/material.dart';

import 'orders_manager.dart';
import 'order_item_card.dart';

class OrdersSceen extends StatelessWidget {
  const OrdersSceen({super.key});

  @override
  Widget build(BuildContext context) {
    print("building orders");
    final ordersManager = OrdersManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => OrderItemCard(ordersManager.orders[i]),
        itemCount: ordersManager.orderCount,
      ),
    );
  }
}
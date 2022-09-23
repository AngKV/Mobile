import 'package:flutter/material.dart';

import 'orders_manager.dart';
import 'order_item_card.dart';
import '../share/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeN = '/orders';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("building orders");
    final ordersManager = OrdersManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, i) => OrderItemCard(ordersManager.orders[i]),
        itemCount: ordersManager.orderCount,
      ),
    );
  }
}

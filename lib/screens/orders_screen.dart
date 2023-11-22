import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static const routeName = '/oders';
  @override
  Widget build(BuildContext context) {
    final orderInfo = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItem(orderInfo.orders[i]),
        itemCount: orderInfo.orders.length,
      ),
    );
  }
}

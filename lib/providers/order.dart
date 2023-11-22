import 'package:flutter/foundation.dart';

import 'cart.dart';

class OrderModel {
  final String id;
  final List<CartModel> products;
  final double amount;
  final DateTime datetime;

  OrderModel({
    required this.id,
    required this.amount,
    required this.datetime,
    required this.products,
  });
}

class Orders with ChangeNotifier {
  List<OrderModel> _orders = [];

  List<OrderModel> get orders {
    return [..._orders];
  }

  void addOrders(List<CartModel> cartProducts, double total) {
    _orders.insert(
      0,
      OrderModel(
        id: DateTime.now().toString(),
        amount: total,
        datetime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }

  void removeOrders() {
    _orders = [];
    notifyListeners();
  }
}

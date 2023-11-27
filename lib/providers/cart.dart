import 'package:flutter/foundation.dart';

class CartModel {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartModel({
    required this.id,
    required this.quantity,
    required this.title,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmout {
    var total = 0.00;
    _items.forEach(
      (key, cartItem) {
        total += cartItem.price * cartItem.quantity;
      },
    );
    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => CartModel(
          id: existingItem.id,
          quantity: existingItem.quantity + 1,
          title: existingItem.title,
          price: existingItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartModel(
          id: DateTime.now().toString(),
          quantity: 1,
          title: title,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (existingItem) => CartModel(
          id: existingItem.id,
          quantity: existingItem.quantity - 1,
          title: existingItem.title,
          price: existingItem.price,
        ),
      );
    } else {
      _items.remove(productId);
      notifyListeners();
    }
    notifyListeners();
  }

  void clearItem() {
    _items = {};
    notifyListeners();
  }
}

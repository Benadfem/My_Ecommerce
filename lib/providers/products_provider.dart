// ignore_for_file: unused_element, unused_field

import 'package:flutter/foundation.dart';

class ProductModelProvider with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isfavorite;

  ProductModelProvider({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isfavorite = false,
  });

  void toggleFavoriteStatus() {
    isfavorite = !isfavorite;
    notifyListeners();
  }
}

class ProductsProvider with ChangeNotifier {
  final List<ProductModelProvider> _items = [
    ProductModelProvider(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    ProductModelProvider(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    ProductModelProvider(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    ProductModelProvider(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  var _showFavorites = false;

  List<ProductModelProvider> get items {
    return [..._items];
  }

  List<ProductModelProvider> get favoriteItems {
    return _items.where((prodItem) => prodItem.isfavorite).toList();
  }

  void _showFavoritesOnly() {
    _showFavorites = true;
    notifyListeners();
  }

  void _showAll() {
    _showFavorites = false;
    notifyListeners();
  }

  ProductModelProvider findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(ProductModelProvider product) {
    final newProduct = ProductModelProvider(
        id: DateTime.now().toString(),
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl);

    _items.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String id, ProductModelProvider newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
    } else {
      if (kDebugMode) {
        print('...');
      }
    }
    notifyListeners();
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}

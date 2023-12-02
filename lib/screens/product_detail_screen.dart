import 'package:flutter/material.dart';
import 'package:my_shop/providers/products_provider.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../widgets/badge.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  static const routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct = Provider.of<ProductsProvider>(context, listen: false)
        .findById(productId);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
        actions: [
          Badger(
            value: cart.itemCount.toString(),
            color: Theme.of(context).colorScheme.onSecondary,
            child: Container(
              padding: const EdgeInsets.all(2),
              child: TextButton.icon(
                label: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Image.network(
                  alignment: Alignment.center,
                  loadedProduct.imageUrl,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${loadedProduct.price}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                width: double.infinity,
                child: Text(
                  loadedProduct.description,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    cart.addItem(
                      loadedProduct.id,
                      loadedProduct.title,
                      loadedProduct.price,
                    );
                  },
                  icon: const Icon(Icons.shopping_cart, color: Colors.orange),
                  label: const Text('ADD TO CART'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


 // IconButton(
          //   

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

import '../providers/products_provider.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<ProductModelProvider>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        header: Text(
          product.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            '${product.price}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Consumer<ProductModelProvider>(
              builder: (ctx, product, _) => IconButton(
                    onPressed: () {
                      product.toggleFavoriteStatus();
                    },
                    icon: Icon(
                      product.isfavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                  )),
          trailing: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Item Added to Cart'),
                  action: SnackBarAction(
                      label: ('UNDO'),
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                      }),
                ),
              );
              cart.addItem(
                product.id,
                product.title,
                product.price,
              );
            },
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: product.id),
          child: Image(
            image: NetworkImage(
              product.imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}

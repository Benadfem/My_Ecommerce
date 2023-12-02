import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import 'form_screen.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({super.key});

  static const routeName = '/user-product';
  @override
  Widget build(BuildContext context) {
    final userProduct = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit User Product'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(FormScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => Column(
          children: [
            UserProductItem(
              userProduct.items[i].id,
              userProduct.items[i].title,
              userProduct.items[i].imageUrl,
            ),
            const Divider(),
          ],
        ),
        itemCount: userProduct.items.length,
      ),
    );
  }
}

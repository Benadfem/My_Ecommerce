import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../screens/form_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const UserProductItem(this.id, this.title, this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListTile(
        title: Text(title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(FormScreen.routeName, arguments: id);
                },
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              IconButton(
                onPressed: () {
                  Provider.of<ProductsProvider>(context, listen: false)
                      .deleteProduct(id);
                },
                icon: Icon(Icons.delete,
                    color: Theme.of(context).colorScheme.error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_shop/screens/user_product_screen.dart';
import 'package:provider/provider.dart';

import 'providers/cart.dart';
import 'providers/order.dart';
import 'providers/products_provider.dart';
import 'screens/cart_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/product_overview_screen.dart';

void main() => runApp(const MyShop());

class MyShop extends StatelessWidget {
  const MyShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvivder(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'My Shop Application',
        theme: ThemeData(
          // Declare the color scheme
          colorScheme: const ColorScheme(
            primary: Colors.purple, // Darker shade of the primary color
            secondary: Colors.green, // Darker shade of the secondary color
            surface: Colors.white, // Surface color (background)
            background: Colors.white, // Background color
            error: Colors.red, // Error color
            onPrimary:
                Colors.white, // Color for text/icons on the primary color
            onSecondary: Colors
                .deepOrange, // Color for text/icons on the secondary color
            onSurface:
                Colors.black, // Color for text/icons on the surface color
            onBackground:
                Colors.black, // Color for text/icons on the background color
            onError: Colors.white, // Color for text/icons on the error color
            brightness: Brightness
                .light, // Brightness of the color scheme (light or dark)
          ),
        ),
        home: const ProductOverveiwScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          UserProductScreen.routeName: (ctx) => const UserProductScreen(),
        },
      ),
    );
  }
}

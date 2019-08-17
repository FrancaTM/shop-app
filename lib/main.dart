import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_shop_app/screens/product_detail_screen.dart';
import 'package:my_shop_app/screens/products_overview_screen.dart';
import 'package:my_shop_app/providers/products_provider.dart';
import 'package:my_shop_app/providers/cart_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: ProductsOverviewScreen(),
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}

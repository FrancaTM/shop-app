import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_shop_app/widgets/product_item.dart';
import 'package:my_shop_app/providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavotires;

  ProductsGrid(this.showFavotires);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products =
        showFavotires ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          // builder: (ctx) => products[index],
          value: products[index],
          child: ProductItem(
              // id: products[index].id,
              // title: products[index].title,
              // imageUrl: products[index].imageUrl,
              ),
        );
      },
    );
  }
}

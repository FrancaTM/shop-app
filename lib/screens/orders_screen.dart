import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_shop_app/widgets/app_drawer.dart';
import 'package:my_shop_app/providers/orders_provider.dart' show OrdersProvider;
import 'package:my_shop_app/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, index) => OrderItem(orderData.orders[index]),
      ),
    );
  }
}
